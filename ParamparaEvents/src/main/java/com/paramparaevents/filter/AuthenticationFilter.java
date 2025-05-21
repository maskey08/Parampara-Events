package com.paramparaevents.filter;

import com.paramparaevents.model.UserModel;
import com.paramparaevents.service.UserService;
import com.paramparaevents.util.CookieUtil;
import com.paramparaevents.util.SessionUtil;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final String REMEMBER_ME_COOKIE_NAME = "rememberMeUser";

    private static final String ROLE_ADMIN = "admin";
    private static final String ROLE_CUSTOMER = "customer";

    private static final Set<String> PUBLIC_URIS = new HashSet<>(Arrays.asList(
        "/", "/home", "/gallery", "/contactus", "/aboutus",
        "/registration", "/login", "/services", "/loginregister"
    ));

    private static final Set<String> CUSTOMER_URIS = new HashSet<>(Arrays.asList(
        "/booking", "/profile", "/logout"
    ));

    private static final Set<String> ADMIN_URIS = new HashSet<>(Arrays.asList(
        "/admindashboard", "/manageuser", "/manageservices", "/logout"
    ));

    private UserService userService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        userService = new UserService();
        System.out.println("AuthenticationFilter initialized.");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        if (request.getDispatcherType() != DispatcherType.REQUEST) {
            chain.doFilter(request, response);
            return;
        }

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String relativeRequestURI = requestURI.substring(contextPath.length());

        // Normalize trailing slash
        if (relativeRequestURI.endsWith("/")) {
            relativeRequestURI = relativeRequestURI.substring(0, relativeRequestURI.length() - 1);
        }
        if (relativeRequestURI.isEmpty()) {
            relativeRequestURI = "/";
        }

        if (isPublicURI(relativeRequestURI)) {
            chain.doFilter(request, response);
            return;
        }

        boolean isAuthenticated = SessionUtil.isLoggedIn(httpRequest);
        UserModel user = null;

        if (isAuthenticated) {
            user = SessionUtil.getLoggedInUser(httpRequest);
        } else {
            // Try remember me
            Cookie rememberMeCookie = CookieUtil.getCookie(httpRequest, REMEMBER_ME_COOKIE_NAME);
            if (rememberMeCookie != null) {
                try {
                    String username = rememberMeCookie.getValue();
                    user = userService.findUserByUsername(username);
                    if (user != null) {
                        SessionUtil.setLoggedInUser(httpRequest, user);
                        isAuthenticated = true;
                    } else {
                        CookieUtil.deleteCookie(httpResponse, REMEMBER_ME_COOKIE_NAME);
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    CookieUtil.deleteCookie(httpResponse, REMEMBER_ME_COOKIE_NAME);
                }
            }
        }

        if (!isAuthenticated) {
            redirectToLogin(httpRequest, httpResponse);
            return;
        }

        user = SessionUtil.getLoggedInUser(httpRequest);
        String role = user != null ? user.getRole() : null;

        if (isAuthorized(role, relativeRequestURI)) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(contextPath + "/unauthorized.jsp");
        }

        System.out.println("Intercepted URI: " + relativeRequestURI);
        System.out.println("Authenticated: " + isAuthenticated);
    }

    private boolean isPublicURI(String uri) {
        return PUBLIC_URIS.stream().anyMatch(uri::equals)
            || uri.matches(".*(\\.css|\\.js|\\.png|\\.jpg|\\.jpeg|\\.gif|\\.woff2|\\.ttf)$");
    }

    private boolean isAuthorized(String role, String uri) {
        if (isPublicURI(uri)) return true;

        if (ROLE_CUSTOMER.equals(role) && CUSTOMER_URIS.stream().anyMatch(uri::startsWith)) {
            return true;
        }

        if (ROLE_ADMIN.equals(role) && ADMIN_URIS.stream().anyMatch(uri::startsWith)) {
            return true;
        }

        return false;
    }

    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/login");
    }

    @Override
    public void destroy() {
        System.out.println("AuthenticationFilter destroyed.");
    }
}

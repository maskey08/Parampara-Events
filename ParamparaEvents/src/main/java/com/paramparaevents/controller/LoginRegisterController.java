package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paramparaevents.model.UserModel;
import com.paramparaevents.service.LoginService;
import com.paramparaevents.util.CookieUtil;
import com.paramparaevents.util.SessionUtil;

/**
 * Servlet implementation class LoginRegisterController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/loginregister"})
public class LoginRegisterController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    
	    private final LoginService loginService;
	    
	    // Session attribute constants for consistent naming
	    public static final String SESSION_USERNAME = "username";
	    public static final String SESSION_USER_AUTHENTICATED = "authenticated";
	    public static final String SESSION_USER_ROLE = "userRole";
	    
	    /**
	     * Constructor initializes the LoginService.
	     */
	    public LoginRegisterController() {
	        this.loginService = new LoginService();
	    }
	    
	    /**
	     * Handles GET requests to the login page.
	     *
	     * @param request HttpServletRequest object
	     * @param response HttpServletResponse object
	     * @throws ServletException if a servlet-specific error occurs
	     * @throws IOException if an I/O error occurs
	     */
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Check if user is already logged in
	        if (isUserLoggedIn(request)) {
	            // Get role from session
	            String role = (String) SessionUtil.getAttribute(request, SESSION_USER_ROLE);
	            if ("admin".equals(role)) {
	                response.sendRedirect(request.getContextPath() + "/dashboard");
	                return;
	            } else {
	                response.sendRedirect(request.getContextPath() + "/home");
	                return;
	            }
	        }
	        
	        request.getRequestDispatcher("/WEB-INF/pages/test.jsp").forward(request, response);
	    }
	    
	    /**
	     * Handles POST requests for user login.
	     *
	     * @param request HttpServletRequest object
	     * @param response HttpServletResponse object
	     * @throws ServletException if a servlet-specific error occurs
	     * @throws IOException if an I/O error occurs
	     */
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String rememberMe = request.getParameter("rememberMe"); // Added remember me feature
	        
	        // Basic validation
	        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
	            handleLoginFailure(request, response, false, "Username and password are required");
	            return;
	        }
	        
	        UserModel userModel = new UserModel(username, password);
	        Boolean loginStatus = loginService.loginUser(userModel);
	        
	        if (loginStatus != null && loginStatus) {
	            // Create and set session attributes
	            HttpSession session = request.getSession(true);
	            session.setAttribute(SESSION_USERNAME, username);
	            session.setAttribute(SESSION_USER_AUTHENTICATED, true);
	            
	            String role = "customer";
	            if (username.equals("admin")) {
	                role = "admin";
	            }
	            
	            // Set role in session
	            session.setAttribute(SESSION_USER_ROLE, role);
	            
	            // Set cookies based on remember-me option
	            int cookieMaxAge = "true".equals(rememberMe) ? 60 * 60 * 24 * 30 : -1; // 30 days or session
	            
	            if (cookieMaxAge > 0) {
	                CookieUtil.addCookie(response, "role", role, cookieMaxAge);
	                CookieUtil.addCookie(response, "username", username, cookieMaxAge);
	            }
	            
	            System.out.println("Login successful for user: " + username + " with role: " + role);
	            
	            // Check if there was a previously requested URL stored in the session
	            String requestedURL = (String) session.getAttribute("requestedURL");
	            session.removeAttribute("requestedURL"); // Clear it
	            
	            // Redirect based on role or requested URL
	            if (requestedURL != null && !requestedURL.contains("/admin") && !requestedURL.contains("/dashboard")) {
	                // Redirect to the originally requested URL (if not admin page for non-admins)
	                response.sendRedirect(requestedURL);
	            } else if ("admin".equals(role)) {
	                System.out.println("Redirecting to /dashboard");
	                response.sendRedirect(request.getContextPath() + "/dashboard");
	            } else {
	                System.out.println("Redirecting to /home");
	                response.sendRedirect(request.getContextPath() + "/home");
	            }
	        } else {
	            handleLoginFailure(request, response, loginStatus, null);
	        }
	    }
	    
	    /**
	     * Checks if a user is currently logged in.
	     *
	     * @param request HttpServletRequest object
	     * @return boolean indicating if the user is logged in
	     */
	    private boolean isUserLoggedIn(HttpServletRequest request) {
	        Object authenticated = SessionUtil.getAttribute(request, SESSION_USER_AUTHENTICATED);
	        return authenticated != null && (Boolean) authenticated;
	    }
	    
	    /**
	     * Handles login failures by setting attributes and forwarding to the login page.
	     *
	     * @param req HttpServletRequest object
	     * @param resp HttpServletResponse object
	     * @param loginStatus Boolean indicating the login status
	     * @param customMessage Optional custom error message
	     * @throws ServletException if a servlet-specific error occurs
	     * @throws IOException if an I/O error occurs
	     */
	    private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus, String customMessage)
	            throws ServletException, IOException {
	        String errorMessage;
	        
	        if (customMessage != null) {
	            errorMessage = customMessage;
	        } else if (loginStatus == null) {
	            errorMessage = "Our server is under maintenance. Please try again later!";
	        } else {
	            errorMessage = "User credential mismatch. Please try again!";
	        }
	        
	        req.setAttribute("error", errorMessage);
	        System.out.println(errorMessage);
	        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	    }

}

package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.paramparaevents.util.CookieUtil;
import com.paramparaevents.util.SessionUtil;

/**
 * Controller for handling user logout
 */
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Handles GET requests for logout
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Clear session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        // Clear cookies
        CookieUtil.deleteCookie(response, "role");
        CookieUtil.deleteCookie(response, "username");
        
        // Add logout message
        request.setAttribute("message", "You have been successfully logged out.");
        
        // Log the logout
        System.out.println("User logged out successfully");
        
        // Redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
    }
    
    /**
     * POST requests are handled the same as GET for logout
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
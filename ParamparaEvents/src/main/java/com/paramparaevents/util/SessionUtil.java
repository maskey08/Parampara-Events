package com.paramparaevents.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.paramparaevents.model.UserModel;

/**
 * Utility class for session management
 */
public class SessionUtil {
    
    private static final String USER_SESSION_KEY = "loggedInUser";
    private static final String AUTHENTICATED_KEY = "authenticated";
    
    /**
     * Sets an attribute in the session.
     * 
     * @param request HttpServletRequest object
     * @param name Attribute name
     * @param value Attribute value
     */
    public static void setAttribute(HttpServletRequest request, String name, Object value) {
        HttpSession session = request.getSession(true); // Create session if it doesn't exist
        session.setAttribute(name, value);
    }
    
    /**
     * Gets an attribute from the session.
     * 
     * @param request HttpServletRequest object
     * @param name Attribute name
     * @return Object attribute value or null if not found
     */
    public static Object getAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false); // Don't create a session if it doesn't exist
        if (session != null) {
            return session.getAttribute(name);
        }
        return null;
    }
    
    /**
     * Removes an attribute from the session.
     * 
     * @param request HttpServletRequest object
     * @param name Attribute name
     */
    public static void removeAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(name);
        }
    }
    
    /**
     * Invalidates the current session.
     * 
     * @param request HttpServletRequest object
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    
    /**
     * Checks if a user is logged in.
     * 
     * @param request HttpServletRequest object
     * @return boolean true if user is logged in, false otherwise
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        Boolean authenticated = (Boolean) getAttribute(request, AUTHENTICATED_KEY);
        return authenticated != null && authenticated;
    }
    
    /**
     * Set the logged in user in the session
     * 
     * @param request The HTTP request
     * @param user The user to set as logged in
     */
    public static void setLoggedInUser(HttpServletRequest request, UserModel user) {
        setAttribute(request, USER_SESSION_KEY, user);
        setAttribute(request, AUTHENTICATED_KEY, true);
    }
    
    /**
     * Get the currently logged in user
     * 
     * @param request The HTTP request
     * @return UserModel of the logged in user, or null if not logged in
     */
    public static UserModel getLoggedInUser(HttpServletRequest request) {
        return (UserModel) getAttribute(request, USER_SESSION_KEY);
    }
    
    /**
     * Log out the current user
     * 
     * @param request The HTTP request
     */
    public static void logout(HttpServletRequest request) {
        removeAttribute(request, USER_SESSION_KEY);
        removeAttribute(request, AUTHENTICATED_KEY);
        invalidateSession(request);
    }
    
    /**
     * Check if the current user has a specific role
     * 
     * @param request The HTTP request
     * @param role The role to check
     * @return boolean indicating if the user has the role
     */
    public static boolean hasRole(HttpServletRequest request, String role) {
        UserModel user = getLoggedInUser(request);
        return user != null && role.equals(user.getRole());
    }
    
    /**
     * Set a flash message to be displayed on the next page
     * 
     * @param request The HTTP request
     * @param message The message to flash
     * @param type The type of message (e.g., "success", "error", "info")
     */
    public static void setFlashMessage(HttpServletRequest request, String message, String type) {
        setAttribute(request, "flashMessage", message);
        setAttribute(request, "flashType", type);
    }
    
    /**
     * Get and clear the flash message
     * 
     * @param request The HTTP request
     * @return The flash message, or null if none
     */
    public static String getFlashMessage(HttpServletRequest request) {
        String message = (String) getAttribute(request, "flashMessage");
        if (message != null) {
            removeAttribute(request, "flashMessage");
        }
        return message;
    }
    
    /**
     * Get and clear the flash message type
     * 
     * @param request The HTTP request
     * @return The flash message type, or null if none
     */
    public static String getFlashType(HttpServletRequest request) {
        String type = (String) getAttribute(request, "flashType");
        if (type != null) {
            removeAttribute(request, "flashType");
        }
        return type;
    }
}
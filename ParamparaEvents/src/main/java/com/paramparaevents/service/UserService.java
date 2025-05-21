package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import com.paramparaevents.model.UserModel;
import com.paramparaevents.util.DatabaseUtil;

/**
 * Service class for user-related operations including authentication,
 * registration, and user data management.
 */
public class UserService {
    
    // In-memory storage for remember-me tokens (in production, this should be in a database)
    private static final Map<String, String> rememberMeTokens = new HashMap<>();
    
    /**
     * Find a user by their username
     * 
     * @param username The username to search for
     * @return UserModel if found, null otherwise
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public UserModel findUserByUsername(String username) throws SQLException, ClassNotFoundException {
        UserModel user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM users WHERE userName = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                user = new UserModel();
                user.setId(rs.getString("id"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setNumber(rs.getString("number"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } finally {
            // Close resources in reverse order
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
        
        return user;
    }
    
    /**
     * Find a user by their email address
     * 
     * @param email The email to search for
     * @return UserModel if found, null otherwise
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public UserModel findUserByEmail(String email) throws SQLException, ClassNotFoundException {
        UserModel user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM users WHERE email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                user = new UserModel();
                user.setId(rs.getString("id"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setNumber(rs.getString("number"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
        
        return user;
    }
    
    /**
     * Authenticate a user with username and password
     * 
     * @param username The username
     * @param password The plaintext password
     * @return UserModel if authentication successful, null otherwise
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public UserModel authenticateUser(String username, String password) throws SQLException, ClassNotFoundException {
        UserModel user = findUserByUsername(username);
        
        if (user != null) {
            // In a real application, password should be hashed - this is a simple example
            // Ideally, we'd use a secure hashing algorithm like bcrypt or Argon2
            if (verifyPassword(password, user.getPassword())) {
                return user;
            }
        }
        
        return null; // Authentication failed
    }
    
    /**
     * Register a new user
     * 
     * @param user The user to register
     * @return boolean indicating if registration was successful
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public boolean registerUser(UserModel user) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Check if user already exists
            if (findUserByUsername(user.getUserName()) != null || 
                findUserByEmail(user.getEmail()) != null) {
                return false; // User already exists
            }
            
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO users (userName, email, number, password, role) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getNumber());
            
            // Hash the password before storing
            String hashedPassword = hashPassword(user.getPassword());
            stmt.setString(4, hashedPassword);
            
            // Default role for new users
            stmt.setString(5, user.getRole() != null ? user.getRole() : "USER");
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
    
    /**
     * Create a remember me token for a user
     * 
     * @param username The username to create a token for
     * @return The token string
     */
    public String createRememberMeToken(String username) {
        String token = generateSecureToken();
        // In production, store this in database with expiration
        rememberMeTokens.put(token, username);
        return token;
    }
    
    /**
     * Validate a remember me token and return the associated user
     * 
     * @param token The token to validate
     * @return UserModel if token is valid, null otherwise
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public UserModel validateRememberMeToken(String token) throws SQLException, ClassNotFoundException {
        String username = rememberMeTokens.get(token);
        if (username != null) {
            return findUserByUsername(username);
        }
        return null;
    }
    
    /**
     * Delete a remember me token
     * 
     * @param token The token to delete
     */
    public void deleteRememberMeToken(String token) {
        rememberMeTokens.remove(token);
    }
    
    /**
     * Update a user's information
     * 
     * @param user The user with updated information
     * @return boolean indicating if update was successful
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public boolean updateUser(UserModel user) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "UPDATE users SET email = ?, number = ? WHERE userName = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getNumber());
            stmt.setString(3, user.getUserName());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
    
    /**
     * Change a user's password
     * 
     * @param username The username
     * @param newPassword The new password
     * @return boolean indicating if password change was successful
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public boolean changePassword(String username, String newPassword) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "UPDATE users SET password = ? WHERE userName = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, hashPassword(newPassword));
            stmt.setString(2, username);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
    
    // ----- Helper methods -----
    
    /**
     * Generate a secure random token
     * 
     * @return A random token string
     */
    private String generateSecureToken() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[32]; // 256 bits
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
    
    /**
     * Hash a password using SHA-256
     * Note: In production, use a more secure algorithm like bcrypt or Argon2
     * 
     * @param password The password to hash
     * @return The hashed password
     */
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
    
    /**
     * Verify a password against its hash
     * 
     * @param password The plaintext password
     * @param hashedPassword The hashed password
     * @return boolean indicating if the password matches
     */
    private boolean verifyPassword(String password, String hashedPassword) {
        String hashed = hashPassword(password);
        return hashed.equals(hashedPassword);
    }
}
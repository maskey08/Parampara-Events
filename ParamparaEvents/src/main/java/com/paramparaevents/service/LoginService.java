package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.util.PasswordUtil;
import com.paramparaevents.model.UserModel;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param userModel the UserModel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public Boolean loginUser(UserModel userModel) {
	    if (isConnectionError) {
	        System.out.println("Connection Error!");
	        return null;
	    }
	    
	    String query = "SELECT Username, Password, Role FROM customer WHERE Username = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, userModel.getUserName());
	        ResultSet result = stmt.executeQuery();
	        
	        // Check if the result set has any rows BEFORE trying to access data
	        if (result.next()) {
	            // Now it's safe to retrieve data from the result set
	            System.out.println("DB User: " + result.getString("Username"));
	            System.out.println("Role: " + result.getString("Role"));
	            
	            // Call validatePassword to check if credentials match
	            return validatePassword(result, userModel);
	        } else {
	            // No user found with the given username
	            System.out.println("No user found with username: " + userModel.getUserName());
	            return false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	/**
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param userModel the UserModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
		String dbUsername = result.getString("username");
		String dbPassword = result.getString("password");

		return dbUsername.equals(userModel.getUserName())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(userModel.getPassword());
	}
}
package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;


import com.islington.util.ValidationUtil;

/**
 * Servlet implementation class registration
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/registration", "/" })
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/registration.jsp").forward(request, response);	
		}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String validationMessage = validateRegistrationForm(req);
			if (validationMessage != null) {
				handleError(req, resp, validationMessage);
				return;
			}
		}
	
	
		

			
	

	private String validateRegistrationForm(HttpServletRequest req) {
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String username = req.getParameter("username");
		String dobStr = req.getParameter("DOB");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String number = req.getParameter("number");
		String subject = req.getParameter("subject");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("repassword");

		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(firstName))
			return "First name is required.";
		if (ValidationUtil.isNullOrEmpty(lastName))
			return "Last name is required.";
		if (ValidationUtil.isNullOrEmpty(username))
			return "Username is required.";
		if (ValidationUtil.isNullOrEmpty(dobStr))
			return "Date of birth is required.";
		if (ValidationUtil.isNullOrEmpty(gender))
			return "Gender is required.";
		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";
		if (ValidationUtil.isNullOrEmpty(number))
			return "Phone number is required.";
		if (ValidationUtil.isNullOrEmpty(subject))
			return "Subject is required.";
		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		if (ValidationUtil.isNullOrEmpty(retypePassword))
			return "Please retype the password.";

		// Convert date of birth
		LocalDate dob;
		try {
			dob = LocalDate.parse(dobStr);
		} catch (Exception e) {
			return "Invalid date format. Please use YYYY-MM-DD.";
		}

		// Validate fields
		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
			return "Username must start with a letter and contain only letters and numbers.";
		if (!ValidationUtil.isValidGender(gender))
			return "Gender must be 'male' or 'female'.";
		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";
		if (!ValidationUtil.isValidPhoneNumber(number))
			return "Phone number must be 10 digits and start with 98.";
		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
			return "Passwords do not match.";

		// Check if the date of birth is at least 16 years before today
		if (!ValidationUtil.isAgeAtLeast16(dob))
			return "You must be at least 16 years old to register." ;
		}


	
	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException {
		req.setAttribute("error", message);
		req.setAttribute("firstname", req.getParameter("firstname"));
		req.setAttribute("lastname", req.getParameter("lastname"));
		req.setAttribute("username", req.getParameter("username"));
		req.setAttribute("DOB", req.getParameter("DOB"));
		req.setAttribute("gender", req.getParameter("gender"));
		req.setAttribute("email", req.getParameter("email"));
		req.setAttribute("number", req.getParameter("number"));
		req.setAttribute("subject", req.getParameter("subject"));
		req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
	}
}

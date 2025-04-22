package com.paramparaevents.util;

public class UserModel {

	private String userName;
	private String email;
	private String number;
	private String password;
		
	public UserModel() {}
	
	public UserModel(String username, String pasword) {
		this.userName = username;
		this.password = pasword;
	}


	public UserModel( String userName, String email, String number, String password) {
		super();

		this.userName = userName;
		this.email = email;
		this.number = number;
		this.password = password;

	}

	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	


}

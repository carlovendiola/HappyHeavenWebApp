package com.happyheaven.delegate;

import java.sql.SQLException;

import com.happyheaven.service.UserService;

public class LoginDelegate {
	
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public boolean isValidUser(String userName, String password) throws SQLException{
		
		return userService.isValidUser(userName, password);
	}

}

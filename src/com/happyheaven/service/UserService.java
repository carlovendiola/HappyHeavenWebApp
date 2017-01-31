package com.happyheaven.service;

import java.sql.SQLException;
import java.util.List;

import javax.swing.JTextArea;

import com.happyheaven.model.Trip;
import com.happyheaven.model.User;

public interface UserService {

	public boolean isValidUser(String userName, String password) throws SQLException;
	
	public List<User> getUsersByEmail(JTextArea emails, Trip trip);

}

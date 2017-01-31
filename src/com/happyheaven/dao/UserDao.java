package com.happyheaven.dao;

import java.sql.SQLException;
import java.util.List;

import com.happyheaven.model.Trip;
import com.happyheaven.model.User;


public interface UserDao {

	public boolean isValidUser(String userName, String password) throws SQLException;
	
	public List<User> searchUserByUserName(String userName);
	
	public Integer addOrUpdateUser(User user);
	
	public Boolean deleteUser(String userName);
	
	public List<User> searchUserByEmail(String email);
	

}

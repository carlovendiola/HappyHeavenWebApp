package com.happyheaven.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JTextArea;

import org.springframework.beans.factory.annotation.Autowired;

import com.happyheaven.dao.UserDao;
import com.happyheaven.model.Trip;
import com.happyheaven.model.User;
import com.happyheaven.service.UserService;
import com.happyheaven.string.util.StringUtil;

public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public boolean isValidUser(String userName, String password) throws SQLException
	{
		String hashedPassword = StringUtil.hashString(password);
		
		return userDao.isValidUser(userName, hashedPassword);
	}


	@Override
	public List<User> getUsersByEmail(JTextArea emails, Trip trip) {
		List<User> users = new ArrayList<User>();
		String organizer = trip.getTripOrganizer();
		
		User userOrganizer = userDao.searchUserByUserName(organizer).get(0);
		
		users.add(userOrganizer);
		
		
		if(null != emails && !"".equalsIgnoreCase(emails.getText())){
			String[] emailList = emails.getText().split("\r\n");
			
			User user = null;
			
			if(null != emailList && emailList.length > 0) {
				for(int i=0; i < emailList.length; i++){
					
					user = userDao.searchUserByEmail(emailList[i]).get(0);
					
					if(null != user){
						users.add(user);
					}
					
				}
			}
		}
		return users;
	}
	
	
}

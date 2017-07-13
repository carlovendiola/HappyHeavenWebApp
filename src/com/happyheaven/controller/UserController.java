package com.happyheaven.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.happyheaven.dao.UserDao;
import com.happyheaven.model.User;
import com.happyheaven.string.util.StringUtil;
import com.happyheaven.viewBean.UserBean;


@Controller
public class UserController{
	
	@Autowired
	private UserDao userDao;

	@RequestMapping(value="/searchUserByUserName", method=RequestMethod.POST)
	public ModelAndView searchUser(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model = null;
		User user = null;
		List<User> userList = userDao.searchUserByUserName(request.getParameter("userName"));
		
		if(null != userList && !userList.isEmpty())
		{
			System.out.println("User Found!");
			user = userList.get(0);
			model = new ModelAndView("welcome");
			model.addObject("user", user);
		}
		else
		{
			System.out.println("Invalid Credentials!!!");
			model = new ModelAndView("welcome");
			request.setAttribute("message", "Username does not exist");
		}
		return model; 
	}
	
	
	
	
	@RequestMapping(value="/addOrUpdateUser")
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userBean") UserBean userBean){
		
		ModelAndView model = null;
		
		User user = new User();
		
		List<User> userList = userDao.searchUserByUserName(userBean.getUserName());
		
		if(null != userList && !userList.isEmpty()) {
			user = userDao.searchUserByUserName(userBean.getUserName()).get(0);
		}
		
		user = mapUserBeanToUser(user, userBean);
		
		Integer userId = userDao.addOrUpdateUser(user);
		if(null != userId){
			System.out.println("User Added");
			model = new ModelAndView("addUserPopup");
			request.setAttribute("message", "New User/Updated user " + user.getFirstName() + " " + user.getLastName() + " Added Succesfully");
		}
		else {
			System.out.println("User not Added");
			model = new ModelAndView("addUserPopup");
			request.setAttribute("message", "Cannot Add Or Update User");
		}
		return model;
		
	}
	
	/* This method updates only the data that are entered by the user. If the field in the UI is null,
	 * the data does not change. */
	private User mapUserBeanToUser(User user, UserBean userBean)
	{
		String hashedPasswd;
		
		hashedPasswd = StringUtil.hashString(userBean.getPassword());
		
		if(null != userBean.getEmail() && !"".equals(userBean.getEmail())){
			user.setEmail(userBean.getEmail());
		}
		
		if(null != userBean.getFirstName() && !"".equals(userBean.getFirstName())){
			user.setFirstName(userBean.getFirstName());	
		}
		
		if(null != userBean.getLastName() && !"".equals(userBean.getLastName())){
			user.setLastName(userBean.getLastName());
		}
		
		if(null != userBean.getUserName() && !"".equals(userBean.getUserName())){
			user.setUserName(userBean.getUserName());
		}
		
		if(null != userBean.getPassword() && !"".equals(userBean.getPassword())){
			user.setPassword(hashedPasswd);
		}
		
		if(null != userBean.getRole() && !"".equals(userBean.getRole())){
			user.setRole(userBean.getRole());
		}
		
		return user;
		
	}
	
	
	@RequestMapping(value="/deleteUser")
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userBean") UserBean userBean)
	{
		ModelAndView model = null;
		
		Boolean isDeleted = userDao.deleteUser(userBean.getUserName());
		
		if(isDeleted){
			System.out.println("User Deleted!");
			
		}
		else{
			System.out.println("User not Deleted");
		}
		
		model  = new ModelAndView("deleteUser");
		return model;
	}
	
	@RequestMapping(value="/addUserPopup")
	public ModelAndView showAddUserPopup(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userBean") UserBean userBean){
		
		ModelAndView model = new ModelAndView("addUserPopup");
		return model;
	}
	
	@RequestMapping(value="/deleteUserPopup")
	public ModelAndView showDeleteUserPopup(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userBean") UserBean userBean){
		
		ModelAndView model = new ModelAndView("deleteUserPopup");
		return model;
	}
}

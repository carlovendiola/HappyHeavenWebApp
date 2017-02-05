package com.happyheaven.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.happyheaven.dao.UserDao;
import com.happyheaven.delegate.LoginDelegate;
import com.happyheaven.model.User;
import com.happyheaven.viewBean.LoginBean;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDelegate loginDelegate;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView displayLogin (HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView("login");
		LoginBean loginBean = new LoginBean();
		model.addObject("loginBean", loginBean);
		return model;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean)
	{
		ModelAndView model = null;
		try
		{
			boolean isValidUser = loginDelegate.isValidUser(loginBean.getUserName(), loginBean.getPassword());
			
			if(isValidUser)
			{
				System.out.println("User Login Successful");
				HttpSession session = request.getSession();
				User user = userDao.searchUserByUserName(loginBean.getUserName()).get(0);
				session.setAttribute("loggedInUser", (user.getFirstName() + " " + user.getLastName()));
				session.setAttribute("user" , user);
				model = new ModelAndView("welcome");
			}
			else
			{
				System.out.println("Invalid Credentials!!!");
				model = new ModelAndView("login");
				model.addObject("loginBean", loginBean);
				request.setAttribute("message", "Username or Password is Incorrect");
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return model;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String executeLogout(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login.html";
		
	}
	

}

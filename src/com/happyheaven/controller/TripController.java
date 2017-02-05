package com.happyheaven.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.happyheaven.dao.TripDao;
import com.happyheaven.dao.UserDao;
import com.happyheaven.model.Trip;
import com.happyheaven.model.User;
import com.happyheaven.service.UserService;
import com.happyheaven.viewBean.TripBean;

@Controller
public class TripController {
	
	@Autowired 
	TripDao tripDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserService userService;
	
	public UserService getUserService() {
		return userService;
	}
	
	@RequestMapping(value = "/openTripAssist")
	public ModelAndView openTripManager(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tripBean") TripBean tripBean){
		
		ModelAndView model = new ModelAndView("tripManager");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Trip> trips = tripDao.searchTripsByUser(user);
		model.addObject("trips", trips);
		return model;
	}
	
	@RequestMapping(value = "/viewTripDetails", method = RequestMethod.GET)
	public ModelAndView viewTripDetails(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tripBean") TripBean tripBean, @RequestParam("tripDetailId") String tripDetailId){
		
		ModelAndView model = new ModelAndView("tripDetail");
		HttpSession session = request.getSession();
		Integer tripId = Integer.valueOf(tripDetailId);
		
		List<Trip> trips = tripDao.searchTripByTripId(tripId);
		Trip trip = trips.get(0);
		tripBean.setTripName(trip.getTripName());
		tripBean.setTripDescription(trip.getTripDescription());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String tripStartDateString = sdf.format(trip.getTripStartDate());
		tripBean.setTripStartDate(tripStartDateString);
		String tripEndDateString = sdf.format(trip.getTripEndDate());
		tripBean.setTripEndDate(tripEndDateString);
		
		model.addObject("trip", trip);
		
		return model;
	}
	
	@RequestMapping(value = "/addOrUpdateTrip")
	public ModelAndView addOrUpdateTrip (HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tripBean") TripBean tripBean) throws ParseException{
		
		ModelAndView model = null;
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Integer tripId = tripBean.getTripId();
		Trip trip = new Trip();
		
		if(null == tripId){
			
			trip.setTripOrganizer(user.getUserName());
			
		}
		System.out.println(tripBean.getTripStartDate());
		
		trip = mapBeanToTrip(trip, tripBean);
		trip.setTripLastModifiedBy(user.getUserName());
		
		tripDao.addOrUpdateTrip(trip);
		model = new ModelAndView("addTripPopup");
		model.addObject("fromPage", tripBean.getFromPage());
		
		return model;
		
	}
	
	private Trip mapBeanToTrip(Trip trip, TripBean tripBean) throws ParseException
	{
		
		if(null != tripBean.getTripName() && !"".equals(tripBean.getTripName())){
			trip.setTripName(tripBean.getTripName());
		}
		
		if(null != tripBean.getTripDescription() && !"".equals(tripBean.getTripDescription())){
			trip.setTripDescription(tripBean.getTripDescription());
		}
		
		if(null != tripBean.getTripStartDate() && !"".equals(tripBean.getTripStartDate())){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date tripStartDate = sdf.parse(tripBean.getTripStartDate());
			trip.setTripStartDate(tripStartDate);
		}
		
		if(null != tripBean.getTripEndDate() && !"".equals(tripBean.getTripEndDate())){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date tripEndDate = sdf.parse(tripBean.getTripEndDate());
			trip.setTripEndDate(tripEndDate);
		}
		
		if(null != tripBean.getEmails() && !"".equals(tripBean.getEmails())){
			List<User> users = userService.getUsersByEmail(tripBean.getEmails(), trip);
			Set<User> userSet = new HashSet<User>(users);
			trip.setUsers(userSet);
		}
		
		return trip;
		
		
	}
	
	@RequestMapping(value = "/deleteTrip")
	public ModelAndView deleteTrip(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model = null;
		
		System.out.println(request.getParameter("tripId"));
		
		HttpSession session = request.getSession();
		String requestTripId = request.getParameter("tripId");
		String[] requestTripIds;
		
		
		List<Integer> tripIdList = new ArrayList<Integer>();
		Boolean isDeleted = false;
		if (null != requestTripId && !"".equalsIgnoreCase(requestTripId)){
			if(!requestTripId.contains(",")){
				
				
				tripIdList.add(Integer.valueOf(requestTripId));
				
			
			}
			else{
				
				requestTripIds = requestTripId.split(",");
				Integer[] requestTripIdsInt = new Integer[requestTripIds.length];
				
				for(int i=0; i < requestTripIds.length; i++){
					requestTripIdsInt[i] = Integer.valueOf((requestTripIds)[i]);
				}
				
				tripIdList = Arrays.asList(requestTripIdsInt);
			}
			
			isDeleted = tripDao.deleteTrip(tripIdList);
		}
		
		User user = (User) session.getAttribute("user");
		
		List<Trip> trips = tripDao.searchTripsByUser(user);
		
		
		if(isDeleted){
			System.out.println("Trip Successfully Deleted!");
		}
		else {
			System.out.println("Trip Not Deleted Successfully!");
		}
		
		model = new ModelAndView("tripManager");
		model.addObject("trips", trips);
		return model;
	}
	
	@RequestMapping(value = "/searchTripsByOrganizer")
	public ModelAndView searchTripsByOrganizer(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model = null;
		
		
		return model;
	}
	
	@RequestMapping(value="/addTripPopup")
	public ModelAndView showAddUserPopup(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tripBean") TripBean tripBean){
		
		ModelAndView model = new ModelAndView("addTripPopup");
		return model;
	}
	/*static UserDaoImpl userDaoImpl = new UserDaoImpl();
	
	 public static void main(String[] args) {
		 
	        SessionFactory sf = HibernateUtil.getSessionFactory();
	        Session session = sf.openSession();
	        session.beginTransaction();
	 
	        
	        Trip trip1 = new Trip();
	        Trip trip2 = new Trip();
	        trip1.setTripDescription("This is my new trip");
	        trip1.setTripOrganizer("olraxxx05");
	        trip2.setTripDescription("This is another new trip");
	        trip2.setTripOrganizer("olraxxx05");
	        
	        List<User> user3 = new ArrayList<User>();
	        user3 = userDaoImpl.searchUserByUserName("olraxxx05");
	        List<User> user4 = new ArrayList<User>();
	        user4 = userDaoImpl.searchUserByUserName("tibs");
	        
	        System.out.println(user3.get(0));
	        System.out.println(user4.get(0));
	        trip1.getUsers().add(user3.get(0));
	        trip1.getUsers().add(user4.get(0));
	        trip2.getUsers().add(user3.get(0));
	        
	        session.save(trip1);
	        session.save(trip2);
	        
	        session.getTransaction().commit();
	        session.close();
	    }*/

}

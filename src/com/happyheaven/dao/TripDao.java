package com.happyheaven.dao;

import java.util.List;
import java.util.Set;

import com.happyheaven.model.Trip;
import com.happyheaven.model.User;

public interface TripDao {
	
	public List<Trip> searchTripByTripId(Integer tripId);
	
	public List<Trip> searchTripsByOrganizer(String tripOrganizer);
	
	public Integer addOrUpdateTrip(Trip trip);
	
	public Boolean deleteTrip(Integer tripId);
	
	public Set<User> findAllUsersInTrip(Integer tripId);
	
	public Integer addOrUpdateUsersInTrip(Integer tripId, Set<User> users);
	
	public List<Trip> searchTripsByUser(User user);
	
	
}

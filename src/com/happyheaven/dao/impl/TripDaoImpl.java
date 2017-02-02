package com.happyheaven.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.happyheaven.dao.TripDao;
import com.happyheaven.hibernate.util.HibernateUtil;
import com.happyheaven.model.Trip;
import com.happyheaven.model.User;

public class TripDaoImpl implements TripDao{
	
	private DataSource dataSource;
	
	
	public DataSource getDataSource() {
		return dataSource;
	}



	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Trip> searchTripsByOrganizer(String tripOrganizer) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(Trip.class);
		criteria.add(Restrictions.eq("tripOrganizer", tripOrganizer));
		
		
		List<Trip> trips = criteria.list();
		tx.commit();
		
		return trips;
	}

	@Override
	public Integer addOrUpdateTrip(Trip trip) {
		Integer tripId = null;
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		
		session.saveOrUpdate(trip);
		
		tx.commit();
		
		tripId = trip.getId();
		
		return tripId;
	}

	@Override
	public Boolean deleteTrip(List<Integer> tripIds) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("DELETE Trip WHERE idtrip in (:ids)");
		query.setParameterList("ids", tripIds);
		
		int result = query.executeUpdate();
		Boolean isDeleted = false;
		
		if(result != 0){
			
			isDeleted = true;
			
		} else {
			
			isDeleted = false;
		}
		tx.commit();
		
		return isDeleted;
	
	}

	@Override
	@SuppressWarnings("unchecked")
	public Set<User> findAllUsersInTrip(Integer tripId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(Trip.class);
		criteria.add(Restrictions.eq("id", tripId));
		
		List<Trip> trips = criteria.list();
		
		Trip trip = trips.get(0);
		
		Set<User> users = trip.getUsers();
		
		tx.commit();
		return users;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Trip> searchTripByTripId(Integer tripId) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(Trip.class);
		criteria.add(Restrictions.eq("id", tripId));
		
		
		List<Trip> trips = criteria.list();
		tx.commit();
		
		return trips;
	}



	@Override
	@SuppressWarnings("unchecked")
	public Integer addOrUpdateUsersInTrip(Integer tripId, Set<User> users) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(Trip.class);
		criteria.add(Restrictions.eq("id", tripId));
		Integer tripIdUsersAdded = null;
		
		List<Trip> trips = criteria.list();
		if(null != trips && !trips.isEmpty()){
			Trip currentTrip = trips.get(0);
			currentTrip.setUsers(users);
			
			session.saveOrUpdate(currentTrip);
			tripIdUsersAdded = currentTrip.getId();
		}
		
		tx.commit();
		return tripIdUsersAdded;
	}



	@Override
	@SuppressWarnings("unchecked")
	public List<Trip> searchTripsByUser(User user) {
		
		Set<User> users = new HashSet<User>();
		users.add(user);
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("FROM Trip trip WHERE :user in elements(trip.users)");
		query.setParameter("user", user);
		
		
		List<Trip> trips = query.list();
		tx.commit();
		return trips;
	}



	
	
	
	

}

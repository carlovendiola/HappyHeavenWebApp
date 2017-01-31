package com.happyheaven.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.happyheaven.dao.UserDao;
import com.happyheaven.hibernate.util.HibernateUtil;
import com.happyheaven.model.Trip;
import com.happyheaven.model.User;

public class UserDaoImpl implements UserDao
{

	private DataSource dataSource;
	
	
	public DataSource getDataSource() {
		return dataSource;
	}



	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}



	@Override
	public boolean isValidUser(String userName, String password) throws SQLException{
		
		String query = "Select count(1) from user where username = ? and password = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, userName);
		pstmt.setString(2, password);
		ResultSet resultSet = pstmt.executeQuery();
		if(resultSet.next())
		    return (resultSet.getInt(1) > 0);
        else
           return false;
	}



	@Override
	@SuppressWarnings("unchecked")
	public List<User> searchUserByUserName(String userName) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("userName", userName));
		
		List<User> users = criteria.list();
		tx.commit();
		
		return users;
	}
	
	@Override
	public Integer addOrUpdateUser(User user) {
		
		Integer userId = null;
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		
		session.saveOrUpdate(user);
		
		tx.commit();
		
		userId = user.getId();
		
		return userId;
	}



	@Override
	@SuppressWarnings("unchecked")
	public Boolean deleteUser(String userName) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("userName", userName));
		
		List<User> users = criteria.list();
		User user = users.get(0);
		
		session.delete(user);
		
		tx.commit();
		
		if(null != user){
			
			return true;
		}
		else {
			return false;
		}
		
	}



	@Override
	@SuppressWarnings("unchecked")
	public List<User> searchUserByEmail(String email) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		
		List<User> users = criteria.list();
		tx.commit();
		
		return users;
	}

	
	
}

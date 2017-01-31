package com.happyheaven.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.happyheaven.model.User;

@Entity
@Table (name = "trip")
public class Trip {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtrip")
	private Integer id;
	
	@Column(name = "trip_name")
	private String tripName;
	
	@Column(name = "trip_start_date")
	private Date tripStartDate;
	
	@Column(name = "trip_end_date")
	private Date tripEndDate;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "trip_cre_date")
	private Date tripCreatedDate;
	
	@UpdateTimestamp
	@Column(name = "trip_last_modified")
	private Date tripLastModified;
	
	@Column(name = "trip_description")
	private String tripDescription;
	
	@Column(name = "trip_organizer")
	private String tripOrganizer;
	
	@Column(name = "trip_last_modified_by")
	private String tripLastModifiedBy;
	
	@ManyToMany(cascade = {CascadeType.ALL})
	@JoinTable(name = "user_trip",
			joinColumns={@JoinColumn(name="idtrip")}, 
			inverseJoinColumns={@JoinColumn(name="iduser")})
	private Set<User> users = new HashSet<User>();
	
	@OneToMany
	@JoinTable(name = "trip_trip_detail",
	joinColumns={@JoinColumn(name="idtrip")}, 
	inverseJoinColumns={@JoinColumn(name="idtrip_detail")})
	private Set<TripDetail> tripDetails = new HashSet<TripDetail>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTripName() {
		return tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	public Date getTripStartDate() {
		return tripStartDate;
	}

	public void setTripStartDate(Date tripStartDate2) {
		this.tripStartDate = tripStartDate2;
	}

	public Date getTripEndDate() {
		return tripEndDate;
	}

	public void setTripEndDate(Date tripEndDate) {
		this.tripEndDate = tripEndDate;
	}

	public Date getTripCreatedDate() {
		return tripCreatedDate;
	}

	public void setTripCreatedDate(Date tripCreatedDate) {
		this.tripCreatedDate = tripCreatedDate;
	}

	public Date getTripLastModified() {
		return tripLastModified;
	}

	public void setTripLastModified(Date tripLastModified) {
		this.tripLastModified = tripLastModified;
	}

	public String getTripDescription() {
		return tripDescription;
	}

	public void setTripDescription(String tripDescription) {
		this.tripDescription = tripDescription;
	}

	public String getTripOrganizer() {
		return tripOrganizer;
	}

	public void setTripOrganizer(String tripOrganizer) {
		this.tripOrganizer = tripOrganizer;
	}

	
	public Set<User> getUsers() {
		return users;
	}
	
	
	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<TripDetail> getTripDetails() {
		return tripDetails;
	}

	public void setTripDetails(Set<TripDetail> tripDetails) {
		this.tripDetails = tripDetails;
	}

	public String getTripLastModifiedBy() {
		return tripLastModifiedBy;
	}

	public void setTripLastModifiedBy(String tripLastModifiedBy) {
		this.tripLastModifiedBy = tripLastModifiedBy;
	}

	
}

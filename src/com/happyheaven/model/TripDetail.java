package com.happyheaven.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "trip_detail")
public class TripDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtrip_detail")
	private Integer idTripDetail;
	
	@Column(name = "trip_detail_title")
	private String tripDetailTitle;
	
	@Column(name = "trip_detail_desc")
	private String tripDetailDescription;
	
	@Column(name = "departure_date")
	private Date departureDate;
	
	@Column(name = "arrival_date")
	private Date arrivalDate;
	
	@Column(name = "trip_detail_cre_ts")
	private Date tripDetailCreatedTS;
	
	@Column(name = "trip_detail_last_mod_ts")
	private Date tripDetailLastModifiedTS;
	
	@Column(name = "idtrip")
	private Integer tripId;
	
	@Column(name = "iduser")
	private Integer userId;
	
	@Column(name = "departure_location")
	private String departureLocation;
	
	@Column(name = "arrival_location")
	private String arrivalLocation;
	
	@Column(name = "duration")
	private double duration;

	public Integer getIdTripDetail() {
		return idTripDetail;
	}

	public void setIdTripDetail(Integer idTripDetail) {
		this.idTripDetail = idTripDetail;
	}

	public String getTripDetailTitle() {
		return tripDetailTitle;
	}

	public void setTripDetailTitle(String tripDetailTitle) {
		this.tripDetailTitle = tripDetailTitle;
	}

	public String getTripDetailDescription() {
		return tripDetailDescription;
	}

	public void setTripDetailDescription(String tripDetailDescription) {
		this.tripDetailDescription = tripDetailDescription;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public Date getTripDetailCreatedTS() {
		return tripDetailCreatedTS;
	}

	public void setTripDetailCreatedTS(Date tripDetailCreatedTS) {
		this.tripDetailCreatedTS = tripDetailCreatedTS;
	}

	public Date getTripDetailLastModifiedTS() {
		return tripDetailLastModifiedTS;
	}

	public void setTripDetailLastModifiedTS(Date tripDetailLastModifiedTS) {
		this.tripDetailLastModifiedTS = tripDetailLastModifiedTS;
	}

	public Integer getTripId() {
		return tripId;
	}

	public void setTripId(Integer tripId) {
		this.tripId = tripId;
	}
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getDepartureLocation() {
		return departureLocation;
	}

	public void setDepartureLocation(String departureLocation) {
		this.departureLocation = departureLocation;
	}

	public String getArrivalLocation() {
		return arrivalLocation;
	}

	public void setArrivalLocation(String arrivalLocation) {
		this.arrivalLocation = arrivalLocation;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}
	
	
	
}

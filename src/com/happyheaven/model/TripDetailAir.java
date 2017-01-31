package com.happyheaven.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "trip_detail_air")
public class TripDetailAir extends TripDetail {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtrip_detail_air")
	private Integer id;
	
	@Column(name = "air_fare_cost")
	private double airFareCost;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getAirFareCost() {
		return airFareCost;
	}

	public void setAirFareCost(double airFareCost) {
		this.airFareCost = airFareCost;
	}
	
	
}

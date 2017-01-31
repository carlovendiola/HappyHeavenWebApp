package com.happyheaven.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "trip_detail_grd")
public class TripDetailGround extends TripDetail {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtrip_detail_grd")
	private Integer id;
	
	@Column(name = "car_rental_cost_per_person")
	private double carRentalCostPerPerson;
	
	@Column(name = "gas_cost_per_person")
	private double gasCostPerPerson;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getCarRentalCostPerPerson() {
		return carRentalCostPerPerson;
	}

	public void setCarRentalCostPerPerson(double carRentalCostPerPerson) {
		this.carRentalCostPerPerson = carRentalCostPerPerson;
	}

	public double getGasCostPerPerson() {
		return gasCostPerPerson;
	}

	public void setGasCostPerPerson(double gasCostPerPerson) {
		this.gasCostPerPerson = gasCostPerPerson;
	}
	
	

}

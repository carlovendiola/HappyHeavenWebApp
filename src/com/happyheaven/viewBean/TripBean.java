package com.happyheaven.viewBean;

import javax.swing.JTextArea;

public class TripBean {
	
	private Integer tripId;
	
	private String tripName;
	
	private String tripDescription;
	
	private String tripStartDate;
	
	private String tripEndDate;
	
	private JTextArea emails;

	private String fromPage;
	
	
	public String getTripName() {
		return tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	public String getTripDescription() {
		return tripDescription;
	}

	public void setTripDescription(String tripDescription) {
		this.tripDescription = tripDescription;
	}

	public String getTripStartDate() {
		return tripStartDate;
	}

	public void setTripStartDate(String tripStartDate) {
		this.tripStartDate = tripStartDate;
	}

	public String getTripEndDate() {
		return tripEndDate;
	}

	public void setTripEndDate(String tripEndDate) {
		this.tripEndDate = tripEndDate;
	}

	public Integer getTripId() {
		return tripId;
	}

	public void setTripId(Integer tripId) {
		this.tripId = tripId;
	}

	public JTextArea getEmails() {
		return emails;
	}

	public void setEmails(JTextArea emails) {
		this.emails = emails;
	}

	public String getFromPage() {
		return fromPage;
	}

	public void setFromPage(String fromPage) {
		this.fromPage = fromPage;
	}
	
	
	
}

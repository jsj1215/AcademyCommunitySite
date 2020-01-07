package com.care.calendar_dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;


public class TestDTO {
	private String attend;
	private String month;
	private String day;
	private String mydate;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMydate() {
		return mydate;
	}
	public void setMydate(String mydate) {
		this.mydate = mydate;
	}
	public String getAttend() {
		return attend;
	}
	public void setAttend(String attend) {
		this.attend = attend;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
}
	
	
	


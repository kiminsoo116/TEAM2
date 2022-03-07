package com.sist.vo;

import java.util.Date;

public class Movie_ReservationVO {
	
	private int mr_no;
	private String mr_location;
	private String mr_time;
	private Date mr_date;
	private String u_id;
	private int mr_room;
	private String mr_seat;
	private String m_title;
	private String m_poster;
	
	
	public String getM_poster() {
		return m_poster;
	}
	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}
	public int getMr_no() {
		return mr_no;
	}
	public void setMr_no(int mr_no) {
		this.mr_no = mr_no;
	}
	public String getMr_location() {
		return mr_location;
	}
	public void setMr_location(String mr_location) {
		this.mr_location = mr_location;
	}
	public String getMr_time() {
		return mr_time;
	}
	public void setMr_time(String mr_time) {
		this.mr_time = mr_time;
	}
	public Date getMr_date() {
		return mr_date;
	}
	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getMr_room() {
		return mr_room;
	}
	public void setMr_room(int mr_room) {
		this.mr_room = mr_room;
	}
	public String getMr_seat() {
		return mr_seat;
	}
	public void setMr_seat(String mr_seat) {
		this.mr_seat = mr_seat;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	
	
	

}

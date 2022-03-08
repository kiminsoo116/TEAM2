package com.sist.vo;

import java.sql.Date;

/*
	MR_NO	NUMBER
	MR_LOCATION	VARCHAR2(50 BYTE)
	MR_TIME	VARCHAR2(20 BYTE)
	MR_DATE	DATE
	U_ID	VARCHAR2(20 BYTE)
	M_NO	NUMBER
	MR_SEAT	VARCHAR2(20 BYTE)
	MR_ROOM	NUMBER
 */
public class ReserveVO {
	private int mr_no;
	private String mr_location;
	private String mr_time;
	private Date mr_date;
	private String mr_seat;
	private int mr_room;
	private String u_id;
	private int m_no;

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

	public String getMr_seat() {
		return mr_seat;
	}

	public void setMr_seat(String mr_seat) {
		this.mr_seat = mr_seat;
	}

	public int getMr_room() {
		return mr_room;
	}

	public void setMr_room(int mr_room) {
		this.mr_room = mr_room;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

}

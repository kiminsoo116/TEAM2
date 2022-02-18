package com.sist.vo;

public class FoodVO {
	private String f_title; // 음식점 이름
	private String f_poster; // 음식 사진
	private String f_address; // 음식점 주소
	private String f_kind; // 음식 종류
	private String f_tel; // 음식점 전화번호
	private String f_menu; // 음식점 메뉴
	private String f_time; // 영업시간
	
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_poster() {
		return f_poster;
	}
	public void setF_poster(String f_poster) {
		this.f_poster = f_poster;
	}
	public String getF_address() {
		return f_address;
	}
	public void setF_address(String f_address) {
		this.f_address = f_address;
	}
	public String getF_kind() {
		return f_kind;
	}
	public void setF_kind(String f_kind) {
		this.f_kind = f_kind;
	}
	public String getF_tel() {
		return f_tel;
	}
	public void setF_tel(String f_tel) {
		this.f_tel = f_tel;
	}
	public String getF_menu() {
		return f_menu;
	}
	public void setF_menu(String f_menu) {
		this.f_menu = f_menu;
	}
	public String getF_time() {
		return f_time;
	}
	public void setF_time(String f_time) {
		this.f_time = f_time;
	}
	
	@Override
	public String toString() {
		return "FoodVO [f_title=" + f_title + ", f_poster=" + f_poster + ", f_address=" + f_address + ", f_kind="
				+ f_kind + ", f_tel=" + f_tel + ", f_menu=" + f_menu + ", f_time=" + f_time + "]";
	}
	
}

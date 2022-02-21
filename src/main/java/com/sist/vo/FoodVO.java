package com.sist.vo;

/*
F_TITLE			VARCHAR2(50 BYTE)
F_POSTER		VARCHAR2(50 BYTE)
F_ADDRESS		VARCHAR2(50 BYTE)
F_KIND			VARCHAR2(50 BYTE)
F_TEL			VARCHAR2(20 BYTE)
F_MENU			VARCHAR2(4000 BYTE)
F_TIME			VARCHAR2(100 BYTE)
 */
public class FoodVO {
	private String f_title; // 맛집제목
	private String f_poster; // 맛집포스터
	private String f_address; // 맛집주소
	private String f_kind; // 맛집음식종류
	private String f_tel; // 맛집전화번호
	private String f_menu; // 맛집메뉴
	private String f_time; // 맛집영업시간

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

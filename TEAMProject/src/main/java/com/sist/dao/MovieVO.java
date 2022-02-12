package com.sist.dao;

/*
	M_NO		NUMBER
	M_TITLE		VARCHAR2(50 BYTE)
	M_GENRE		VARCHAR2(20 BYTE)
	M_POSTER	VARCHAR2(50 BYTE)
	M_TIME		VARCHAR2(20 BYTE)
	M_DIRECTOR	VARCHAR2(20 BYTE)
	M_CAST		VARCHAR2(100 BYTE)
	M_RDATE		VARCHAR2(30 BYTE)
	M_RATE		VARCHAR2(100 BYTE)
	M_CNT		VARCHAR2(1000 BYTE)
	M_PREVIEW	VARCHAR2(100 BYTE)
	
 */

public class MovieVO {
	private int m_no;
	private String m_title; // 영화제목
	private String m_genre; // 영화장르
	private String m_poster; // 영화포스터
	private String m_time; // 영화시간
	private String m_director; // 영화감독
	private String m_cast; // 영화출연진
	private String m_rdate; // 영화개봉일
	private String m_rate; // 영화예매율
	private String m_cnt; // 영화누적관객수
	private String m_preview; // 영화예고편
	private String m_photo; // 영화 갤러리
	private String m_content; // 영화 줄거리
	
	

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public String getM_rdate() {
		return m_rdate;
	}

	public void setM_rdate(String m_rdate) {
		this.m_rdate = m_rdate;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_genre() {
		return m_genre;
	}

	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_time() {
		return m_time;
	}

	public void setM_time(String m_time) {
		this.m_time = m_time;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public String getM_cast() {
		return m_cast;
	}

	public void setM_cast(String m_cast) {
		this.m_cast = m_cast;
	}

	public String getM_rate() {
		return m_rate;
	}

	public void setM_rate(String m_rate) {
		this.m_rate = m_rate;
	}

	public String getM_cnt() {
		return m_cnt;
	}

	public void setM_cnt(String m_cnt) {
		this.m_cnt = m_cnt;
	}

	public String getM_preview() {
		return m_preview;
	}

	public void setM_preview(String m_preview) {
		this.m_preview = m_preview;
	}

	@Override
	public String toString() {
		return m_title + "|" + m_genre + "|" + m_poster + "|" + m_time + "|" + m_director + "|" + m_cast + "|" + m_rdate
				+ "|" + m_rate + "|" + m_cnt + "|" + m_preview + "|" + m_photo + "|" + m_content;
	}

}

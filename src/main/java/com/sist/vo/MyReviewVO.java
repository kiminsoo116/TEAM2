package com.sist.vo;

public class MyReviewVO {
	private int r_no;
	private int r_score;
	private String r_comend;
	private int m_no;
	private String m_poster;
	private String m_title;
	private String u_id;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public String getR_comend() {
		return r_comend;
	}

	public void setR_comend(String r_comend) {
		this.r_comend = r_comend;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_poster() {
		return m_poster;
	}

	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "MyReviewVO [r_no=" + r_no + ", r_score=" + r_score + ", r_comend=" + r_comend + ", m_no=" + m_no
				+ ", m_poster=" + m_poster + ", m_title=" + m_title + ", u_id=" + u_id + "]";
	}

}

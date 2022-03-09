package com.sist.vo;

/*
R_NO   NUMBER
R_SCORE   NUMBER(2,1)
R_COMEND   VARCHAR2(4000 BYTE)
M_NO   NUMBER
U_ID   VARCHAR2(20 BYTE)
 */
public class ReviewVO {
   private int r_no;
   private double r_score;
   private String r_comend;
   private int m_no;
   private String u_id;
   private int r_gno;
	

  	public int getR_gno() {
  		return r_gno;
  	}

  	public void setR_gno(int r_gno) {
  		this.r_gno = r_gno;
  	}

   public int getR_no() {
      return r_no;
   }

   public void setR_no(int r_no) {
      this.r_no = r_no;
   }

   public double getR_score() {
      return r_score;
   }

   public void setR_score(double r_score) {
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

   public String getU_id() {
      return u_id;
   }

   public void setU_id(String u_id) {
      this.u_id = u_id;
   }

}

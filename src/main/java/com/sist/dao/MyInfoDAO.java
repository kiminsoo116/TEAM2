package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.sist.vo.MemberVO;

import java.sql.Date;

public class MyInfoDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection(); //연결/해제 => has-a
   //1.로그인 기능 
   public String myInfoSumit(String u_pw)
   {
	   String result="";
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM member "
				     +"WHERE u_pw=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, u_pw);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   /////////////////////////////// ID존재 여부 확인 
		   if(count==0) //ID가 없는 상태
		   {
			   result="NOPWD";
		   }
		   else //ID가 있는 상태 
		   {	   
			   result="LOGIN";
		   }			     
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return result;
   }
   
   public void myInfoChange(MemberVO vo) {
	   String sql = "update member set u_pw=?,u_name=?,u_email=?,u_tel=? where u_id=?";
	   
	   try {
		   conn=dbcp.getConnection();
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getU_pw());
		   ps.setString(2, vo.getU_name());
		   ps.setString(3, vo.getU_email());
		   ps.setString(4, vo.getU_tel());
		   ps.setString(5, vo.getU_id());
		   ps.executeUpdate();
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   dbcp.disConnection(conn, ps);
	   }
   }
}
   
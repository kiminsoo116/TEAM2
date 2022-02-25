package com.sist.dao;
import java.util.*;
import java.sql.*;
public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection(); //연결/해제 => has-a
   //1.로그인 기능 
   public String isLogin(String u_id,String u_pw)
   {
	   String result="";
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM member "
				     +"WHERE u_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, u_id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   /////////////////////////////// ID존재 여부 확인 
		   if(count==0) //ID가 없는 상태
		   {
			   result="NOID";
		   }
		   else //ID가 있는 상태 
		   {
			   sql="SELECT u_pw FROM member "
			      +"WHERE u_id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, u_id);
			   rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   
			   
			   rs.close();
			   
			   if(db_pwd.equals(u_pw)) // 로그인 
			   {
				   result="LOGIN";
			   }
			   else //비밀번호가 틀리다 
			   {
				   result="NOPWD";
			   }
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
   
}
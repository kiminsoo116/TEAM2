package com.sist.dao;
import java.util.*;
import java.sql.*;

public class FindDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   private DBCPConnection dbcp=new DBCPConnection();
	
	public String isFind(String u_name,String u_tel)
	   {
		   String result="";
		   try
		   {
			   conn=dbcp.getConnection();
			   String sql="SELECT COUNT(*) FROM member "
					     +"WHERE u_name=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, u_name);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   /////////////////////////////// ID존재 여부 확인 
			   if(count==0) //ID가 없는 상태
			   {
				   result="NONAME";
			   }
			   else //ID가 있는 상태 
			   {
				   sql="SELECT u_tel,u_id,u_email FROM member "
				      +"WHERE u_name=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, u_name);
				   rs=ps.executeQuery();
				   rs.next();
				   String db_tel=rs.getString(1);
				   String u_id=rs.getString(2);
				   String u_email=rs.getString(3);
				   
				   
				   rs.close();
				   
				   if(db_tel.equals(u_tel)) // 로그인 
				   {
					   return u_id+"|"+u_email;
				   }
				   else //비밀번호가 틀리다 
				   {
					   result="NOTEL";
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
	
	
	public String isFindEmail(String u_name,String u_email)
	   {
		   String result="";
		   try
		   {
			   conn=dbcp.getConnection();
			   String sql="SELECT COUNT(*) FROM member "
					     +"WHERE u_name=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, u_name);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   /////////////////////////////// ID존재 여부 확인 
			   if(count==0) //ID가 없는 상태
			   {
				   result="NONAME";
			   }
			   else //ID가 있는 상태 
			   {
				   sql="SELECT u_email,u_id,u_tel FROM member "
				      +"WHERE u_name=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, u_name);
				   rs=ps.executeQuery();
				   rs.next();
				   String db_email=rs.getString(1);
				   String u_id=rs.getString(2);
				   String u_tel=rs.getString(3);
				   
				   
				   rs.close();
				   
				   if(db_email.equals(u_email)) // 로그인 
				   {
					   return u_id+"|"+u_tel;
				   }
				   else //비밀번호가 틀리다 
				   {
					   result="NOEMAIL";
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

	
	public String isFindpass(String u_id,String u_name,String u_tel)
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
				   
				   sql="SELECT COUNT(*) FROM member "
				      +"WHERE u_name=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, u_name);
				   rs=ps.executeQuery();
				   rs.next();
				   int count2=rs.getInt(1);
				   rs.close();
				   
				   if(count2==0) // 로그인 
				   {
					   result="NONAME";
				   }
				   else //비밀번호가 틀리다 
				   {
					   sql="SELECT u_birth,u_pw,u_tel FROM member "
							      +"WHERE u_id=?";
							   ps=conn.prepareStatement(sql);
							   ps.setString(1, u_id);
							   rs=ps.executeQuery();
							   rs.next();
							   
							   String u_birth=rs.getString(1);
							   String u_pw=rs.getString(2);
							   String db_tel=rs.getString(3);
							   
							   rs.close();
							   
							   if(db_tel.equals(u_tel)) // 로그인 
							   {
								   return u_birth+"|"+u_pw;
							   }
							   else //비밀번호가 틀리다 
							   {
								   result="NOTEL";
							   }
				   }
			   }
		   }			   
						   
					   catch(Exception ex)
					   {
						   ex.printStackTrace();
					   }
					   finally
					   {
						   dbcp.disConnection(conn, ps);
					   }
					   return result;
			   
		   
			   
}
	
	public String isFindEmail2(String u_id,String u_name,String u_email)
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
				   
				   sql="SELECT COUNT(*) FROM member "
				      +"WHERE u_name=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, u_name);
				   rs=ps.executeQuery();
				   rs.next();
				   int count2=rs.getInt(1);
				   rs.close();
				   
				   if(count2==0) // 로그인 
				   {
					   result="NONAME";
				   }
				   else //비밀번호가 틀리다 
				   {
					   sql="SELECT u_birth,u_pw,u_email FROM member "
							      +"WHERE u_id=?";
							   ps=conn.prepareStatement(sql);
							   ps.setString(1, u_id);
							   rs=ps.executeQuery();
							   rs.next();
							   
							   String u_birth=rs.getString(1);
							   String u_pw=rs.getString(2);
							   String db_email=rs.getString(3);
							   
							   rs.close();
							   
							   if(db_email.equals(u_email)) // 로그인 
							   {
								   return u_birth+"|"+u_pw;
							   }
							   else //비밀번호가 틀리다 
							   {
								   result="NOEMAIL";
							   }
				   }
			   }
		   }			   
						   
					   catch(Exception ex)
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

package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.sist.vo.MemberVO;

import java.sql.Date;

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
   
   public int isIdcheck(String u_id)
   {
	   int count=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM MEMBER "
				     +"WHERE u_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, u_id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return count;
   }
   
   public int isEmailcheck(String u_email)
   {
	   int count=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM MEMBER "
				     +"WHERE u_email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, u_email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return count;
   }
   
   public int isTelcheck(String u_tel)
   {
	   int count=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT COUNT(*) FROM MEMBER "
				     +"WHERE u_tel=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, u_tel);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return count;
   }
   
   
   
   public String isJoin(MemberVO vo,String u_id,String u_pw,String u_pw2,String u_name, Date sqlDate, String u_sex, String u_email, String u_tel)
   {
	   String result="";
	   
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?)";
				     
		   ps=conn.prepareStatement(sql);
		  
		   ps.setString(1, vo.getU_id());
		   ps.setString(2, vo.getU_pw());
		   ps.setString(3, vo.getU_name());
		   ps.setDate(4, vo.getU_birth1());
		   ps.setString(5, vo.getU_sex());
		   ps.setString(6, vo.getU_email());
		   ps.setString(7, vo.getU_tel());
		   ps.executeUpdate();
		   
		   
		   
	   } catch (Exception ex) {
		ex.printStackTrace();
	}finally {
		dbcp.disConnection(conn, ps);
	}
	  return result;
   }
   public MemberVO memberUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT u_id,u_pw,u_name,u_sex,u_email,u_tel "				     
				     +"FROM member "
				     +"WHERE u_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setU_id(rs.getString(1));
		   vo.setU_pw(rs.getString(2));
		   vo.setU_name(rs.getString(3));
		   vo.setU_sex(rs.getString(4));
		   vo.setU_email(rs.getString(5));
		   vo.setU_tel(rs.getString(6));		 
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return vo;
   }
   
   // 실제 수정 ==> Model => DAO => JSP
   public boolean memberUpdateOk(MemberVO vo)
   {
	   boolean bCheck=false;
	   try
	   {//u_id,u_pw,u_name,u_sex,u_email,u_tel
		   conn=dbcp.getConnection();
		   String sql="SELECT u_pw FROM member "
				     +"WHERE u_id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getU_id());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String pwd=rs.getString(1);
		   rs.close();
		   
		   if(pwd.equals(vo.getU_pw()))
		   {
			   bCheck=true;
			   // 실제 수정 
			   sql="UPDATE member SET "
				  +"u_id=?,u_pw=?,u_name=?,u_sex=?,u_email=?,u_tel=? "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getU_id());
			   ps.setString(2, vo.getU_pw());
			   ps.setString(3, vo.getU_name());
			   ps.setString(4, vo.getU_sex());
			   ps.setString(5, vo.getU_email());
			   ps.setString(6, vo.getU_tel());
			   ps.executeUpdate();//commit()
		   }
		   else
		   {
			   bCheck=false;
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return bCheck;
   }
}

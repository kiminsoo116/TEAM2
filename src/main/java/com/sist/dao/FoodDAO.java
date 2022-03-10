package com.sist.dao;
import java.util.*;

import com.sist.vo.*;
import java.sql.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DBCPConnection dbcp=new DBCPConnection();
	
	public List<FoodVO> foodLocationFindData(String loc,int page)
	   {
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try
		   {
			   conn=dbcp.getConnection();
			   //SQL
			   String sql="SELECT f_no,f_poster,f_title,f_address,f_kind,f_tel,f_time,f_menu, num "
					     +"FROM (SELECT f_no,f_poster,f_title,f_address,f_kind,f_tel,f_time,f_menu, rownum as num "
					     +"FROM (SELECT f_no,f_poster,f_title,f_address,f_kind,f_tel,f_time,f_menu "
					     +"FROM food WHERE f_address LIKE '%'||?||'%' "
					     +"ORDER BY 1)) "
					     +"WHERE num BETWEEN ? AND ?";
			   ps=conn.prepareStatement(sql);
			   int rowSize=15;
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;
			   
			   ps.setString(1, loc);
			   ps.setInt(2, start);
			   ps.setInt(3, end);
			   
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   FoodVO vo=new FoodVO();
				   vo.setF_no(rs.getInt(1));
				   vo.setF_poster(rs.getString(2));
				   vo.setF_title(rs.getString(3));
				   vo.setF_address(rs.getString(4));
				   vo.setF_kind(rs.getString(5));
				   vo.setF_tel(rs.getString(6));
				   vo.setF_time(rs.getString(7));
				   vo.setF_menu(rs.getString(8));
				   
				   
				   list.add(vo);
			   }
			   rs.close();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			  dbcp.disConnection(conn, ps); 
		   }
		   return list;
	   }
	
	public int foodLoactionFindTotalPage(String loc)
	   {
		   int total=0;
		   try
		   {
			   conn=dbcp.getConnection();
			   String sql="SELECT CEIL(COUNT(*)/15.0) FROM food "
					     +"WHERE f_address LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, loc);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();   
		   }
		   finally
		   {
			   dbcp.disConnection(conn, ps);
		   }
		   return total;
	   }
	
	public FoodVO foodDetailData(int f_no)
	   {
		   FoodVO vo=new FoodVO();
		   try
		   {
			   //1. 주소값을 얻어 온다 
			   conn=dbcp.getConnection();
			   //2. SQL 
			   String sql="SELECT f_no,f_title,f_address,f_tel,f_kind,"
					     +"f_menu,f_time,f_poster "
					     +"FROM food "
					     +"WHERE f_no=?";
			   //3. 전송 (SQL)
			   ps=conn.prepareStatement(sql);
			   //4. ?에 값을 채운다 
			   ps.setInt(1, f_no);
			   
			   //5. 결과값 => vo
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setF_no(rs.getInt(1));
			   vo.setF_title(rs.getString(2));
			   vo.setF_address(rs.getString(3));
			   vo.setF_tel(rs.getString(4));
			   vo.setF_kind(rs.getString(5));
			   vo.setF_menu(rs.getString(6));
			   vo.setF_time(rs.getString(7));
			   vo.setF_poster(rs.getString(8));
			   
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   // 반환 
			   dbcp.disConnection(conn, ps);
		   }
		   return vo;
	   }

}

package com.sist.dao;
import java.util.*;
import java.sql.*;
public class UpperDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	private final String URL = "jdbc:oracle:thin:@121.139.37.196:1521:XE";
	
	public UpperDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"prj01","sistcom");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public List<UpperVO> movieRanking(){
		List<UpperVO> list = new ArrayList<UpperVO>();
		
		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director,rownum "
					+"FROM (SELECT m_no,m_title,m_poster,m_rate,m_director FROM movie ORDER BY m_no ASC)"
					+"WHERE rownum<=10";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				UpperVO vo = new UpperVO();
				vo.setM_no(rs.getInt(1));
				vo.setM_title(rs.getString(2));
				vo.setM_poster(rs.getString(3));
				vo.setM_rate(rs.getString(4));
				vo.setM_director(rs.getString(5));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
//	public void disp() {
//		List<UpperVO> list = movieRanking();
//		for(UpperVO vo: list) {
//			System.out.println(vo.getM_no()+vo.getM_title()+vo.getM_poster()+vo.getM_rate());
//		}
//	}
	
//	public static void main(String[] args) {
//		UpperDAO ud = new UpperDAO();
//		ud.disp();
//	}
}

package com.sist.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@121.139.37.196:1521:XE";

	public MovieDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "prj01", "sistcom");
		} catch (Exception e) {
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public void movieInsert(MovieVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO movie VALUES (m_no_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setString(1, vo.getM_title());
			ps.setString(2, vo.getM_genre());
			ps.setString(3, vo.getM_poster());
			ps.setString(4, vo.getM_time());
			ps.setString(5, vo.getM_director());
			ps.setString(6, vo.getM_cast());
			ps.setString(7, vo.getM_rdate());
			ps.setString(8, vo.getM_rate());
			ps.setString(9, vo.getM_cnt());
			ps.setString(10, vo.getM_preview());
			ps.setString(11, vo.getM_photo());
			ps.setString(12, vo.getM_content());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	public List<MovieVO> movieListData(){
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql="SELECT m_no,m_title,m_poster,m_rate "
					+ "FROM movie "
					+ "WHERE m_rdate  LIKE '2022 .01.%' "
					+ "OR m_rdate LIKE '2022 .02.%' "
					+ "ORDER BY m_no ASC";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setM_no(rs.getInt(1));
				vo.setM_title(rs.getString(2));
				vo.setM_poster(rs.getString(3));
				vo.setM_rate(rs.getString(4));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}

		
		public List<MovieVO> movieListData2(){
			List<MovieVO> list=new ArrayList<MovieVO>();
			try {
				getConnection();
				String sql="SELECT m_no,m_title,m_poster,m_rate,m_director "
						+ "FROM movie "
						+ "WHERE m_rdate LIKE '2022 .03%'"
						+ "or m_rdate LIKE '2022 .04%' "
						+ "or m_rdate LIKE '2022 .05%' "
						+ "or m_rdate LIKE '2022 .06%' "
						+ "or m_rdate LIKE '2022 .07%' "
						+ "OR m_rdate LIKE '2022 .08%' "
						+ "OR m_rdate LIKE '2022 .09%' "
						+ "OR m_rdate LIKE '2022 .10%' "
						+ "OR m_rdate LIKE '2022 .11%' "
						+ "OR m_rdate LIKE '2022 .12%'"; 
				
				
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					MovieVO vo=new MovieVO();
					vo.setM_no(rs.getInt(1));
					vo.setM_title(rs.getString(2));
					vo.setM_poster(rs.getString(3));
					vo.setM_rate(rs.getString(4));
					vo.setM_director(rs.getString(5));
					
					list.add(vo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
		return list;
	}
}

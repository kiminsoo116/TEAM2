package com.sist.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.*;

public class MovieDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public Connection getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp//env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	
	// 영화 랭킹 관련
	public List<MovieVO> movieRanking(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		
		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director,rownum "
					+"FROM (SELECT m_no,m_title,m_poster,m_rate,m_director FROM movie ORDER BY m_no ASC)"
					+"WHERE rownum<=10";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title=rs.getString(2);
				if (title.length()>=14) {
					vo.setM_title(title.substring(0, 14)+"…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_poster(rs.getString(3).substring(0,rs.getString(3).lastIndexOf("?")));
				vo.setM_rate(rs.getString(4));
				String director=rs.getString(5);
				if(director.length()>=5) {
					vo.setM_director(director.substring(0,5)+"…");
				}else {
					vo.setM_director(director);
				}
				
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
	
	// 영화 현재 상영작
	public List<MovieVO> movieListData(){
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql="SELECT m_no,m_title,m_poster,m_rate,m_director "
					+ "FROM movie "
					+ "WHERE m_rdate  LIKE '2022 .01.%' OR m_rdate LIKE '2022 .02.%' "
					+ "ORDER BY m_no ASC";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length()>=17) {
					vo.setM_title(title.substring(0, 15)+"…");
				}else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_rate(rs.getString(4));
				String director = rs.getString(5);
				if(director.length()>=9) {
					vo.setM_director(director.substring(0,9)+"…");
				}else {
					vo.setM_director(director);
				}
				
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
	/*
	// 영화 상영 예정작
	public List<MovieVO> movieListData2() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			cm.getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director " + "FROM movie "
					+ "WHERE m_rdate LIKE '2022 .03%'" + "or m_rdate LIKE '2022 .04%' " + "or m_rdate LIKE '2022 .05%' "
					+ "or m_rdate LIKE '2022 .06%' " + "or m_rdate LIKE '2022 .07%' " + "OR m_rdate LIKE '2022 .08%' "
					+ "OR m_rdate LIKE '2022 .09%' " + "OR m_rdate LIKE '2022 .10%' " + "OR m_rdate LIKE '2022 .11%' "
					+ "OR m_rdate LIKE '2022 .12%'";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
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
		} finally {
			cm.disConnection(conn, ps);
		}
		return list;
	}
	*/
	/*
	// 페이지 나누기
	public int totalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/20.0) FROM movie "
					+ "WHERE m_rdate  LIKE '2022 .01.%' OR m_rdate LIKE '2022 .02.%'";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection(conn, ps);
		}
		return total;
	}
	*/
	/*
	// 상세페이지
	public MovieVO movieDetailData(int no) {
		MovieVO vo=new MovieVO();
		try {
			cm.getConnection();
			String sql="SELECT * FROM movie "
					+ "WHERE m_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				vo.setM_no(rs.getInt(1));
				vo.setM_title(rs.getString(2));
				vo.setM_genre(rs.getString(3));
				vo.setM_poster(rs.getString(4));
				vo.setM_time(rs.getString(5));
				vo.setM_director(rs.getString(6));
				vo.setM_cast(rs.getString(7));
				vo.setM_rdate(rs.getString(8));
				vo.setM_rate(rs.getString(9));
				vo.setM_cnt(rs.getString(10));
				vo.setM_preview(rs.getString(11));
				vo.setM_photo(rs.getString(12));
				vo.setM_content(rs.getString(13));
			}
			
			rs.close();

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			cm.disConnection(conn, ps);
		}
		return vo;
	}
	*/


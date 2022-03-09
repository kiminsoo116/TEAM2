package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.Movie_ReservationVO;
import com.sist.vo.MyReviewVO;
import com.sist.vo.WishVO;

public class MypageDAO {
	private Connection conn;
	private PreparedStatement ps;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			// JNDI => 디렉토리 형식 (탐색기)
			Context c = (Context) init.lookup("java://comp/env");
			// java://comp/env => Connection객체가 저장됨
			// jdbc/oracle => 저장된 주소의 별칭
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			// DataSource => 데이터베이스에 대한 모든 정보가 저장된 클래스
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 2. 사용후에 반환
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
			// 반환 => POOL영역에 설정 => 재사용
			// Connection객체의 갯수를 조정할 수 있다
			// 웹에서 일반적으로 사용되는 데이터베이스 프로그램
			// => ORM (MyBatis => DBCP)
		} catch (Exception ex) {
		}
	}

	public List<Movie_ReservationVO> getReservationList(String userId, int page) {

		List<Movie_ReservationVO> list = new ArrayList<>();
		String sql = "SELECT * FROM (SELECT rownum num, mr.* FROM (select movie_reservation.*,movie.m_title, movie.m_poster from movie_reservation join movie on movie_reservation.m_no=movie.m_no where movie_reservation.u_id=? order by movie_reservation.mr_date DESC) mr) WHERE num BETWEEN ? AND ?";
		int startNum = (page - 1)*5 + 1;
		int endNum = page * 5;

		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Movie_ReservationVO vo = new Movie_ReservationVO();
				
				vo.setMr_no(rs.getInt("mr_no"));
				vo.setMr_location(rs.getString("mr_location"));
				vo.setMr_time(rs.getString("mr_time"));
				vo.setMr_date(rs.getDate("mr_date"));
				vo.setU_id(rs.getString("U_ID"));
				vo.setMr_room(rs.getInt("mr_room"));
				vo.setMr_seat(rs.getString("mr_seat"));
				vo.setM_title(rs.getString("m_title"));
				vo.setM_poster(rs.getString("m_poster"));
				list.add(vo);
			}
			rs.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}

		return list;
	}
	
	public int getReservationCount(String id) {
		String sql = "SELECT count(MR_NO) cnt FROM MOVIE_RESERVATION WHERE u_id=?";
		int count=0;
		try {
			
			getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		
		return count;

	}
	public Movie_ReservationVO reservationListData(String userId) {

		Movie_ReservationVO vo = new Movie_ReservationVO();
		String sql = "select * from (select movie_reservation.*,movie.m_title,movie.m_poster from movie_reservation join movie on movie_reservation.m_no=movie.m_no order by movie_reservation.mr_date desc) where u_id=?";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setMr_no(rs.getInt("mr_no"));
			vo.setMr_location(rs.getString("mr_location"));
			vo.setMr_time(rs.getString("mr_time"));
			vo.setMr_date(rs.getDate("mr_date"));
			vo.setU_id(rs.getString("U_ID"));
			vo.setMr_room(rs.getInt("mr_room"));
			vo.setMr_seat(rs.getString("mr_seat"));
			vo.setM_title(rs.getString("m_title"));
			vo.setM_poster(rs.getString("m_poster"));
			rs.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}

		return vo;

	}
	public List<MyReviewVO> myReviewList(String userId, int page)
	{	
		List<MyReviewVO> list = new ArrayList<>();
		String sql="SELECT * from(SELECT rownum num ,v.* FROM (SELECT m.M_TITLE,m.M_POSTER,r.* FROM review r JOIN MOVIE m on r.M_NO=m.M_NO where u_id=? ORDER BY r.r_regdate DESC) v) WHERE num BETWEEN ? and ?";
		int startNum = (page - 1)*5 + 1;
		int endNum = page * 5;
		
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MyReviewVO vo = new MyReviewVO();
				vo.setR_no(rs.getInt("r_no"));
				vo.setR_score(rs.getInt("r_score"));
				vo.setR_comend(rs.getString("r_comend"));
				vo.setM_no(rs.getInt("m_no"));
				vo.setM_poster(rs.getString("m_poster"));
				vo.setM_title(rs.getString("m_title"));
				vo.setU_id(rs.getString("u_id"));
				vo.toString();
				list.add(vo);
			}
			rs.close();
			
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
		return list;
	}
	public int myReviewCount(String id) {
		String sql = "SELECT count(r_no) cnt FROM review WHERE u_id=?";
		int count=0;
		try {
			
			getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		
		return count;
	}
	
	public List<WishVO> getWishList(String id, int page) {
		String sql="select v.* from(SELECT rownum num,m.M_TITLE ,m.M_POSTER ,m.M_RDATE FROM wishlist w JOIN MOVIE m ON w.M_NO=m.M_NO WHERE u_id=?) v where num between ? and ?";
		List<WishVO> list = new ArrayList<>();
		int startNum = (page-1)*12+1;
		int endNum = page*12;
				
		
		try {
			getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				WishVO vo = new WishVO();
				vo.setM_title(rs.getString(1));
				vo.setM_poster(rs.getString(2));
				vo.setM_rdate(rs.getString(3));
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		
		return list;
	}
	
	public int getWishListCount(String id) {
		int count=0;
		String sql = "SELECT count(w_no) cnt FROM wishList WHERE u_id=?";
		try {
			getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			count = rs.getInt("cnt");
			
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		
		return count;
	}
	
}

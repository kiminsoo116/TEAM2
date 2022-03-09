package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.JjimVO;

public class JjimDAO {
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

	// 찜 등록
	public void jjumInsert(JjimVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO wishlist VALUES(w_no_seq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getM_no());
			ps.setString(2, vo.getU_id());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	// 찜 대상
	public int jjimCountData(JjimVO vo) {
		int count = 0;

		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM wishlist WHERE m_no=? AND u_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getM_no());
			ps.setString(2, vo.getU_id());
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

		return count;
	}
	
	// 찜 대상2
		public int jjimCountData2(JjimVO vo) {
			int wno = 0;

			try {
				getConnection();
				String sql = "SELECT w_no FROM wishlist WHERE m_no=? AND u_id=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getM_no());
				ps.setString(2, vo.getU_id());
				
				ResultSet rs = ps.executeQuery();
				rs.next();
				wno = rs.getInt(1);
				rs.close();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				disConnection();
			}

			return wno;
		}

	// 찜 삭제
	public void jjimDelete(int no) {
		try {
			getConnection();
			String sql="DELETE FROM wishlist WHERE w_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
}

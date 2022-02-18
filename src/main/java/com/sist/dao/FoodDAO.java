package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.vo.FoodVO;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
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

	public void foodInsert(FoodVO vo) {
		try {
			// 1. 연결
			getConnection();
			// 2. SQL문장 제작
			String sql = "INSERT INTO food VALUES(" + "(SELECT NVL(MAX(no)+1,1) FROM food),"
					+ "?,?,?,?,?,?,?)";
			
			// 3. SQL문장 오라클로 전송
			ps = conn.prepareStatement(sql);
			// 4. ?에 값을 채운다
			
			ps.setString(1, vo.getF_title()); 
			ps.setString(2, vo.getF_poster());
			ps.setString(3, vo.getF_address());
			ps.setString(4, vo.getF_kind());
			ps.setString(5, vo.getF_tel());
			ps.setString(6, vo.getF_menu());
			ps.setString(7, vo.getF_time());

			// 실행 명령
			ps.executeUpdate(); // commit() => 자동으로 저장
		} catch (Exception ex) {
			// 오류 확인
			ex.printStackTrace();
		} finally {
			// 닫기
			disConnection();
		}
	}

}

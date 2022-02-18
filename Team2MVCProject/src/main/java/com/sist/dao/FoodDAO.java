package com.sist.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.FoodVO;

public class FoodDAO {
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

}
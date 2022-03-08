package com.sist.manager;

import java.sql.*;

import com.sist.vo.MovieVO;

public class MovieDataDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

   public MovieDataDAO() {
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

   public void movieInsert(MovieVO vo) {
      try {
         getConnection();
         String sql = "INSERT INTO movie_2 VALUES (m_no_seq_2.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
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
}
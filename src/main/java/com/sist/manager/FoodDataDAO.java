package com.sist.manager;

import java.sql.*;

import com.sist.vo.FoodVO;

public class FoodDataDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

   public FoodDataDAO() {
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
         getConnection();
         String sql = "INSERT INTO Food_2 VALUES (f_no_seq_2.NEXTVAL,?,?,?,?,?,?,?)";
         ps = conn.prepareStatement(sql);

         ps.setString(1,vo.getF_title()); // 음식점 이름
     	 ps.setString(2,vo.getF_poster()); // 음식 사진
     	 ps.setString(3,vo.getF_address()); // 음식점 주소
     	 ps.setString(4,vo.getF_kind()); // 음식 종류
     	 ps.setString(5,vo.getF_tel()); // 음식점 전화번호
     	 ps.setString(6,vo.getF_menu()); // 음식점 메뉴
     	 ps.setString(7,vo.getF_time()); // 영업시간

         ps.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
   }
}
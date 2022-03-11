package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.MovieSortVO;
import com.sist.vo.MovieVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewVO;

public class MovieDAO {
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

	// 영화 랭킹 관련
	public List<MovieVO> movieRanking() {
		List<MovieVO> list = new ArrayList<MovieVO>();

		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director,rownum "
					+ "FROM (SELECT m_no,m_title,m_poster,m_rate,m_director FROM movie ORDER BY m_no ASC)"
					+ "WHERE rownum<=10";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length() >= 14) {
					vo.setM_title(title.substring(0, 14) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_poster(rs.getString(3).substring(0, rs.getString(3).lastIndexOf("?")));
				vo.setM_rate(rs.getString(4));
				String director = rs.getString(5);
				if (director.length() >= 5) {
					vo.setM_director(director.substring(0, 5) + "…");
				} else {
					vo.setM_director(director);
				}

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 영화 현재 상영작
	public List<MovieVO> movieListData() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql = "SELECT /* INDEX_ASC(movie m_no_pk) */ m_no,m_title,m_poster,m_rate,m_director "
					+ "FROM movie "
					+ "WHERE m_rdate  LIKE '2022 .01.%' OR m_rdate LIKE '2022 .02.%' or m_rdate LIKE '2022 .03.%'";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length() >= 17) {
					vo.setM_title(title.substring(0, 15) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_rate(rs.getString(4));
				String director = rs.getString(5);
				if (director.length() >= 9) {
					vo.setM_director(director.substring(0, 9) + "…");
				} else {
					vo.setM_director(director);
				}

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 영화 상영 예정작
	public List<MovieVO> movieListData2() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql = "SELECT /* INDEX_ASC(movie m_no_pk) */ m_no,m_title,m_poster,m_time,m_director "
					+ "FROM movie " + "WHERE m_rdate LIKE '2022 .04%' " + "or m_rdate LIKE '2022 .05%' "
					+ "or m_rdate LIKE '2022 .06%' " + "or m_rdate LIKE '2022 .07%' " + "OR m_rdate LIKE '2022 .08%' "
					+ "OR m_rdate LIKE '2022 .09%' " + "OR m_rdate LIKE '2022 .10%' " + "OR m_rdate LIKE '2022 .11%' "
					+ "OR m_rdate LIKE '2022 .12%'";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length() >= 17) {
					vo.setM_title(title.substring(0, 15) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_time(rs.getString(4));
				vo.setM_director(rs.getString(5));

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 영화 평점순
	public List<MovieSortVO> movieListData3() {
		List<MovieSortVO> list = new ArrayList<MovieSortVO>();

		try {
			getConnection();
			String sql = "SELECT * FROM (SELECT ROUND(AVG(r_score),1) avgmovie,M_NO FROM review GROUP BY m_no ORDER BY avgmovie DESC) v JOIN movie ON v.m_no=movie.M_NO";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieSortVO vo = new MovieSortVO();
				vo.setAvgmoive(rs.getDouble(1));
				vo.setM_no(rs.getInt(2));
				vo.setM_no_1(rs.getInt(3));
				String title = rs.getString(4);
				if (title.length() >= 17) {
					vo.setM_title(title.substring(0, 15) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_genre(rs.getString(5));
				vo.setM_poster(rs.getString(6));
				vo.setM_time(rs.getString(7));
				vo.setM_director(rs.getString(8));
				vo.setM_cast(rs.getString(9));
				vo.setM_rdate(rs.getString(10));
				vo.setM_rate(rs.getString(11));
				vo.setM_cnt(rs.getString(12));
				vo.setM_preview(rs.getString(13));
				vo.setM_photo(rs.getString(14));
				list.add(vo);

			}
			System.out.println(list);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

		return list;
	}

	// 영화 많이 찜한순서
	public List<MovieSortVO> movieListData4() {
		List<MovieSortVO> list = new ArrayList<MovieSortVO>();

		try {
			getConnection();
			String sql = "SELECT * FROM (SELECT COUNT(w_no) coumovie,M_NO FROM wishlist GROUP BY m_no) v JOIN movie ON v.m_no=movie.M_NO ORDER BY coumovie DESC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieSortVO vo = new MovieSortVO();
				vo.setCoumoive(rs.getInt(1));
				vo.setM_no(rs.getInt(2));
				vo.setM_no_1(rs.getInt(3));
				String title = rs.getString(4);
				if (title.length() >= 17) {
					vo.setM_title(title.substring(0, 15) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_genre(rs.getString(5));
				vo.setM_poster(rs.getString(6));
				vo.setM_time(rs.getString(7));
				vo.setM_director(rs.getString(8));
				vo.setM_cast(rs.getString(9));
				vo.setM_rdate(rs.getString(10));
				vo.setM_rate(rs.getString(11));
				vo.setM_cnt(rs.getString(12));
				vo.setM_preview(rs.getString(13));
				vo.setM_photo(rs.getString(14));
				vo.setM_content(rs.getString(15));	

				list.add(vo);
			}
			System.out.println(list);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

		return list;
	}

	// 상세페이지
	public MovieVO movieDetailData(int no) {
		MovieVO vo = new MovieVO();
		try {
			getConnection();
			String sql = "SELECT * FROM movie WHERE m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
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

			rs.close();

		} catch (Exception e) {
		} finally {
			disConnection();
		}
		return vo;
	}

	public String[] moviePhotos(int no) {
		MovieVO vo = new MovieVO();
		String[] photo = new String[1];
		try {

			getConnection();
			String sql = "SELECT m_photo " + "FROM movie " + "WHERE m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();

			vo.setM_photo(rs.getString(1));
			photo = vo.getM_photo().split("|");
			rs.close();
		} catch (Exception e) {

		} finally {
			disConnection();
		}
		return photo;

	}

	// 리뷰 읽어오기 리스트
	public List<ReviewVO> reviewListData(int no) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();

		try {
			getConnection();
			String sql = "SELECT r_no,r_score,r_comend,r.u_id,r.r_gno,r.m_no " + "FROM review r, member u "
					+ "WHERE r.u_id=u.u_id " + "AND r.m_no=? " + "ORDER BY r_no DESC";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setR_no(rs.getInt(1));
				vo.setR_score(rs.getDouble(2));
				vo.setR_comend(rs.getString(3));
				vo.setU_id(rs.getString(4));
				vo.setR_gno(rs.getInt(5));
				vo.setM_no(rs.getInt(6));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

		return list;
	}

	// 리뷰 입력하기
	public void reviewInsert(ReviewVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO review(r_no,r_score,r_comend,u_id,m_no) " + "VALUES(r_no_seq.nextval,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, vo.getR_score());
			ps.setString(2, vo.getR_comend());
			ps.setString(3, vo.getU_id());
			ps.setInt(4, vo.getM_no());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	// 영화 검색 페이지
	public List<MovieVO> movieLocationFindData(String ss) {
		List<MovieVO> list = new ArrayList<MovieVO>();

		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_director,m_cast,m_rdate,m_genre,m_time " + "FROM movie "
					+ "WHERE m_title LIKE '%'||?||'%' " + "ORDER BY 1";
			ps = conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				vo.setM_title(rs.getString(2));
				vo.setM_poster(rs.getString(3));
				vo.setM_director(rs.getString(4));
				String cast = rs.getString(5);
				if (cast.length() >= 45) {
					vo.setM_cast(cast.substring(0, 45) + "…");
				} else {
					vo.setM_cast(cast);
				}
				vo.setM_rdate(rs.getString(6));
				vo.setM_genre(rs.getString(7));
				vo.setM_time(rs.getString(8));
				System.out.println(vo.getM_title());

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 영화 예매 수집
	public List<MovieVO> reserveMovieListData(int no) {
		List<MovieVO> list = new ArrayList<MovieVO>();

		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster FROM movie " + "WHERE m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				vo.setM_title(rs.getString(2));
				vo.setM_poster(rs.getString(3).substring(0, rs.getString(3).lastIndexOf("?")));

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

		return list;
	}

	// 영화 예매 Movie_ReservationVO.java
	public void movieReservation(ReserveVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO movie_reservation VALUES(mr_no_seq.nextval,?,?,?,?,?,?,?,systimestamp)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMr_location());
			ps.setString(2, vo.getMr_time());
			ps.setDate(3, vo.getMr_date());
			ps.setString(4, vo.getU_id());
			ps.setInt(5, vo.getM_no());
			ps.setString(6, vo.getMr_seat());
			ps.setInt(7, vo.getMr_room());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public void reviewGoodPlus(int r_no) {
		try {
			getConnection();
			String sql = "UPDATE review SET r_gno = r_gno+1 WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, r_no);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}

	}

	public int reviewGoodResult(int r_no) {
		int rer_no = 0;
		try {
			getConnection();
			String sql = "SELECT r_gno FROM review WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, r_no);

			ResultSet rs = ps.executeQuery();
			rer_no = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return rer_no;
	}

	public void reviewDelete(int r_no) {
		try {
			getConnection();
			String sql = "DELETE FROM review WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, r_no);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public void reviewModify(int r_no, double score, String comend) {
		try {
			getConnection();
			String sql = "UPDATE review SET r_score=?,r_comend=? WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, score);
			ps.setString(2, comend);
			ps.setInt(3, r_no);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public int getReviewCount(int m_no) {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM review WHERE m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_no);
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

	public List<ReviewVO> getPagingList(int m_no, int page) {
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			getConnection();
			String sql = "SELECT r_no,r_score,r_comend,u_id,r_gno,m_no,num FROM(SELECT rownum as num,r_no,r_score,r_comend,u_id,r_gno,m_no "
					+ "FROM (SELECT r_no,r_score,r_comend,u_id,r_gno,m_no " + "FROM review  WHERE m_no=? "
					+ "ORDER BY r_no DESC)) " + "WHERE num BETWEEN ? AND ?";
//				"SELECT * FROM (SELECT rownum num, mr.* 
//				FROM (SELECT movie_reservation.*,movie.m_title, movie.m_poster 
//						FROM movie_reservation 
//						JOIN movie on movie_reservation.m_no=movie.m_no 
//						WHERE movie_reservation.u_id=? 
//								ORDER BY movie_reservation.mr_date DESC) mr) 
//								WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 3;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setInt(1, m_no);
			ps.setInt(2, start);
			ps.setInt(3, end);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setR_no(rs.getInt(1));
				vo.setR_score(rs.getDouble(2));
				vo.setR_comend(rs.getString(3));
				vo.setU_id(rs.getString(4));
				vo.setR_gno(rs.getInt(5));
				vo.setM_no(rs.getInt(6));

				list.add(vo);
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 좋아요 증가 r_no로 값 증가시키기
	public void reviewIncrement(int r_no) {
		try {
			getConnection();
			String sql = "SELECT r_no FROM review WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, r_no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int db_rno = rs.getInt(1);
			rs.close();
			if (db_rno == r_no) {
				sql = "UPDATE review SET r_gno=r_gno+1 WHERE r_no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, r_no);
				ps.executeUpdate();
			} else {
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	// 좋아요 갯수 r_no로 총갯수(int) 리턴
	public int reviewCountData(int r_no) {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT r_gno ROM review WHERE r_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, r_no);
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
}

/*

*/

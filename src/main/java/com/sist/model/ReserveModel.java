package com.sist.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MovieDAO;
import com.sist.dao.MypageDAO;
import com.sist.vo.MovieVO;
import com.sist.vo.Movie_ReservationVO;
import com.sist.vo.ReserveVO;

public class ReserveModel {
	// 예매 메인화면
	@RequestMapping("reservation/movie_reservation.do")
	public String movie_reservation(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		System.out.println("no" + no);

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.reserveMovieListData(Integer.parseInt(no));

		request.setAttribute("list", list);

		request.setAttribute("main_jsp", "../reservation/movie_reservation.jsp");
		return "../jsp/main.jsp";
	}

	// 예매 지역선택창
	@RequestMapping("reservation/movie_location.do")
	public String movie_location(HttpServletRequest request, HttpServletResponse response) {
		String[] deongList = { "등촌동", "가산동", "성내동", "자양동", "방화동", "상계동", "도곡동", "독산동", "논현동", "봉천동", "상계동", "번동",
				"신도림동", "신림동", "소공동", "영등포동", "원효로동", "신천동", "진관동", "묵동", "전농동", "서교동", "동교동" };

		request.setAttribute("deongList", deongList);

		return "../reservation/movie_location.jsp";
	}

	// 예매 날짜선택창
	@RequestMapping("reservation/movie_date.do")
	public String movie_date(HttpServletRequest request, HttpServletResponse response) {

		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");

		String today = sdf.format(date);

		StringTokenizer st = new StringTokenizer(today, "-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();

		// default설정
		if (strYear == null)
			strYear = sy;
		if (strMonth == null)
			strMonth = sm;

		// 정수형 변환
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(sd);

		// 1월 1일부터 ~ 전년도까지의 총합
		int total = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400;
		// 1월 1일 - 전달까지의 합
		int[] lastday = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
			lastday[1] = 29; // 윤년이면
		} else {
			lastday[1] = 28; // 윤년이 아니면
		}

		for (int i = 0; i < month - 1; i++) {
			total += lastday[i];
		}
		total++;
		int week = total % 7;

		String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday[month - 1]);
		request.setAttribute("strWeek", strWeek);

		return "../reservation/movie_date.jsp";
	}

	// 예매 시간선택창
	@RequestMapping("reservation/movie_time.do")
	public String movie_time(HttpServletRequest request, HttpServletResponse response) {
		String[] time = { "10:00", "12:00", "14:00", "16:00", "18:00", "20:00" };

		request.setAttribute("time", time);

		return "../reservation/movie_time.jsp";
	}

	// 예매 좌석선택창
	@RequestMapping("reservation/movie_seat.do")
	public String movie_seat(HttpServletRequest request, HttpServletResponse response) {

		return "../reservation/movie_seat.jsp";
	}

	// 실제 DB에 예매 저장
	@RequestMapping("reservation/movie_reservation_ok.do")
	public String movie_reservationOk(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String m_no = request.getParameter("m_no");
		String mr_loc = request.getParameter("mr_loc");
		// 2022-3-10
		String mr_date = request.getParameter("mr_date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(mr_date);
		long date2 = date1.getTime();
		java.sql.Date sqlDate = new java.sql.Date(date2);

		String mr_room = request.getParameter("mr_room");
		String mr_time = request.getParameter("mr_time");
		String mr_seat = request.getParameter("mr_seat");

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");

		ReserveVO vo = new ReserveVO();
		vo.setM_no(Integer.parseInt(m_no));
		vo.setMr_location(mr_loc);
		vo.setMr_date(sqlDate);
		vo.setMr_room(Integer.parseInt(mr_room));
		vo.setMr_time(mr_time);
		vo.setMr_seat(mr_seat);
		vo.setU_id(u_id);

		MovieDAO dao = new MovieDAO();
		dao.movieReservation(vo);
		
		return "redirect:../reservation/movie_reserve.do";
	}
	
	@RequestMapping("reservation/movie_reserve.do")
	public String movie_reserve(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");

		MypageDAO dao = new MypageDAO();
		Movie_ReservationVO vo = dao.reservationListData(u_id);

		request.setAttribute("vo", vo);

		request.setAttribute("main_jsp", "../reservation/movie_reserve.jsp");
		return "../jsp/main.jsp";
	}
}

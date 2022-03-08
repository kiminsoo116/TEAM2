package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
import com.sist.vo.Movie_ReservationVO;
import com.sist.vo.MyReviewVO;

public class MypageModel {

	@RequestMapping("mypage/reservation.do")
	public String mypage_getreservation(HttpServletRequest request, HttpServletResponse response) {
		MypageDAO dao = new MypageDAO();


		// 로그인 정보 받아오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("u_id");

		// 페이지 받아오기
		int page = 1;
		String page_ = request.getParameter("p");
		if (page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}

		// 페이지수를 위한예약건수 확인
		int count = dao.getReservationCount(id);

		List<Movie_ReservationVO> list = dao.getReservationList(id, page);
		
				request.setAttribute("count", count);
				request.setAttribute("list",list);
				request.setAttribute("main_jsp", "../mypage/reservation.jsp");

				return "../jsp/main.jsp";
			}

			@RequestMapping("mypage/myreview.do")
			public String myReviewList(HttpServletRequest request, HttpServletResponse response) {
				MypageDAO dao = new MypageDAO();
						//로그인 정보 받아오기
						HttpSession session=request.getSession();
						String id = (String)session.getAttribute("u_id");
						
						//페이지 받아오기
						int page = 1;
						String page_ = request.getParameter("p");
						if(page_!=null && !page_.equals("")) {
							page=Integer.parseInt(page_);
						}	
						
					int count = dao.getReservationCount(id);	
					List<MyReviewVO> list = dao.myReviewList(id, page);	
					
					request.setAttribute("count", count);
					request.setAttribute("list", list);
					request.setAttribute("main_jsp", "../mypage/myreview.jsp");
				return "../jsp/main.jsp";
			}
			
			@RequestMapping("mypage/myinfo.do")
			public String myInfoChange(HttpServletRequest request, HttpServletResponse response) {
				MypageDAO dao = new MypageDAO();
				//로그인 정보 받아오기
				HttpSession session=request.getSession();
				String id = (String)session.getAttribute("u_id");
				
				request.setAttribute("main_jsp", "../mypage/myinfo.jsp");
				return "../jsp/main.jsp";
			}
		}

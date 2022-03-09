package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
import com.sist.vo.Movie_ReservationVO;
import com.sist.vo.MyReviewVO;
import com.sist.vo.WishVO;

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
				
				request.setAttribute("main_jsp", "../mypage/myInfo.jsp");
				return "../jsp/main.jsp";
			}
			
			@RequestMapping("mypage/wish.do")
			public String mypage_wish(HttpServletRequest request, HttpServletResponse response) {
				MypageDAO dao = new MypageDAO();
				int page = 1;
				String page_ = request.getParameter("p");
				if(page_!=null && !page_.equals("")) {
					page=Integer.parseInt(page_);
				}	
				
				HttpSession session=request.getSession();
				String id = (String)session.getAttribute("u_id");
				
				List<WishVO> list = dao.getWishList(id,page);
				int count = dao.getWishListCount(id);
				
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				request.setAttribute("main_jsp", "../mypage/wish.jsp");
				
				return "../jsp/main.jsp";
			}
		@RequestMapping("mypage/cancelreservation.do")
		public String mypage_cancelreservation(HttpServletRequest request, HttpServletResponse response) {
			MypageDAO dao = new MypageDAO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("u_id");
			String mr_no = request.getParameter("mr_no");
			
			dao.cancelReservation(id, mr_no);
			
			return "redirect:reservation.do"; 
			
		}
		
		@RequestMapping("mypage/deletereview.do")
		public String mypage_deletereview(HttpServletRequest request, HttpServletResponse response) {
			MypageDAO dao = new MypageDAO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("u_id");
			String r_no = request.getParameter("r_no");
			
			dao.deleteReview(id, r_no);
			
			return "redirect:myreview.do"; 
			
		}
		
		}
		

package com.sist.model;

import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

public class MovieModel {
	@RequestMapping("movie/movie_detail.do")
	public String movieDetailData(HttpServletRequest request, HttpServletResponse response) {
		// 1. 사용자가 보내준 값을 받는다
		String no = request.getParameter("no");

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");

		MovieDAO dao = new MovieDAO();
		MovieVO vo = dao.movieDetailData(Integer.parseInt(no));
		String[] photos = dao.moviePhotos(Integer.parseInt(no));
		String hPhoto = photos[0];

		//페이지받아오기
		int page = 1;
		String page_ = request.getParameter("p");
		if(page_!=null && !page_.equals("")) {
			page=Integer.parseInt(page_);
		}
						
		int rcount = dao.getReviewCount(Integer.parseInt(no));
		request.setAttribute("rcount", rcount);
		List<ReviewVO> list = dao.getPagingList(Integer.parseInt(no),page);
		if (list == null) {
			String msg = "가 없습니다.";
			request.setAttribute("msg", msg);
		} else {
			request.setAttribute("list", list);
		}
		// 찜 대상 확인
		JjimDAO jdao = new JjimDAO();
		JjimVO jvo = new JjimVO();
		jvo.setM_no(Integer.parseInt(no));
		jvo.setU_id(u_id);
		int count = jdao.jjimCountData(jvo);
		int wno = jdao.jjimCountData2(jvo);

		request.setAttribute("count", count);
		request.setAttribute("wno", wno);

		// JSP로 출력하기 위해서 데이터를 보내준다
		request.setAttribute("vo", vo);
		request.setAttribute("hPhoto", hPhoto);

		request.setAttribute("main_jsp", "../movie/movie_detail.jsp");

		return "../jsp/main.jsp";
	}

	@RequestMapping("movie/movie_detail_before.do")
	public String movie_detail_before(HttpServletRequest request, HttpServletResponse response) {
		// 화면 include가 없다 => detail로 화면을 변경 => sendRedirect
		// 쿠키만 저장 => 사용자에게 쿠키 전송
		String no = request.getParameter("no");
		// 1. 쿠키생성
		Cookie cookie = new Cookie("m" + no, no);
		cookie.setPath("/");
		// 2. 저장 기간 설정
		cookie.setMaxAge(60 * 60 * 24); // 24시간 => 초단위로 저장
		// 3. 클라이언트 브라우저로 전송
		response.addCookie(cookie);
		// sendRedirect ==> 링크없이 바로 화면이동 _ok.jsp
		return "redirect:../movie/movie_detail.do?no=" + no;

	}

	@RequestMapping("movie/insertReview.do")
	public String ReviewDataInsert(HttpServletRequest request, HttpServletResponse response) {
		int m_no = Integer.parseInt(request.getParameter("no"));

		try {

			request.setCharacterEncoding("UTF-8");

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			// r_no,r_score,r_comend,r.u_id,r.m_no "

		} catch (Exception e) {
		}

		double r_score = Double.parseDouble(request.getParameter("r_score"));
		String r_comend = request.getParameter("r_comend");
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");

		MovieDAO dao = new MovieDAO();
		ReviewVO vo = new ReviewVO();
		vo.setR_score(r_score);
		vo.setR_comend(r_comend);
		vo.setU_id(u_id);
		vo.setM_no(m_no);

		dao.reviewInsert(vo);
		return "redirect:../movie/movie_detail.do?no=" + m_no;


	}
	
	@RequestMapping("movie/deleteReivew.do")
	public String reviewDelete(HttpServletRequest request, HttpServletResponse response) {
		int m_no = Integer.parseInt(request.getParameter("no"));
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		MovieDAO dao = new MovieDAO();
		dao.reviewDelete(r_no);
		
		return "redirect:../movie/movie_detail.do?no=" + m_no;
		
	}
	
	@RequestMapping("movie/updateReview.do")
	public String reviewUpdate(HttpServletRequest request, HttpServletResponse response) {
		int m_no = Integer.parseInt(request.getParameter("no"));
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		String comend = request.getParameter("r_comend");
		double score = Double.parseDouble(request.getParameter("r_score"));
		MovieDAO dao = new MovieDAO();
		dao.reviewModify(r_no, score, comend);
		
		return "redirect:../movie/movie_detail.do?no=" + m_no;
	}

	@RequestMapping("movie/moviereviewGood.do")
	public String reviewGoodInsert(HttpServletRequest request, HttpServletResponse response) {
		int m_no = Integer.parseInt(request.getParameter("no"));
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		MovieDAO dao = new MovieDAO();
		dao.reviewGoodPlus(r_no);
		request.setAttribute("rer_no", dao.reviewGoodResult(r_no));
		
		request.setAttribute("main_jsp", "../movie/movie_detail.jsp");
		return "redirect:../movie/movie_detail.do?no=" + m_no;
	}
	
	@RequestMapping("movie/moviereviewGoodRe.do")
	public String reviewGoodReload(HttpServletRequest request, HttpServletResponse response) {
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		MovieDAO dao = new MovieDAO();
		dao.reviewGoodResult(r_no);
		request.setAttribute("rer_no", dao.reviewGoodResult(r_no));
		return "../movie/review_good.jsp";
	}
	
	@RequestMapping("movie/location.do")
	public String movieLocationData(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String ss = request.getParameter("ss");

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.movieLocationFindData(ss);

		request.setAttribute("list", list);
		request.setAttribute("ss", ss);
		request.setAttribute("size", list.size());

		request.setAttribute("main_jsp", "../movie/location.jsp");

		return "../jsp/main.jsp";
	}
	
	@RequestMapping("movie/like_select.do")
	public String review_likeadd(HttpServletRequest request, HttpServletResponse response) {

		String r_no = request.getParameter("rno");
		System.out.println(r_no);
		String m_no = request.getParameter("mno");
		System.out.println(m_no);

		MovieDAO dao = new MovieDAO();
		ReviewVO rvo = new ReviewVO();
		rvo.setM_no(Integer.parseInt(m_no));
		
		dao.reviewIncrement(Integer.parseInt(r_no));
		
		request.setAttribute("r_no", r_no);
		return "redirect:../movie/movie_detail.do?no=" + m_no;
	}
}

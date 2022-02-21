package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MovieDAO;
import com.sist.vo.MovieVO;

public class MovieModel {
	@RequestMapping("movie/movie_detail.do")
	public String movieDetailData(HttpServletRequest request, HttpServletResponse response) {
		// 1. 사용자가 보내준 값을 받는다
		String no = request.getParameter("no");
		MovieDAO dao = new MovieDAO();
		MovieVO vo = dao.movieDetailData(Integer.parseInt(no));

		// JSP로 출력하기 위해서 데이터를 보내준다
		request.setAttribute("vo", vo);

		request.setAttribute("main_jsp", "../movie/movie_detail.jsp");

		return "../jsp/main.jsp";
	}
}

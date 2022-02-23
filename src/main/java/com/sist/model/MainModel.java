package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {
	
	@RequestMapping("jsp/main.do")
	public String main_section(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.movieRanking();
		List<MovieVO> list2 = dao.movieListData();

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		request.setAttribute("main_jsp", "../jsp/section.jsp");
		
		return "../jsp/main.jsp";
	}
	
	

}

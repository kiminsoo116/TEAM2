package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {

	@RequestMapping("jsp/main.do")
	public String main_section(HttpServletRequest request) {
//		String page = request.getParameter("page");
//		String no = request.getParameter("no");

//		if (page == null)
//			page = "1"; // 첫페이지 실행
//		int curpage = Integer.parseInt(page);// 현재페이지 만들기

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.movieRanking();
		List<MovieVO> list2 = dao.movieListData();
//		int totalpage = dao.totalPage();
//		request.setAttribute("curpage", curpage);
//		request.setAttribute("totalpage", totalpage);

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
//		MovieVO vo = dao.movieDetailData(Integer.parseInt(no));
//
//		request.setAttribute("vo", vo);
//		request.setAttribute("page", page);

		return "../jsp/main.jsp";
	}

}

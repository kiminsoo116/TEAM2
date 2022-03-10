package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {

	@RequestMapping("jsp/main.do")
	public String main_section(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.movieRanking();

		Cookie[] cookies = request.getCookies();
		// cookie,session => request를 이용해서 사용이 가능
		List<MovieVO> cList = new ArrayList<MovieVO>();
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("m")) {
					cookies[i].setPath("/");
					String no = cookies[i].getValue();
					MovieVO vo = dao.movieDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		List<MovieVO> list2 = dao.movieListData();

		request.setAttribute("list2", list2);
		request.setAttribute("cList", cList);
		request.setAttribute("list", list);

		request.setAttribute("main_jsp", "../jsp/section.jsp");

		return "../jsp/main.jsp";
	}

	// 현재 상영작
	@RequestMapping("jsp/movie_sort1.do")
	public String movie_sort1(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list2 = dao.movieListData();

		request.setAttribute("list2", list2);

		return "../jsp/movie_sort1.jsp";
	}

	// 개봉 예정작
	@RequestMapping("jsp/movie_sort2.do")
	public String movie_sort2(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list3 = dao.movieListData2();

		request.setAttribute("list3", list3);

		return "../jsp/movie_sort2.jsp";
	}

	// 영화 평점순
	@RequestMapping("jsp/movie_sort3.do")
	public String movie_sort3(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieSortVO> list4 = dao.movieListData3();
		System.out.println(list4);
		request.setAttribute("list4", list4);

		return "../jsp/movie_sort3.jsp";
	}

	// 영화 보고싶어요순
	@RequestMapping("jsp/movie_sort4.do")
	public String movie_sort4(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieSortVO> list5 = dao.movieListData4();
		request.setAttribute("list5", list5);

		return "../jsp/movie_sort4.jsp";
	}

}

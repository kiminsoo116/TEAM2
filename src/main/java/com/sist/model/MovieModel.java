package com.sist.model;

import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;

public class MovieModel {
	@RequestMapping("movie/movie_detail.do")
	public String movieDetailData(HttpServletRequest request, HttpServletResponse response) {
		// 1. 사용자가 보내준 값을 받는다
		String no = request.getParameter("no");
		MovieDAO dao = new MovieDAO();
		MovieVO vo = dao.movieDetailData(Integer.parseInt(no));
		String[]photos = dao.moviePhotos(Integer.parseInt(no));
		String hPhoto = photos[0];

		// JSP로 출력하기 위해서 데이터를 보내준다
		request.setAttribute("vo", vo);
		request.setAttribute("hPhoto", hPhoto);

		request.setAttribute("main_jsp", "../movie/movie_detail.jsp");

		return "../jsp/main.jsp";
	}
	  @RequestMapping("movie/movie_detail_before.do")
	  public String movie_detail_before(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  // 화면 include가 없다 => detail로 화면을 변경 => sendRedirect
		  // 쿠키만 저장 => 사용자에게 쿠키 전송
		  String no=request.getParameter("no");
		  // 1. 쿠키생성 
		  Cookie cookie=new Cookie("m"+no, no);
		  cookie.setPath("/");
		  // 2. 저장 기간 설정 
		  cookie.setMaxAge(60*60*24); // 24시간 => 초단위로 저장 
		  // 3. 클라이언트 브라우저로 전송 
		  response.addCookie(cookie);
		  // sendRedirect ==> 링크없이 바로 화면이동 _ok.jsp
		  return "redirect:../movie/movie_detail.do?no="+no;
		  		
	  }
	
}

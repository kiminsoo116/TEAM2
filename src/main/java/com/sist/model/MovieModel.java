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
		
		
		List<ReviewVO> list = dao.reviewListData(Integer.parseInt(no));
//좋아요 미리 해보던 부분------------------------------------------------
		if(list==null) {
			String msg = "가 없습니다.";
			request.setAttribute("msg", msg);
		}else {
			request.setAttribute("list", list);
		}
//------------------------------------------------------------------
		

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
	  
	  @RequestMapping("movie/insertReview.do")
		public String ReviewDataInsert(HttpServletRequest request, HttpServletResponse response) {
			int m_no = Integer.parseInt(request.getParameter("no"));
			
			try {
				
				request.setCharacterEncoding("UTF-8");
				
				response.setCharacterEncoding("UTF-8");
			    response.setContentType("text/html; charset=UTF-8");
				//r_no,r_score,r_comend,r.u_id,r.m_no "
				
				
				
			}catch(Exception e) {
						}
			
			double r_score = Double.parseDouble(request.getParameter("r_score"));
			String r_comend = request.getParameter("r_comend");
			String u_id = request.getParameter("u_id");
			
			MovieDAO dao = new MovieDAO();
			ReviewVO vo = new ReviewVO();
			vo.setR_score(r_score);
			vo.setR_comend(r_comend);
			vo.setU_id(u_id);
			vo.setM_no(m_no);
			
			dao.reviewInsert(vo);
			return "redirect:../movie/movie_detail.do?no="+m_no;
			
		}
	
}

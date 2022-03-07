package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
import com.sist.vo.Movie_ReservationVO;

public class MypageModel {
	
	@RequestMapping("mypage/reservation.do")
	public String mypage_getreservation(HttpServletRequest request, HttpServletResponse response) {
		MypageDAO dao = new MypageDAO();
		
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("u_id");
		
		int page=1;
		
		List<Movie_ReservationVO> list = dao.getReservationList(id,page);
		
		
		request.setAttribute("list",list);
		request.setAttribute("main_jsp", "../mypage/reservation.jsp");
		
		return "../jsp/main.jsp";
	}

}

package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

public class JjimModel {
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response) {
		String m_no = request.getParameter("no");
		System.out.println("m_no" + m_no);

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");

		JjimDAO dao = new JjimDAO();
		JjimVO vo = new JjimVO();
		vo.setU_id(u_id);
		vo.setM_no(Integer.parseInt(m_no));
		dao.jjumInsert(vo);

		return "redirect:../movie/movie_detail.do?no=" + m_no;
	}

	@RequestMapping("jjim/jjim_delete.do")
	public String jjim_delete(HttpServletRequest request, HttpServletResponse response) {
		String m_no = request.getParameter("no");
		System.out.println("m_no" + m_no);
		String no = request.getParameter("wno");
		System.out.println("wno" + no);

		JjimDAO dao = new JjimDAO();
		dao.jjimDelete(Integer.parseInt(no));

		return "redirect:../movie/movie_detail.do?no="+ m_no;
	}
}

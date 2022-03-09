package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MyInfoChangeModel {

	  @RequestMapping("mypage/join_update.do")
	   public String joinUpdate(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   // 정보를 출력해 준다
		   HttpSession session=request.getSession();
		   // id,name가 저장 
		   String id=(String)session.getAttribute("u_id");
		   // DAO연동 => id에 해당되는 데이터를 읽어 온다 
		   MemberDAO dao=new MemberDAO();
		   MemberVO vo=dao.memberUpdateData(id);
		   request.setAttribute("vo", vo); //DTO 
		   // vo=> JSP에서 출력에 필요한 데이터를 전송하는 목적으로 모아서 처리 
		   request.setAttribute("main_jsp", "../mypage/join_update.jsp");
		   return "../jsp/main.jsp";
	   }
	   // 실제 수정 
	   @RequestMapping("mypage/join_update_ok.do")
	   public String memberJoinUpdateOk(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex){}
		   // 입력값 받기 
		   String id=request.getParameter("u_id");
		   String pwd=request.getParameter("u_pw");
		   String name=request.getParameter("u_name");
		   String sex=request.getParameter("u_sex");
		   String email=request.getParameter("u_email");
		   String tel=request.getParameter("u_tel");
		   // MemberDAO로 전송 ==> 오라클 Insert
		   MemberVO vo=new MemberVO();
		   vo.setU_id(id);
		   vo.setU_pw(pwd);
		   vo.setU_name(name);
		   vo.setU_sex(sex);
		   vo.setU_email(email);
		   vo.setU_tel(tel);
		   MemberDAO dao=new MemberDAO();
		   boolean bCheck=dao.memberUpdateOk(vo);
		   if(bCheck==true)
		   {
			   HttpSession session=request.getSession();
			   session.setAttribute("name", name);
		   }
		   request.setAttribute("bCheck", bCheck);
		   return "../mypage/join_update_ok.jsp";
	   }
}

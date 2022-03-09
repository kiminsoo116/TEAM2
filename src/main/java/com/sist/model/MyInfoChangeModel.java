package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.MyInfoDAO;
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
		   String id=request.getParameter("id");
		   String pwd=request.getParameter("pwd1");
		   String name=request.getParameter("name");
		   String sex=request.getParameter("sex");
		   String email=request.getParameter("email");
		   String tel=request.getParameter("tel1")+request.getParameter("tel2");
		   // MemberDAO로 전송 ==> 오라클 Insert
		   MemberVO vo=new MemberVO();
		   vo.setU_id(id);
		   vo.setU_pw(pwd);
		   vo.setU_name(name);
		   vo.setU_sex(sex);
		   vo.setU_email(email);
		   vo.setU_tel(tel);
		   MyInfoDAO dao=new MyInfoDAO();
		   dao.myInfoChange(vo);
//		   boolean bCheck=dao.memberUpdateOk(vo);
//		   boolean bCheck=true;
//		   if(bCheck==true)
//		   {
//			   HttpSession session=request.getSession();
//			   session.setAttribute("name", name);
			   
//		   }
//		   request.setAttribute("bCheck", bCheck);
		   return "redirect:../jsp/main.do";
	   }
}

package com.sist.model;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
/*
 *    로그인 
 *    회원가입 
 *      = 가입
 *      = 아이디 중복체크
 *      = 우편번호 검색 
 *    회원수정 
 *      = 수정
 *      = 우편번호 검색 
 *    회원탈퇴 
 *    아이디 찾기 / 비밀번호 찾기 
 */
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
public class MemberModel {
   @RequestMapping("log/login.do")
   public String memberLogin(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   String u_id=request.getParameter("u_id");
	   String u_pw=request.getParameter("u_pw");
	   System.out.println("123124");
	   MemberDAO dao=new MemberDAO();
	   String result=dao.isLogin(u_id, u_pw);
	   request.setAttribute("result", result);//id,pwd,ok
	   if(!(result.equals("NOID")||result.equals("NOPWD")))
	   {
		   HttpSession session=request.getSession();
		   //StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("u_id", u_id);
		   //session.setAttribute("name", st.nextToken());
		   //session.setAttribute("admin", Integer.parseInt(st.nextToken()));
	   }
	   return "../log/login.jsp";
   }
	
	  @RequestMapping("log/logout.do") public String
	 memberLogout(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession(); session.invalidate(); //session해제
	 return "redirect:../jsp/main.do"; }
	  
	
   @RequestMapping("join/join.do")
   public String memberJoin(HttpServletRequest request,HttpServletResponse
		   response) throws ParseException
   {
	   
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   String u_id=request.getParameter("u_id");
	   String u_pw=request.getParameter("u_pw");
	   String u_pw2=request.getParameter("u_pw2"); 
	   String u_name=request.getParameter("u_name");
	   Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("u_birth1"));
	      long u_birth1 = date.getTime();
	      java.sql.Date sqlDate = new java.sql.Date(u_birth1);
	   
	   String u_sex=request.getParameter("u_sex");
	   String u_email=request.getParameter("u_email");
	   String u_tel=request.getParameter("u_tel");
	   
	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=new MemberVO();
	   vo.setU_id(u_id);
	   vo.setU_pw(u_pw);
	   vo.setU_name(u_name);
	   vo.setU_birth1(sqlDate);
	   vo.setU_sex(u_sex);
	   vo.setU_email(u_email);
	   vo.setU_tel(u_tel);
	   
	   String result=dao.isJoin(vo, u_id, u_pw, u_pw2, u_name, sqlDate, u_sex, u_email, u_tel);
	   
	   request.setAttribute("result", result);
	   
	   return "../join/join.jsp";
		
   }
   
   @RequestMapping("join/idcheck.do")
   public String memberIdCheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../join/idcheck.jsp";
   }
   
   @RequestMapping("join/idcheck_result.do")
   public String memberIdCheckResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   //1. ajax에서 넘어온 데이털,ㄹ 받는다 
	   String u_id=request.getParameter("u_id");
	   //2. 오라클 연동 
	   MemberDAO dao=new MemberDAO();
	   int count=dao.isIdcheck(u_id);
	   //3. 결과값을 JSP로 전송 => 스프링의 80% 정리 
	   request.setAttribute("count", count);
	   return "../join/idcheck_result.jsp";// request를 받는 JSP
   }
   
   @RequestMapping("join/emailcheck.do")
   public String memberEmailCheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../join/emailcheck.jsp";
   }
   
   @RequestMapping("join/emailcheck_result.do")
   public String memberEmailCheckResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   //1. ajax에서 넘어온 데이털,ㄹ 받는다 
	   String u_email=request.getParameter("u_email");
	   //2. 오라클 연동 
	   MemberDAO dao=new MemberDAO();
	   int count=dao.isEmailcheck(u_email);
	   //3. 결과값을 JSP로 전송 => 스프링의 80% 정리 
	   request.setAttribute("count", count);
	   return "../join/idcheck_result.jsp";// request를 받는 JSP
   }
   
   @RequestMapping("join/telcheck.do")
   public String memberTelCheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../join/telcheck.jsp";
   }
   
   @RequestMapping("join/telcheck_result.do")
   public String memberTelCheckResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   //1. ajax에서 넘어온 데이털,ㄹ 받는다 
	   String u_tel=request.getParameter("u_tel");
	   //2. 오라클 연동 
	   MemberDAO dao=new MemberDAO();
	   int count=dao.isTelcheck(u_tel);
	   //3. 결과값을 JSP로 전송 => 스프링의 80% 정리 
	   request.setAttribute("count", count);
	   return "../join/idcheck_result.jsp";// request를 받는 JSP
   }
   
   
   
}















package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.MyInfoDAO;

public class MyInfoModel {
	@RequestMapping("../mypage/myInfosubmit.do")
	   public String myInfoSumit(HttpServletRequest request,HttpServletResponse
			   response)
	   {
		   String u_pw=request.getParameter("u_pw");
		   MyInfoDAO dao=new MyInfoDAO();
		   String result=dao.myInfoSumit(u_pw);
		   request.setAttribute("result", result);//id,pwd,ok
			   //StringTokenizer st=new StringTokenizer(result,"|");
			   //session.setAttribute("name", st.nextToken());
			   //session.setAttribute("admin", Integer.parseInt(st.nextToken()));
		   
		   return "../mypage/myInfosubmit.jsp";
	   }
}

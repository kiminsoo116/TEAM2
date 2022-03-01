package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.StringTokenizer;

import com.sist.controller.RequestMapping;

import com.sist.dao.*;
public class FindModel {
   @RequestMapping("find/result.do")
   public String memberFind(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   String u_name=request.getParameter("u_name");
	   String u_tel=request.getParameter("u_tel");
	   
	   FindDAO dao=new FindDAO();
	   String result=dao.isFind(u_name, u_tel);
	   request.setAttribute("result", result);//id,pwd,ok
	   if(!(result.equals("NONAME")||result.equals("NOTEL")))
	   {
		   HttpSession session=request.getSession();
		   StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("u_name", u_name);
		   session.setAttribute("u_id", st.nextToken());
		   session.setAttribute("u_email", st.nextToken());
		   
	   }
	   return "../find/find.jsp";
   }
   @RequestMapping("find/resultid.do")
   public String memberResultid(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   HttpSession session=request.getSession();
	   session.getAttribute("u_id");
	   return "../find/resultid.jsp";
	   
   }
   
   @RequestMapping("find/email.do")
   public String memberEmail(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   String u_name=request.getParameter("u_name");
	   String u_email=request.getParameter("u_email");
	   
	   FindDAO dao=new FindDAO();
	   String result=dao.isFindEmail(u_name, u_email);
	   request.setAttribute("result", result);//id,pwd,ok
	   if(!(result.equals("NONAME")||result.equals("NOEMAIL")))
	   {
		   HttpSession session=request.getSession();
		   StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("u_name", u_name);
		   session.setAttribute("u_id", st.nextToken());
		   session.setAttribute("u_tel", st.nextToken());
		   
	   }
	   return "../find/findemail.jsp";
	   
   }
   
   @RequestMapping("find/result2.do")
   public String memberFindpass(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   String u_id=request.getParameter("u_id");
	   String u_name=request.getParameter("u_name");
	   String u_tel=request.getParameter("u_tel");
	   
	   FindDAO dao=new FindDAO();
	   String result=dao.isFindpass(u_id,u_name, u_tel);
	   request.setAttribute("result", result);
	   if(!(result.equals("NONAME")||result.equals("NOTEL")||result.equals("NOID")))
	   {
		   HttpSession session=request.getSession();
		   StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("u_name", u_name);
		   session.setAttribute("u_birth", st.nextToken());
		   session.setAttribute("u_pw", st.nextToken());
		   
	   }
	   return "../find/find2.jsp";
   }
   
   @RequestMapping("find/resultpass.do")
   public String memberResultpass(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   HttpSession session=request.getSession();
	   session.getAttribute("u_pw");
	   return "../find/resultpass.jsp";
	   
   }
   
   @RequestMapping("find/email2.do")
   public String memberFindemail(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (Exception e) {}
	   String u_id=request.getParameter("u_id");
	   String u_name=request.getParameter("u_name");
	   String u_email=request.getParameter("u_email");
	   
	   FindDAO dao=new FindDAO();
	   String result=dao.isFindEmail2(u_id,u_name,u_email);
	   request.setAttribute("result", result);
	   if(!(result.equals("NONAME")||result.equals("NOEMAIL")||result.equals("NOID")))
	   {
		   HttpSession session=request.getSession();
		   StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("u_name", u_name);
		   session.setAttribute("u_birth", st.nextToken());
		   session.setAttribute("u_pw", st.nextToken());
		   
	   }
	   return "../find/findemail2.jsp";
	   
   }
  
}















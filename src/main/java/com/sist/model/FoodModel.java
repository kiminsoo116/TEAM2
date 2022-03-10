package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;


public class FoodModel {
	
	@RequestMapping("food/location.do")
	  public String food_location(HttpServletRequest request,
			 HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  
		  
			
			/*
			 * String ss=request.getParameter("ss"); if(ss==null) ss="강남";
			 */
			 
		 
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  
		  String loc=request.getParameter("loc");
		  
		  loc=loc.substring(0, loc.lastIndexOf("동")); 
		  
		  int curpage=Integer.parseInt(page);
		 
		  FoodDAO dao=new FoodDAO();
		  List<FoodVO> list=dao.foodLocationFindData(loc, curpage);
		  
		  
		  int totalpage=dao.foodLoactionFindTotalPage(loc);
		 
		  request.setAttribute("list", list);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("loc", loc);
		  request.setAttribute("size", list.size());
		  request.setAttribute("main_jsp", "../food/location.jsp");
		  
		  return "../jsp/main.jsp";
	  }
	
		
		/*
		 * @RequestMapping("food/food_detail.do") // DispatcherServlet ==>
		 * invoke(obj,request,response) => Cookie public String
		 * food_detail(HttpServletRequest request, HttpServletResponse response) { // 화면
		 * 변경 ==> main_jsp //1. 사용자가 보내준 데이터 출력 String
		 * f_no=request.getParameter("f_no"); String
		 * f_kind=request.getParameter("f_kind");
		 * 
		 * 
		 * FoodDAO dao=new FoodDAO(); FoodVO
		 * vo=dao.foodDetailData(Integer.parseInt(f_no)); String
		 * address=vo.getF_address();
		 * 
		 * request.setAttribute("vo", vo); // 댓글 (X)
		 * 
		 * request.setAttribute("main_jsp", "../food/food_detail.jsp"); return
		 * "../main/main.jsp"; }
		 */
		  
		  @RequestMapping("food/food_detail.do") 
		  public String foodShadowCheck(HttpServletRequest request, HttpServletResponse response) {
		  String f_no=request.getParameter("f_no"); 
		  System.out.println(f_no);
		  
		  FoodDAO dao=new FoodDAO(); 
		  FoodVO vo=dao.foodDetailData(Integer.parseInt(f_no)); 
			/* String title=vo.getF_title(); */
		  
		  request.setAttribute("vo", vo);
		  
			/* request.setAttribute("f_title", title); */
		  
		 return "../food/food_detail.jsp"; 
		 }
		  
		  
		 
	

}

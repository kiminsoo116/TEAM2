package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {
	
	@RequestMapping("jsp/main.do")
	public String main_section(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = dao.movieRanking();
		List<MovieVO> list2 = dao.movieListData();

		  Cookie[] cookies=request.getCookies();
		  //cookie,session => request를 이용해서 사용이 가능 
		  List<MovieVO> cList=new ArrayList<MovieVO>();
		  if(cookies!=null)
		  {
			  for(int i=cookies.length-1;i>=0;i--)
			  {
				  if(cookies[i].getName().startsWith("m"))
				  {
					  cookies[i].setPath("/");
					  String no=cookies[i].getValue(); 
					  MovieVO vo=dao.movieDetailData(Integer.parseInt(no));
					  cList.add(vo);
				  }
			  }
		  }
		request.setAttribute("cList", cList);  
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		request.setAttribute("main_jsp", "../jsp/section.jsp");
		
		return "../jsp/main.jsp";
	}
	
	

}

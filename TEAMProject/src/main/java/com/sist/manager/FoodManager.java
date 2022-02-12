package com.sist.manager;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.*;

public class FoodManager {
	public static void main(String[] args) {
		FoodManager m = new FoodManager();
		m.foodWebData();
	}

	public void foodWebData()
    {
    	try
    	{
    		// 오라클에 있는 link데이터 읽기 
    		FoodDAO dao=new FoodDAO();
    		List<CategoryVO> list=dao.categoryListData();
    	    FoodVO fvo=new FoodVO();
    		for(CategoryVO vo:list)
    		{
    			System.out.println("======="+vo.getTitle()+"========");
    			
    			Document doc=Jsoup.connect(vo.getLink()).get();
    			Elements link=doc.select("span.title a");
    			
    			fvo.setCno(vo.getCno());
    			for(int i=0;i<link.size();i++) {
    				
    			}
    		}
    	} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

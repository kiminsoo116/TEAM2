package com.sist.manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.*;
import com.sist.vo.FoodVO;

public class FoodManager {

	//지역별 음식점 정보 수집
   public static void main(String[] args) {
      try {
    	  for (int i=1;i<=10;i++) {
         FoodDAO dao = new FoodDAO();

         Document doc = Jsoup.connect("https://www.mangoplate.com/search/영등포동?keyword=영등포동&page="+i).timeout(30000).get();

         Elements foods = doc.select("figcaption div a");
         Elements posters = doc.select("div.thumb img");

         for (int j = 0; j < foods.size(); j++) {
            FoodVO f = new FoodVO();

            /** 음식점 이름 **/
            f.setF_title(foods.get(j).text());
            
            /** 대표사진 **/
            f.setF_poster(posters.get(j).attr("data-original"));

            Document doc2 = Jsoup.connect("https://www.mangoplate.com/" + foods.get(j).attr("href")).timeout(30000)
                  .get();

            Elements infos = doc2.select("tbody > tr > td");

            /** 음식점 주소 **/
            f.setF_address(doc2.select("ul div.Restaurant__InfoItemLabel--RoadAddressText").get(0).text());
            
            /** 전화번호 **/
            String f_Tel = infos.get(1).text();
            String tel = doc2.select("tbody > tr > th").get(1).text();
            	
            if(tel.equals("전화번호")) {
            	f.setF_tel(f_Tel);
            }else {
            	f.setF_tel("-");
            }
            
            /** 종류 **/
            f.setF_kind(doc2.select("tbody > tr > td span").get(2).text());

            /** 영업시간 **/
            try {
            f.setF_time(infos.get(5).text());
            }catch (Exception ex) {
            	f.setF_time("-");
            }
            	
            /** 메뉴 **/
            try {
            	f.setF_menu(doc2.select("tbody > tr > td > ul").get(0).text());
            } catch (Exception ex) {
            	f.setF_menu("-");
            }

           
            dao.foodInsert(f);
            
            System.out.println(f.toString());
         }
    	 }
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }
}
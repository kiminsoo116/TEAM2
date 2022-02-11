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
    	  String[] deongList = { "등촌동", "가산동", "성내동", "자양동", "방화동", "상계동", "도곡동", "독산동", "논현동", "봉천동", "상계동", "번동", "신도림동", "신림동", "소공동","영등포동", "원효로동", "신천동", "진관동", "묵동", "전농동", "서교동", "동교동"};
    	  for (String d:deongList) {
    	  for (int i=1;i<=10;i++) {
         FoodDAO dao = new FoodDAO();

         Document doc = Jsoup.connect("https://www.mangoplate.com/search/"+d+"?keyword="+d+"&page="+i).timeout(30000).get();

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
            Elements infos2 = doc2.select("tr.only-desktop td");

            /** 음식점 주소 **/
            f.setF_address(doc2.select("ul div.Restaurant__InfoItemLabel--RoadAddressText").get(0).text());
            
            /** 전화번호 **/
            try {
            	f.setF_tel(infos2.get(1).text());
            } catch (Exception ex) {
            	f.setF_tel("-");
            }
            
            /** 종류 **/
            f.setF_kind(doc2.select("tbody > tr > td span").get(2).text());

            /** 영업시간 **/
            try {
            	String ftime = infos.get(5).text();
            	if(ftime.indexOf("-")>0){
            		f.setF_time(infos.get(5).text());
            	}else {
            		f.setF_time("-");
            	}
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
    	  }
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }
}
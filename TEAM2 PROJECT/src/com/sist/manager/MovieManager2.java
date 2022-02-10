package com.sist.manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.*;
import com.sist.vo.MovieVO;

public class MovieManager2 {

	//상영예정영화 수집
   public static void main(String[] args) {
      try {
         MovieDAO dao = new MovieDAO();

         Document doc = Jsoup.connect("https://movie.naver.com/movie/running/premovie.naver").timeout(30000).get();

         Elements movies = doc.select("dt.tit a");
         Elements posters = doc.select("div.thumb img");

         for (int i = 0; i < movies.size(); i++) {
            MovieVO m = new MovieVO();

            /** 타이틀 **/
            m.setM_title(movies.get(i).text());

            Document doc2 = Jsoup.connect("https://movie.naver.com" + movies.get(i).attr("href")).timeout(30000)
                  .get();

            Elements infos = doc2.select("dl.info_spec > dd > p > span");

            /** 장르 **/
            m.setM_genre(infos.get(0).text());

            /** 포스터 **/
            m.setM_poster(posters.get(i).attr("src"));

            /** 영화시간 **/
            if(infos.get(2).text().length()>=5) {
            	m.setM_time("-");
            }
            else {
            	m.setM_time(infos.get(2).text());
            }

            /** 줄거리 **/
            String m_content = doc2.select("div.story_area").text().replace("줄거리 ","").replace("제작노트 보기","");
            
            if (m_content.length() == 0)
               m.setM_content("-");
            else {
               m.setM_content(m_content);
            }

            /** 영화 감독 **/
            String m_director = doc2.select("div.info_spec2 > dl.step1 > dd").text();
            if (m_director.length() == 0)
               m.setM_director("-");
            else {
               m.setM_director(m_director);
            }

            /** 영화 출연진 **/
            String m_cast = doc2.select("div.info_spec2 > dl.step2 > dd").text();
            if (m_cast.length() == 0)
               m.setM_cast("-");
            else {
               m.setM_cast(m_cast);
            }

            /** 영화 개봉일 **/
            try {
            	m.setM_rdate(infos.get(3).text());
            }
            catch(Exception ex){
            m.setM_rdate(infos.get(2).text());
            }

            /** 영화 누적 관객 수 **/
            String m_cnt = doc2.select("div.step9_cont p.count").text();
            if (m_cnt.length() == 0)
               m.setM_cnt("-");
            else {
               m.setM_cnt(m_cnt.substring(0, m_cnt.indexOf("(")));
            }

            /** 영화 예고편 **/
            Elements preview = doc2.select("ul.video_thumb a");
            if (preview.size() != 0) {
               String previewlink = "https://movie.naver.com" + preview.get(0).attr("href");

               Document doc3 = Jsoup.connect(previewlink).timeout(30000).get();

               m.setM_preview("https://movie.naver.com" + doc3.select("iframe._videoPlayer").attr("src"));
            } else {
               m.setM_preview("");
            }

            /** 영화 갤러리 **/

            Elements photos = doc2.select("div.photo a");
            String photos2 = "";
            if (photos.size() == 3) { // 더보기가 있으면

               photos2 = photos.get(2).attr("href");
               photos2 = "https://movie.naver.com/movie/bi/mi" + photos2.substring(1);

               Document doc3 = Jsoup.connect(photos2).timeout(30000).get();
               Elements photos3 = doc3.select("div.rolling_list img");
               String photos4 = "";

               for (int j = 0; j < photos3.size(); j++) {
                  if (j > 5)
                     break;
                  String temp = photos3.get(j).attr("src");
                  if (temp.equals("https://ssl.pstatic.net/static/movie/2012/06/adult_img74x74.png")) // 성인인증 사진
                                                                                 // 제거
                     continue;
                  temp = temp.substring(0, temp.lastIndexOf("?type=")); // 사이즈 줄이는 태그 제거
                  photos4 += temp + "|"; // 구분자 넣기
               }
               photos4 = photos4.substring(0, photos4.lastIndexOf("|")); // 마지막에 들어간 구분자 제거
               m.setM_photo(photos4);

            } else { // 더보기가 없으면
               photos2 = doc2.select("div.viewer_img img").attr("src");
               if (photos2.length() == 0) {
                  m.setM_photo("");
               } else {
                  m.setM_photo(photos2);
               }
            }
            dao.movieInsert(m);
            
            System.out.println(m.toString());
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<c:if test="${sessionScope.u_id==null }">
		<nav class="navi">
			<button type="button">
				<a href="../jsp/main.do"><img src="../image/logo.png"></a>
			</button>
			<form class="search-container" method="post"
				action="../movie/location.do">
				<input type="text" id="search-bar" name="ss"
					placeholder="  검색할 내용을 입력해 주세요."> <img class="search-icon"
					src="../image/돋보기.png">
			</form>
			
			<script type="text/javascript">
				$(function() {
					var List = [ "만년이 지나도 변하지 않는 게 있어", "어나더 라운드", "해탄적일천",
							"가슴이 떨리는 건 너 때문", "듄", "드라이브 마이 카", "나일 강의 죽음",
							"나의 촛불", "해적: 도깨비 깃발", "킹메이커", "355",
							"극장판 안녕 자두야: 제주도의 비밀", "스파이더맨: 노 웨이 홈", "씽2게더",
							"미싱타는 여자들", "굿 보스", "레전더리 콘서트: 레너드 번스타인",
							"파이어 셧 업 인 마이 본즈", "레전더리 콘서트: 헤르베르트 폰 카라얀",
							"인어가 잠든 집", "온 세상이 하얗다", "하우스 오브 구찌", "효자",
							"원 세컨드", "늦봄2020", "웨스트 사이드 스토리", "더 마더", "특송",
							"프랑스", "프렌치 디스패치", "경관의 피", "캐롤", "애니멀 체인지",
							"해리 포터와 불사조 기사단", "프리! 더 파이널 스트로크 전편",
							"킹스맨: 퍼스트 에이전트", "타오르는 여인의 초상", "덩케르크",
							"창극 변강쇠 점 찍고 옹녀", "도쿄 리벤저스", "밀라노 두오모 콘서트", "안테벨룸",
							"피그", "인민을 위해 복무하라", "시라노", "극장판 천재 추리 탐정 셜록홈즈",
							"단지 세상의 끝", "러브레터", "마미", "걸 위드 더 카메라", "귀향",
							"나쁜 교육", "당신얼굴 앞에서", "미스터 앤 미세스 아델만",
							"바이올렛 에버가든 오케스트라 콘서트 2021", "브로큰 임브레이스", "청춘적니",
							"언차티드", "리코리쉬 피자", "리프레쉬", "극장판 주술회전 0",
							"대한민국 대통령", "극장판 바다 탐험대 옥토넛 : 해저동굴 대탈출",
							"역으로 가는 길을 알려줘", "시크릿 카운터", "스크림", "아웃브레이크 호텔",
							"전투왕", "코만도", "유어 러브 송", "컴온 컴온", "감동의 나날",
							"수퍼 소닉2", "신비한 동물들과 덤블도어의 비밀", "앰뷸런스",
							"완벽한 축사를 준비하는 방법", "뉴타운 생존자 수색작전", "나이트메어 앨리",
							"보드랍게", "세라비: 다섯 번의 기적", "밴드스탠드", "광대: 소리꾼",
							"매미소리", "서바이벌리스트", "우리가 사랑이라고 믿는 것", "축복의 집",
							"행성충돌: 지구 최후의 날", "주얼스", "서유기: 손오공 홍해아 대전",
							"더 배트맨", "나이트 레이더스", "소피의 세계", "이상한 나라의 수학자", "B컷",
							"그 남자는 타이타닉을 보고 싶지 않았다",
							"나의 히어로 아카데미아 더 무비: 월드 히어로즈 미션", "도어맨", "레벤느망",
							"로스트 시티", "루이스 웨인: 사랑을 그린 고양이 화가", "리디밍 러브",
							"모비우스", "문폴", "사랑 후의 두 여자", "스펜서", "아망떼", "아이돌레시피",
							"에펠", "아빠의 4중주", "파라오의 딸", "버즈 라이트이어", "블랙폰",
							"빅샤크4 : 바다공룡 대모험", "쥬라기 월드: 도미니언", "놉", "미니언즈2",
							"아가페 : 분노와 사랑", "탄생" ];
					$("#search-bar").autocomplete({
						source : List,
						select : function(event, ui) {
							console.log(ui, item);
						},
						focus : function(event, ui) {
							return false;
						},
						minLength : 1,
						autoFocus : true,
						classes : {
							"ui-autocomplete" : "highlight"
						},
						delay : 100,
						disable : false,
						position : {
							my : "right top",
							at : "right bottom"
						},
						close : function(event) {
							console.log(event);
						}
					});
				});
			</script>

			<button class="signin" style="color: white">
				<a href="../join/joinwindow.jsp">회원가입</a>
			</button>
			<button class="login" style="color: white">
				<a href="../log/loginwindow.jsp">로그인</a>
			</button>

		</nav>
	</c:if>

	<c:if test="${sessionScope.u_id!=null }">

		<nav class="navi">
			<button type="button">
				<a href="../jsp/main.do"><img src="../image/logo.png"></a>
			</button>
			<form class="search-container" method="post"
				action="../movie/location.do">
				<input type="text" id="search-bar" name="ss"
					placeholder="  검색할 내용을 입력해 주세요."> <img class="search-icon"
					src="../image/돋보기.png">
			</form>
			<script type="text/javascript">
				$(function() {
					var List = [ "만년이 지나도 변하지 않는 게 있어", "어나더 라운드", "해탄적일천",
							"가슴이 떨리는 건 너 때문", "듄", "드라이브 마이 카", "나일 강의 죽음",
							"나의 촛불", "해적: 도깨비 깃발", "킹메이커", "355",
							"극장판 안녕 자두야: 제주도의 비밀", "스파이더맨: 노 웨이 홈", "씽2게더",
							"미싱타는 여자들", "굿 보스", "레전더리 콘서트: 레너드 번스타인",
							"파이어 셧 업 인 마이 본즈", "레전더리 콘서트: 헤르베르트 폰 카라얀",
							"인어가 잠든 집", "온 세상이 하얗다", "하우스 오브 구찌", "효자",
							"원 세컨드", "늦봄2020", "웨스트 사이드 스토리", "더 마더", "특송",
							"프랑스", "프렌치 디스패치", "경관의 피", "캐롤", "애니멀 체인지",
							"해리 포터와 불사조 기사단", "프리! 더 파이널 스트로크 전편",
							"킹스맨: 퍼스트 에이전트", "타오르는 여인의 초상", "덩케르크",
							"창극 변강쇠 점 찍고 옹녀", "도쿄 리벤저스", "밀라노 두오모 콘서트", "안테벨룸",
							"피그", "인민을 위해 복무하라", "시라노", "극장판 천재 추리 탐정 셜록홈즈",
							"단지 세상의 끝", "러브레터", "마미", "걸 위드 더 카메라", "귀향",
							"나쁜 교육", "당신얼굴 앞에서", "미스터 앤 미세스 아델만",
							"바이올렛 에버가든 오케스트라 콘서트 2021", "브로큰 임브레이스", "청춘적니",
							"언차티드", "리코리쉬 피자", "리프레쉬", "극장판 주술회전 0",
							"대한민국 대통령", "극장판 바다 탐험대 옥토넛 : 해저동굴 대탈출",
							"역으로 가는 길을 알려줘", "시크릿 카운터", "스크림", "아웃브레이크 호텔",
							"전투왕", "코만도", "유어 러브 송", "컴온 컴온", "감동의 나날",
							"수퍼 소닉2", "신비한 동물들과 덤블도어의 비밀", "앰뷸런스",
							"완벽한 축사를 준비하는 방법", "뉴타운 생존자 수색작전", "나이트메어 앨리",
							"보드랍게", "세라비: 다섯 번의 기적", "밴드스탠드", "광대: 소리꾼",
							"매미소리", "서바이벌리스트", "우리가 사랑이라고 믿는 것", "축복의 집",
							"행성충돌: 지구 최후의 날", "주얼스", "서유기: 손오공 홍해아 대전",
							"더 배트맨", "나이트 레이더스", "소피의 세계", "이상한 나라의 수학자", "B컷",
							"그 남자는 타이타닉을 보고 싶지 않았다",
							"나의 히어로 아카데미아 더 무비: 월드 히어로즈 미션", "도어맨", "레벤느망",
							"로스트 시티", "루이스 웨인: 사랑을 그린 고양이 화가", "리디밍 러브",
							"모비우스", "문폴", "사랑 후의 두 여자", "스펜서", "아망떼", "아이돌레시피",
							"에펠", "아빠의 4중주", "파라오의 딸", "버즈 라이트이어", "블랙폰",
							"빅샤크4 : 바다공룡 대모험", "쥬라기 월드: 도미니언", "놉", "미니언즈2",
							"아가페 : 분노와 사랑", "탄생" ];
					$("#search-bar").autocomplete({
						source : List,
						select : function(event, ui) {
							console.log(ui, item);
						},
						focus : function(event, ui) {
							return false;
						},
						minLength : 1,
						autoFocus : true,
						classes : {
							"ui-autocomplete" : "highlight"
						},
						delay : 100,
						disable : false,
						position : {
							my : "right top",
							at : "right bottom"
						},
						close : function(event) {
							console.log(event);
						}
					});
				});
			</script>


			<button class="signin" style="color: white">
				<a href="../log/logout.do">로그아웃</a>
			</button>

			<button class="loginin" style="color: white">
				<a href="../mypage/reservation.do?p=1">마이페이지</a>
			</button>
		</nav>

	</c:if>
</body>
</html>
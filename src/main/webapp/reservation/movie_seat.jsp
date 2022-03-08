<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mr_screen {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
	text-decoration: underline;
	text-align: center;
	margin-top: 20px;
}

.seat-wrapper {
	text-align: center;
}

.mr_seatBtn {
	width: 40px;
	height: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	background: #FFFFFF;
	border: 1px solid #573EF2;
	border-radius: 10px;
	color: #573EF2;
	text-align: center;
	background: #FFFFFF;
}

.mr_board4 {
	width: 450px;
	height: 1px;
}
</style>
</head>
<body>
	<div>
		<!-- 인원수 -->
		<p style="display: inline;">인원입력:</p>
		<c:forEach var="mr_inwon" begin="1" end="3">
			<span class="mr_inwonBtn btn btn-sm btn-primary">${mr_inwon }</span>
		</c:forEach>
		<div class="mr_board4"></div>
		<p style="display: inline;">총 선택 좌석수 :</p>
		<input type="text" id="mr_inwonBox" value="" size="5" readonly>
		<div class="mr_board3"></div>
		<!-- 좌석 -->
		<div class="mr_screen">SCREEN</div>
		<div class="seat-wrapper">
			<input type="checkbox" id="seatBtn1" class="mr_seatBtn" value="1">
			<input type="checkbox" id="seatBtn2" class="mr_seatBtn" value="2">
			<input type="checkbox" id="seatBtn3" class="mr_seatBtn" value="3">
			<input type="checkbox" id="seatBtn4" class="mr_seatBtn" value="4">
			<input type="checkbox" id="seatBtn5" class="mr_seatBtn" value="5">
			<input type="checkbox" id="seatBtn6" class="mr_seatBtn" value="6">
			<input type="checkbox" id="seatBtn7" class="mr_seatBtn" value="7">
			<input type="checkbox" id="seatBtn8" class="mr_seatBtn" value="8">
			<input type="checkbox" id="seatBtn9" class="mr_seatBtn" value="9">
			<input type="checkbox" id="seatBtn10" class="mr_seatBtn" value="10">
			<input type="checkbox" id="seatBtn11" class="mr_seatBtn" value="11">
			<input type="checkbox" id="seatBtn12" class="mr_seatBtn" value="12">
			<input type="checkbox" id="seatBtn13" class="mr_seatBtn" value="13">
			<input type="checkbox" id="seatBtn14" class="mr_seatBtn" value="14">
			<input type="checkbox" id="seatBtn15" class="mr_seatBtn" value="15">
			<input type="checkbox" id="seatBtn16" class="mr_seatBtn" value="16">
			<input type="checkbox" id="seatBtn17" class="mr_seatBtn" value="17">
			<input type="checkbox" id="seatBtn18" class="mr_seatBtn" value="18">
			<input type="checkbox" id="seatBtn19" class="mr_seatBtn" value="19">
			<input type="checkbox" id="seatBtn20" class="mr_seatBtn" value="20">
			<input type="checkbox" id="seatBtn21" class="mr_seatBtn" value="21">
			<input type="checkbox" id="seatBtn22" class="mr_seatBtn" value="22">
			<input type="checkbox" id="seatBtn23" class="mr_seatBtn" value="23">
			<input type="checkbox" id="seatBtn24" class="mr_seatBtn" value="24">
			<input type="checkbox" id="seatBtn25" class="mr_seatBtn" value="25">
		</div>
		<script type="text/javascript">
			let seatcount = 0;
			let result=[];

			$(function() {
				$('.mr_inwonBtn').click(function() {
					let inwons = $(this).text();
					$('#mr_inwonBox').val(inwons);
				})
				$('.seat-wrapper input').click(
						function() {
							if ($('#mr_inwonBox').val() == "") {
								alert("인원수를 입력해주세요");
								$('#mr_inwonBox').focus();
								$(this).attr("checked", false);
								return;
							} else if ($('#mr_inwonBox').val() == "1") {
								seatcount++;
								if (seatcount <= 1) {
									if ($("input[type='checkbox']").is(":checked") == true) {
										for(let i=1; i<=25;i++) {
											if($(this).val()==i) {
												result=i;
											}else {
												$('#mr_seat').val(result);
												$('#mr_seat').attr("type", "text");
											}
										}
									}
								} else {
									alert("지정 인원수를 초과하셨습니다.");
									$(this).attr("checked", false);

									return;
								}
							} else if ($('#mr_inwonBox').val() == "2") {
								seatcount++;
								if (seatcount <= 2) {
									if ($("input[type='checkbox']").is(":checked") == true) {
										for(let i=1; i<=25;i++) {
											if($(this).val()==i) {
												result+=i+",";
											} else {
												$('#mr_seat').val(result);
												$('#mr_seat').attr("type", "text");
											}
										}
									}
								} else {
									alert("지정 인원수를 초과하셨습니다.");
									$(this).attr("checked", false);

									return;
								}
							} else if ($('#mr_inwonBox').val() == "3") {
								seatcount++;
								if (seatcount <= 3) {
									if ($("input[type='checkbox']").is(":checked") == true) {
										for(let i=1; i<=25;i++) {
											if($(this).val()==i) {
												result+=i+",";
											} else {
												$('#mr_seat').val(result);
												$('#mr_seat').attr("type", "text");
											}
										}
									}
								} else {
									alert("지정 인원수를 초과하셨습니다.");
									$(this).attr("checked", false);

									return;
								}
							}
						})
			})
		</script>
	</div>
</body>
</html>
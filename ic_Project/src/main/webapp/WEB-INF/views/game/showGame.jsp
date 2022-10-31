<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkPoint() {
	
	var bid_point = document.getElementById("bid_point");
	var bid_pointvalue= bid_point.value;
	
	var xmlhttp = new XMLHttpRequest();

	//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			if(data.UserInfo.member_point < bid_pointvalue){
				alert("포인트가 부족합니다.\n현재 남은 포인트 : "+data.UserInfo.member_point);
				return;
			}
	
		}
	};
		
		//get 방식으로 파라미터 보내는법...
		xmlhttp.open("get" , "./checkPoint.do"); 
		xmlhttp.send();
	}

</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
hr.new1 {
  border-top: 3px solid blue;
}
</style>
<style>.title_size{font-size : xx-large; font-family: 'Jua', sans-serif; font-weight : bold;}</style>
<!-- 네비게이션 바 -->
						<jsp:include page="../common/global_nav.jsp"></jsp:include>
</head>
<body><div style="width: 1200px; margin: 0 auto">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row mt-5">
						<div class="col fs-1 fw-bold text-left">
							이벤트
							</div>
					</div>
					<div style="float: right;">
						<c:choose>
							<c:when test="${!empty sessionUser }">
         사용자 <span class="id_size" id="user"
									OnClick="location.href='../member/mypage.do'"
									style="cursor: pointer;">${sessionUser.member_name }</span>
							</c:when>
							<c:otherwise>
         로그인 회원만 요청 가능합니다. <a href="../member/loginPage.do">로그인페이지</a>
							</c:otherwise>
						</c:choose>
					</div>
					<p style="clear: both;">&nbsp;</p>
					 <p class="title_size">${gamedata.gameVo.game_no }회차 이벤트</p>
					<p style="clear: both;"></p>
					<hr class="new1">
<p>상금 : ${gamedata.gameVo.game_win_point }</p>
<p>시작 시간 : <fmt:formatDate value="${gamedata.gameVo.game_start_time }" pattern="HH시 mm분 ss초"/></p>
<p>종료 시간 : <fmt:formatDate value="${gamedata.gameVo.game_end_time }" pattern="HH시 mm분 ss초"/></p>
<hr class="new1">
<form action="bidDo.do" method="post">
	<input type = "number" name="bid_point" id="bid_point" onblur="checkPoint()">
	<input type = "hidden" name="member_no" value="${sessionUser.member_no}">
	<input type = "hidden" name="game_no" value="${gamedata.gameVo.game_no}" >
	<button type="submit">sad</button>
</form>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		</div>
		<div class="col"></div>
		</div>
		</div>
		</div>
</body>
</html>
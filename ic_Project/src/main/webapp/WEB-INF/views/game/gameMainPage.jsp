<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<style>
.id_size {
	font-size: large;
	color: blue;
}
</style>
<style>
#user:hover {
	color: black;
	font-weight: bold
}
</style>

<!-- 네비게이션 바 -->
						<jsp:include page="../common/global_nav.jsp"></jsp:include>
</head>
<body>
<div style="width: 1200px; margin: 0 auto">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row mt-5">
						<div class="col fs-1 fw-bold text-left">이벤트</div>
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
<table class="table table-hover">
<c:forEach items="${gamelist }" var="data">
						<tr onClick = "location.href='./showGame.do?game_no=${data.gameVo.game_no }'">				
						<td>${data.gameVo.game_no }&nbsp;회차</td>
						<td>우승상금&nbsp;${data.gameVo.game_win_point }</td>		
						<td>종료시간 : <fmt:formatDate value="${data.gameVo.game_end_time }" pattern="HH시 mm분 ss초"/> </td> 			
						</tr>
</c:forEach>
</table>
</div>
<div class="col"></div>
</div>
</div>
</div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
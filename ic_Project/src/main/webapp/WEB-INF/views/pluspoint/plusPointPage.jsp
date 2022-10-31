<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.font {
	font-family: fantasy, serif;
}
</style>
<style>
.font_size {
	font-size: x-large;
	font-weihgt: bold;
}
</style>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row mt-5">
						<div class="col fs-1 fw-bold text-left">포인트 충전</div>
					</div>
					<div style="float: right;">
						<c:choose>
							<c:when test="${!empty sessionUser }">
								<span class="font">${sessionUser.member_name }</span> 님 환영합니다
      </c:when>
							<c:otherwise>
         로그인 회원만 요청 가능합니다. <a href="../member/loginPage.do">로그인페이지</a>
							</c:otherwise>
						</c:choose>
					</div>

					<p style="clear: both;">&nbsp;</p>
					<div class="row mt-4">
						<div class="col">
							<div class="col-md-3" style="float: none; margin: 0 auto;">
								<div
									style="width: 800px; height: 250px; float: left; margin: 8px;">
									<form action="./plusPoint.do" method="post">
										<input type="radio" name="plus_point" value="5000"><label
											for="5000">5000<i class="fas fa-coins"></i></label> <input
											type="radio" name="plus_point" value="10000"><label
											for="10000">10000<i class="fas fa-coins"></i></label> <input
											type="radio" name="plus_point" value="15000"><label
											for="15000">15000<i class="fas fa-coins"></i></label> <input
											type="radio" name="plus_point" value="20000"><label
											for="20000">20000<i class="fas fa-coins"></i></label>
										<p>
											<button type="submit" name="plus_point">충전</button>
										</p>
									</form>
								</div>
							</div>
						</div>
					</div>
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
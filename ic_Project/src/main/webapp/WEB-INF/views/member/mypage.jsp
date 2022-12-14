<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.id_size {
	font-size: large;
	color: blue;
}
</style>
<style>
.title_size {
	font-size: xx-large;
	font-weight: bold;
}
</style>
<style>
.point_size {
	font-family: 'Poor Story', cursive;
	font-size: large;
	color: #ff00c8;
}
</style>
<style type="text/css">
a:link {
	text-decoration: none;
	color: black
}

a:visited {
	text-decoration: none;
	color: black
}

a:hover {
	color: blue
}
</style>
<style>
#yes {
	margin-right: 0px;
	border-radius: 20px;
	color: skyblue;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	transition-duration: 1s;
}

#yes:hover {
	background-color: #a3f1ff;
	color: black
}

#no {
	margin-left: 300px;
	border-radius: 20px;
	color: skyblue;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	transition-duration: 1s;
}

#no:hover {
	background-color: #ffa1a1;
	color: black
}
</style>
<style>
.title_size {
	font-size: xx-large;
	font-weight: bold;
}
</style>
<style>
img {
	border-radius: 50%;
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
						<div class="col fs-1 fw-bold text-left">?????? ?????????</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	<div style="width: 1200px; margin: 0 auto">
		<div
			style="width: 1190px; height: 300px; border: 1px solid red; margin: 10px 5px 15px 5px">
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="col-10">
						<div class="row mt-5">
							<p class="title_size">?????????</p>
						</div>
						<div style="float: left; width: 120px; height: 160px;">
							<img src="../resources/img/handsome.jpg" width="120" height="120">

							<div style="float: left; width: 120px">
								<input type=button value="????????? ??????"
									style="width: 120px; margin: 5px 0px 0px 0px">
							</div>
						</div>
						<div style="float: right">
							<span class="id_size">${map.member_name }&nbsp;</span><span>
								?????? ????????? : <span class="point_size">${map.member_point }</span>&nbsp;<i
								class="fas fa-coins"></i>
							</span>
							<p></p>

							????????? :
							<fmt:formatDate value="${map.member_joindate }"
								pattern="yyyy-MM-dd" />
							<p></p>

							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#pluspoint">?????????
								??????</button>


							<!-- The Modal -->
							<div class="modal" id="pluspoint">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">????????? ??????</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal"></button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">
											<form action="../pluspoint/plusPoint.do" method="post">
												<input type="radio" name="plus_point" value="5000" id="5"
													checked="checked"><label for="5">5000<i
													class="fas fa-coins"></i></label> <input type="radio"
													name="plus_point" value="10000" id="10"><label
													for="10">10000<i class="fas fa-coins"></i></label> <input
													type="radio" name="plus_point" value="15000" id="15"><label
													for="15">15000<i class="fas fa-coins"></i></label> <input
													type="radio" name="plus_point" value="20000" id="20"><label
													for="20">20000<i class="fas fa-coins"></i></label> <br>
												<p></p>
												<span>
													<button type="button" id="no" data-bs-dismiss="modal">????????????</button>
													<button type="submit" id="yes" name="plus_point">????????????</button>
												</span>
											</form>
										</div>

									</div>
								</div>
							</div>
							<a href="../requestboard/requestMainPage.do">???????????????</a>
						</div>
					</div>
					<div class="col"></div>

				</div>
			</div>
		</div>
		<div
			style="width: 1190px; height: 600px; float: left; border: 1px solid red; margin: 10px 5px 15px 5px">
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="col-10">
						<div class="row mt-5">
							<p class="title_size">????????????</p>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		<div
			style="width: 590px; height: 500px; float: left; border: 1px solid red; margin: 10px 5px 15px 5px">
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="col-10">
						<div class="row mt-5">
							<p class="title_size">????????????</p>
								<table class="table text-center">
								<thead>
									<tr>
										<th scope="col">??????</th>
										<th scope="col">?????? ??????</th>
										<th scope="col">?????? ??????</th>
										<th scope="col">?????? ??????</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${cartList }" var="data" varStatus="i">
									<tr>
										<th scope="row" style="vertical-align: middle">${fn:length(cartList) - i.index}</th>
										<td>${data.course_name }</td>
										<td>${data.lecture_name }</td>
										<td>${data.course_price }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		<div
			style="width: 590px; height: 500px; float: right; border: 1px solid red; margin: 10px 5px 15px 5px">
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="col-10">
						<div class="row mt-5">
							<p class="title_size">????????? ????????????</p>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
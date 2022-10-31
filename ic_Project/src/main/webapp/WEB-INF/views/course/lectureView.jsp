<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<style>
 hr.hrline{
 	border-top: 3px solid blue;
 }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%" class="row">				<!-- 네비게이션 바 -->
		<div class="col">
			<header>
				<jsp:include page="../common/global_nav.jsp"></jsp:include>
			</header>
		</div>
	</div>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col-10">
					<h1 class="form-control-plaintext text-left" style="float:left;"><i class="bi bi-play-btn"></i> ${lectureVo.course_name }</h1>
				</div>
				<div class="col"></div>
			</div>
			
			<hr class="hrline">
			
			<div class="row mt-3 align-items-center">
				<div class="col"></div>
				<div class="col-10">
					<video src="/upload/${lectureVo.course_link }" controls width="1000" height="500" oncontextmenu="false"></video>
				</div>
				<div class="col"></div>
			</div>
			
			<hr class="hrline">
			
			<div class="row mt-3 mb-3">
				<div class="col-12">
					<button class="btn btn-primary float-end" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-list-ul"></i> 재생 목록 펼치기</button>
					<a href="./reportContentProcess.do?course_no=${lectureVo.course_no}"><button class="btn btn-danger float-end" type="button"><i class="bi bi-exclamation-circle-fill"></i> 이 강의 신고하기</button></a>
					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header">
					    <h5 id="offcanvasRightLabel">나의 재생 목록</h5>
					    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  </div>
					  <div class="offcanvas-body">
					    	<p>여기에 이 강의의 재생목록을 띄울 예정.</p>
					    	<p> (나의 강의 목록?)</p>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>
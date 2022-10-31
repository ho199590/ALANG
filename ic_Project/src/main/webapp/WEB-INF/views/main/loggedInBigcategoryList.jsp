<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<style type="text/css">
#init{
	dispaly: block;
	content: '';
	clear: both;
}	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>고품격 지식 공유 포털 - 알랑에 어서오세요.</title>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">				<!-- 네비게이션 바 -->
				<div class="col">
					<header>
						<jsp:include page="../common/global_nav.jsp"></jsp:include>
					</header>
				</div>
			</div>	
			
			<div class="row mt-5">				<!-- 중간 층 -->
				<div class="col">				<!-- 좌측 메뉴 -->
					<div class="accordion" id="accordionExample">
					  <div class="accordion-item">
					    <c:forEach items="${getBigCategory}" var="biglist">
					    <h2 class="accordion-header" id="flush-heading${biglist.big_category_no}">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${biglist.big_category_no}" aria-expanded="false" aria-controls="flush-collapse${list.big_category_no}">
						    ${biglist.big_category_name}
					      </button>
					    </h2>
					        <div id="flush-collapse${biglist.big_category_no}" class="accordion-collapse collapse" aria-labelledby="flush-heading${biglist.big_category_no}" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					    	 <div class="list-group list-group-flush">
							  <a href="./loggedInBigcategoryList.do?bigcategory_no=${biglist.big_category_no}" class="list-group-item list-group-item-action">모두보기</a>
							  	<c:forEach items="${getSmallCategory}" var="smalllist" varStatus="i">
							  	 <c:if test="${biglist.big_category_no eq smalllist.big_category_no}">
							  	 	<a href="./loggedIncategoryList.do?smallcategory_no=${smalllist.small_category_no}" class="list-group-item list-group-item-action">${smalllist.small_Category_Name}</a>
							  	  </c:if>
								</c:forEach>
							 </div>		      
					      </div>
					    </div>
				    </c:forEach>
				  </div>
					</div>
				</div>		
				<div class="col-10">			<!-- article -->
					<div class="row mb-5">
						<div class="col">
							<div class="col">
							<nav aria-label="breadcrumb">
							  <ol class="breadcrumb">
							    <li class="breadcrumb-item active" aria-current="page"><a href="./loggedIn.do">전체보기</a></li>
							    <li class="breadcrumb-item active" aria-current="page"><a href="./loggedInBigcategoryList.do?bigcategory_no=${getoneBigCategory.big_category_no}"> ${getoneBigCategory.big_category_name}</a></li>
							  </ol>
							</nav>
						</div>
						</div>					
						<div class="col">	<!-- 관심분야 태그 -->
							<span class="float-end"><a href="../course/courseOpenPage.do"><button class="btn btn-primary mr-2 mb-3">강의하기</button></a></span>
						</div>
						
						<div class="row">
							<c:forEach items="${getCourseListBybBigCate}" var="list" varStatus="i">
								<div class="col" style="float: left; max-width: 33%;">
									<img src="../resources/img/sfp.png" width="200" height="200" class="thumbnail mr-2">
									<p><a href="../course/direction.do?course_no=${list.courseVo.course_no }">${list.courseVo.course_name}</a></p>
									<p>업로더 : ${list.memberVo.member_name }</p>
								</div>
								
								<c:if test="${i.count%3==0 }">
									<div id="init"></div>
								</c:if>
							</c:forEach>
						</div>
						
					</div>
				</div>
			</div>	
					
				<div class="col">			<!-- aside -->
					
				</div>		
			</div>
		</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
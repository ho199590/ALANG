<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재 코스 번호 : ${purchase.course.courseVo.course_no } <br><br>
	
	구매 강의 제목 : ${purchase.lecture.course_name } <br>
	해당 강의 가격 : ${purchase.lecture.course_price }<br>
	회원님의 잔여 포인트 : ${purchase.memberVo.member_point }<br><br>
	
	<c:choose>
		<c:when test="${purchase.lecture.course_price > purchase.memberVo.member_point}">
			포인트가 부족하여 구매할 수 없습니다. 충전하시겠습니까? <br>
			<button type="button">충전하러 가기</button>
		</c:when>
		<c:otherwise>
			결제하시겠습니까? <br>
			<a href="./purchaseSuccess.do?course_no=${purchase.course.courseVo.course_no }&lecture_no=${purchase.lecture.lecture_no}&member_no=${sessionUser.member_no}"><button type="button">구매</button></a>
		</c:otherwise>
	</c:choose>	
</body>
</html>
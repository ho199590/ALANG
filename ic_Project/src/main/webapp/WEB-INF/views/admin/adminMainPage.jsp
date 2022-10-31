<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h2>관리자 페이지 메인</h2>
<table border="1">
	<tr>
		<td>신고 번호</td>
		<td>작성자</td>
		<td>코스 번호</td>
		<td>신고일</td>
	</tr>
	<c:forEach items="${reportList}" var="data">
	<tr>
         <td>${data.reportVo.report_no}</td>
         <td>${data.memberVo.member_name}</td>
         <td>${data.reportVo.course_no}</td>
         <td><fmt:formatDate value="${data.reportVo.report_date }" pattern="yyyy-MM-dd"/></td>
         <td><a href="./adminReportDetailPage.do?reportno=${data.reportVo.report_no}">자세히 보기</a><td>   
      </tr>
	</c:forEach>
	
</table>
<a href="./adminGameControlPage.do">이벤트 관리페이지</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
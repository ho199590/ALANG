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
<h3>신고한글 상세 보기</h3>

신고번호 : ${reportDetail.reportVo.report_no} <br>
작성자 : ${reportDetail.memberVo.member_name} <br>
코스 번호 : ${reportDetail.reportVo.course_no}<br>
코스 상세보기 : <br>
코스 개설자 : ${reportDetail.opencoursememberVo.member_name}
<div class="btn-group">
  <button type="button" class="btn btn-secondary">관리하기</button>
  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
    <span class="visually-hidden">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="./restrainDay.do?reportedMemberNo=${reportDetail.opencoursememberVo.member_no}">24시간 정지</a></li>
    <li><a class="dropdown-item" href="./restrainWeek.do">7일 정지</a></li>
    <li><a class="dropdown-item" href="./restrainMonth.do">30일 정지</a></li>
    <li><a class="dropdown-item" href="./restrainPermanent.do">영구 정지</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="#">권한 복구</a></li>
  </ul>
</div>
<br>
코스 이름  ; ${reportDetail.courseVo.course_name}<br>
코스 개설일 : <fmt:formatDate value="${reportDetail.courseVo.course_date}" pattern="yyyy-MM-dd"/><br>
신고 사유 : ${reportDetail.reportVo.report_reason}<br>
신고일자 :<fmt:formatDate value="${reportDetail.reportVo.report_date}" pattern="yyyy-MM-dd"/><br> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
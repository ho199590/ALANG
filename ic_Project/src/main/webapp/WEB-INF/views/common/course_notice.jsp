<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 공지테이블 -->
	<div class="row mt-2">
		<div class="col">
			<table class="table table-dark table-hover">
				<c:forEach items="${noticeList }" var="data">
				<tr>
					<td>공지</td>
					<td><a href="./readNoticePage.do?notice_no=${data.noticeVo.notice_no }">${data.noticeVo.notice_title }</a></td>
					<td>${data.memberVo.member_name }</td>									
					<td><fmt:formatDate value="${data.noticeVo.notice_registdate }" pattern="yy년 MM월 dd일 hh:mm" /></td>
				</tr>	
				</c:forEach>
			</table>
		</div>
	</div>
<!-- 공지테이블 끝 -->	
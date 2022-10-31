<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${!empty sessionUser }">
		<button type="button" onclick = "location.href = './messageWritePage.do'">쪽지쓰기</button>
		</c:if>
		<button type="button" onclick="location.href ='./recvMessageList.do'">보낸메세지</button>
	<form>
		 
			<table>
			<tr>
				<td>보낸사람</td>
				<td>내용</td>
				<td>날짜</td>
			</tr>
			
			<c:forEach items="${msg }" var="msg">
			<tr>
				<td>${msg.memberVosend.member_name }</td>
				<td><a href="./messageReadPage.do?message_no=${msg.messageVo.message_no }">${msg.messageVo.message_content }</a></td>
				<td><fmt:formatDate value="${msg.messageVo.message_senddate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			
			</c:forEach>
			</table>
		
	</form>
</body>
</html>
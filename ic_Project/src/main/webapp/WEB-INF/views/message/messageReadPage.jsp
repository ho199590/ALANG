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
		
	보낸사람:${data.memberVo.member_id }<br>
	받은시간:<fmt:formatDate value="${data.messageVo.message_senddate}" pattern="yyyy-MM-dd"/><br>
	내용 : ${data.messageVo.message_content }<br>
	 
</body>
</html>
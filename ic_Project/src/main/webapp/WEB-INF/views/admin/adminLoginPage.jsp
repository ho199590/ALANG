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

<h1>관리자 로그인페이지</h1>
	<form action="./adminLoginProcess.do" method="post">
	ID:<input type="text" id ="id" name="member_id"><br>
	PW:<input type="password" id="pw" name="member_pw"><br>
	<input type="submit" value="확인">
	</form>

</body>
</html>
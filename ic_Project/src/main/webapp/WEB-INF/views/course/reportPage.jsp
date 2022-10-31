<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신고하기</h1>
	<form action="./completereportProcess.do?course_no=${data.courseVo.course_no}&member_no=${sessionUser.member_no}" method="post" enctype="multipart/form-data">
	작성자 : ${sessionUser.member_id }<br>
	내용 :  <br>
	<textarea rows="10" cols="60" name="report_reason"></textarea><br>
	
	<input type="submit" value="작성 완료">	
	</form>
</body>
</html>
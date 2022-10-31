<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="questionWriteProcess.do" method="post">
		<fieldset>
			<legend>질문하기</legend>
			<input type = "hidden" name = "course_no" value = "<%= request.getParameter("course_no") %>"><br>
			작성자 : ${sessionUser.member_id }<br>
			질문 제목 : <input type = "text" name = "question_name"><br>
			<textarea rows="10" cols="60" name = "question_content"></textarea><br>
			<input type = "submit">테스트			
		</fieldset>
	</form>
</body>
</html>
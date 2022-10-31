<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="reviewWriteProcess.do" method="post">
		<fieldset>
			<legend>리뷰 테스트</legend>
			<input type = "hidden" name = "course_no" value = "<%= request.getParameter("course_no") %>"><br>
			작성자 : ${sessionUser.member_id }<br>
			리뷰 제목 : <input type = "text" name = review_title><br>
			    
			<input type="range" class="form-range" id="평점(1~5)" name="review_rate" min="1" max="5">
			
			리뷰네용 : <Br>
			<textarea rows="10" cols="60" name = "review_content"></textarea><br>			
			<input type = "submit">테스트			
		</fieldset>
	</form>

</body>
</html>
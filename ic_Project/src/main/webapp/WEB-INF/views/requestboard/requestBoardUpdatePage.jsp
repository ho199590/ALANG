<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style>
hr.new1 {
	border-top: 3px solid blue;
}
</style>
<style>
.info_size {
	font-size: small;
	color: gray;
}
</style>
<style>
.title_size {
	font-size: xx-large;
	font-weight: bold;
}
</style>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row mt-5">
						<div class="col fs-1 fw-bold text-left"
							onclick="location.href='./requestMainPage.do'"
							style="cursor: pointer;">요청 게시판</div>
					</div>
					<br>
					<p class="title_size">요청 수정</p>

					<form action="./requestBoardUpdateProcess.do" method="post">
						<p class="info_size">작성자 : ${sessionUser.member_name }</p>
						<hr class="new1">
						제목 : <input type="text" placeholder="제목을 입력하세요"
							name="request_name" style="width: 400px;" id="requestName"
							value="${data.requestBoardVo.request_name }">&nbsp;<span
							class="info_size">요청하려는 강의에 대해 명확하게 작성해주세요</span>
						<p></p>
						<script>
    $(document).ready(function() {
        $('#requestName').on('keyup', function() {
            $('#requestName_cnt').html("("+$(this).val().length+" / 30)");
 
            if($(this).val().length > 30) {
                $(this).val($(this).val().substring(0, 30));
                
            }
        });
    });      
    </script>
						<textarea rows="20" cols="127" name="request_content"
							style="resize: none;" id="requestContent">${data.requestBoardVo.request_content }</textarea>
						<div id="requestContent_cnt">(0/800)</div>
						<hr class="new1">
						<input type="hidden" name="request_no"
							value="${data.requestBoardVo.request_no }">
						<button type="submit" class="btn btn-success">작성 완료</button>
						<script>
    $(document).ready(function() {
        $('#requestContent').on('keyup', function() {
            $('#requestContent_cnt').html("("+$(this).val().length+" / 400)");
 
            if($(this).val().length > 800) {
                $(this).val($(this).val().substring(0, 800));
                $('#requestContent_cnt').html("(800 / 800)");
            }
        });
    });      
    </script>
					</form>

				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
</body>
</html>
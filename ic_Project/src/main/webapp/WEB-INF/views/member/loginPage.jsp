<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<div style="width:1200px; margin:0 auto">
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-3">
			
			<form action="./loginProcess.do" method="post">
				<div class="row mt-5">
					<div class="col">
					<a href="../main/loggedIn.do">
					<img class="img-fluid" src="../resources/img/KakaoTalk_20211120_002136976.png" width="100%">
					</a>
				</div>
				</div>
				<div class="row mt-5">
						<div class="col">
							<input class="form-control" type="text" name="member_id" placeholder="아이디">
						</div>
					</div>
				<div class="row mt-2">
						<div class="col">
							<input class="form-control" type="password" name="member_pw" placeholder="비밀번호">
						</div>
				</div> 	
				<div class="row mt-4">
						<div class = "col d-grid">
						<input class = "btn btn-primary"type="submit" value="로그인">
						</div>
				</div>
				<div class="row mt-2"> <!-- 회원가입 -->
						<div class = "col d-grid">
							<a class="btn btn-outline-secondary" href="./joinMemberPage.do">회원가입</a>
						</div>
					</div>
			</form>
			</div>
			<div class="col"></div>
			
		</div>	
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
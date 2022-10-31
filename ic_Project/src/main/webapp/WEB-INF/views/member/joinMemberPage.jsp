<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
//11.24 추가한부분

var isChecked = false;

function pwConfirm(){
	var pw = document.getElementById("pw");
	var pwConfirmBox = document.getElementById("pwConfirmBox");
	
	var checkpwAlertBox = document.getElementById("checkpwAlert");
	if(pw.value != pwConfirmBox.value){
		checkpwAlertBox.innerText="비밀번호가 일치하지 않습니다.";
		checkpwAlertBox.style.color="red";
	}else{
		checkpwAlertBox.innerText="비밀번호가 일치합니다.";
		checkpwAlertBox.style.color="green";
	}
}

function doSubmit() {
		
		var joinMember = document.getElementById("joinMember");
		
		joinMember.submit(); 
	}


	function checkId() {
	
	var idBox = document.getElementById("id");
	var idText= idBox.value;
	
	var xmlhttp = new XMLHttpRequest();

	//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//alert("테스트");
			//alert(xmlhttp.responseText);
			var data = JSON.parse(xmlhttp.responseText);
	
			//dom 사용자 피드백 클라이언트 사이드 랜더링
			var checkIdAlertBox= document.getElementById("checkIdAlert");
			
			
			if(data.result ==true){
			//	alert("사용 불가능한 아이디입니다.");
				isChecked=false;
				checkIdAlertBox.innerText="사용 불가능한 아이디입니다.";
				checkIdAlertBox.style.color="red";
			}else{
			//	alert("사용이 가능한 아이디입니다.")
				isChecked=true;
				checkIdAlertBox.innerText="사용가능한 아이디입니다.";
				checkIdAlertBox.style.color="green";
			}
		}
	};
		
		//get 방식으로 파라미터 보내는법...
		xmlhttp.open("get" , "./isExistId.do?id="+ idText); 
		xmlhttp.send();
	}
</script>
</head>
<body>

<div style="width:1200px; margin:0 auto">
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-3">
				<form id="joinMember"action="./joinMemberProcess.do" method="post">
				<div class="row mt-5">
					<div class="col">
					<a href="../main/loggedIn.do">
					<img class="img-fluid" src="../resources/img/KakaoTalk_20211120_002136976.png" width="100%">
					</a>
				</div>
				</div>
					<div class="row mt-5">
						<div class="col">
							아이디<br>
							<input class="form-control" type="text" id="id"  name="member_id" onblur="checkId()">
						</div>
					</div>
					<div id="checkIdAlert"></div>
					<div class="row mt-2">
						<div class="col">
							비밀번호<br>
							<input class="form-control" type="password" id="pw"  name="member_pw">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							비밀번호 재확인<br>
							<input class="form-control"type="password" id="pwConfirmBox" onblur="pwConfirm()">
						</div>
					</div>
					<div id="checkpwAlert"></div>
					<div class="row mt-2">
						<div class="col">
							이름<br>
							<input class="form-control" type="text" id="name" name="member_name">
						</div>
					</div>
					
					<div class="row mt-2">
						<div class="col">
							휴대전화<br>
							<input class="form-control" type="text" id="phone" name="member_phone">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							이메일<br>
							<input class="form-control" type="text" id="email" name="member_email">
						</div>
					</div>
				<div class="row mt-4">
						<div class = "col d-grid">
							<input type="button" onclick="doSubmit()" value="회원 가입">	
					</div>
				</div>
				<div class="row mt-4">
						<div class = "col">
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
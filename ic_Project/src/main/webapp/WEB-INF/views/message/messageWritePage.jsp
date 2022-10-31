<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
var isChecked = false;

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
			var recv_id_no=document.getElementById("recv_id_no");
			
			if(data.isExist ==false){
			//	alert("사용 불가능한 아이디입니다.");
				isChecked=false;
				checkIdAlertBox.innerText="존재하지 않는 아이디입니다. 상대방의 아이디를 확인해주세요";
				checkIdAlertBox.style.color="red";
			}else{
			//	alert("사용이 가능한 아이디입니다.")
				isChecked=true;
				recv_id_no.value=data.getMemberInfoByID.member_no;
			//	checkIdAlertBox.innerText=getMemberInfoByID;
			// 	checkIdAlertBox.style.color="green";
			}
		}
	};
		
		//get 방식으로 파라미터 보내는법...
		xmlhttp.open("get" , "./MessageisExistId.do?id="+ idText); 
		xmlhttp.send();
	}
	




function doSubmit() {
	
	var writeMessage = document.getElementById("writeMessage");
	
	writeMessage.submit(); 
}


</script>
</head>
<body>

<div style="width:1200px; margin:0 auto">
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-3">
				<form id="writeMessage"action="./messageWirteProcess.do" method="post">
				<div class="row mt-5">
					<div class="col">
					<a href="../main/loggedIn.do">
					<img class="img-fluid" src="../resources/img/KakaoTalk_20211120_002136976.png" width="100%">
					</a>
				</div>
				</div>
					<div class="row mt-5">
						<div class="col">
							받는 사람 아이디<br>
							<input class="form-control" type="text" id="id" onblur="checkId()">
							<input class="form-control" type="hidden" id="recv_id_no" name="message_recv">
						</div>
					</div>
					<div id="checkIdAlert"></div>
					<div class="row mt-2">
						<div class="col">
							제목 : <br>
							<input class="form-control" type="text" id="title" name="message_title"><br>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							내용 : <br>
							<textarea rows="10" cols="60"  id="content" name="message_content"></textarea><br>
						</div>
					</div>
					
				<div class="row mt-4">
						<div class = "col d-grid">
							<input type ="button" onclick ="doSubmit()" value="보내기">
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
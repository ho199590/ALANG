<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>

<style>
#yes {
	margin-right: 0px;
	border-radius: 20px;
	color: skyblue;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	transition-duration: 1s;
}

#yes:hover {
	background-color: #a3f1ff;
	color: black
}

#no {
	margin-left: 300px;
	border-radius: 20px;
	color: skyblue;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	transition-duration: 1s;
}

#no:hover {
	background-color: #ffa1a1;
	color: black
}
</style>
<style>
.title_size {
	font-size: xx-large;
	font-weight: bold;
}
</style>
<style>
img {
	border-radius: 50%;
}
</style>
<jsp:include page="../common/main_css.jsp"></jsp:include>
<title>강좌 보기</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        
        <!-- Favicon-->
       <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
       <!-- Core theme CSS (includes Bootstrap)-->
       <link href="../resources/coursePage/css/styles.css" rel="stylesheet" />

       <!--내 부트스트랩-->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       
       <!-- 스크립트... -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
       
          </head>
	
<script type="text/javascript">
	var myModal = null;
	var rechargeModal = null;
	var purchaseAgreeModal = null;
	var modal = null;
	
	var course_no = ${data.courseVo.course_no};
	
	function addCart(lecture_no) {
		var xmlhttp = new XMLHttpRequest();
            
        xmlhttp.open("get" , "./addCart.do?lecture_no=" + lecture_no); 
        xmlhttp.send();
        
        alert("장바구니에 담겼습니다.");    
		
	}
	
	function introModal(){
        
        var modalb = document.getElementById('courseModal');
        var content =  document.getElementById('introContent');
        content.innerHTML = "";
        
        var xmlhttp = new XMLHttpRequest();		
        
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState==4 && xmlhttp.status==200){
                var data = JSON.parse(xmlhttp.responseText);				
        
                var header = document.createElement("div");
                header.setAttribute("class", "modal-header");
                content.appendChild(header);
                
                var modalHeaderTitle = document.createElement("h4");
                modalHeaderTitle.setAttribute("class" , "modal-title");
                modalHeaderTitle.setAttribute("style" , "color : black");
                modalHeaderTitle.innerText = data.courseVo.course_name;				
                header.appendChild(modalHeaderTitle);
                
                var modalCloseHead = document.createElement("button");
                modalCloseHead.setAttribute("type", "button");
                modalCloseHead.setAttribute("class", "btn-close");
                modalCloseHead.setAttribute("data-bs-dismiss", "modal");
                header.appendChild(modalCloseHead);                
    
                var body = document.createElement("div");
                body.setAttribute("class", "modal-body");
                body.setAttribute("style", "text-align:center;");
                body.innerText = data.courseVo.course_tuto;
                content.appendChild(body);
                
                var footer = document.createElement("div");
                footer.setAttribute("class", "modal-footer");
                content.appendChild(footer);     
                
                var exitBtn = document.createElement("button");
                exitBtn.setAttribute("class", "btn btn-outline-primary");
                exitBtn.setAttribute("type", "button");
                exitBtn.setAttribute("id", "introExit");
                exitBtn.innerText = "취소";
    
                footer.appendChild(exitBtn);
                
                modal.show();
    
            }
        };
        xmlhttp.open("get" , "./getCourseParam.do?course_no=" + course_no); 
        xmlhttp.send();
    }
			
	function purchaseProcessModal(lecture_no){
		//controller에서 세션유저에 대한 정보를 던져주므로 바로 받아서 사용...
		var member_no = ${memberVo.member_no};
			
		console.log("현재 로그인 되어있는 멤버 번호 : " + member_no);
					
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);
				
				//파라미터를 넘겨준 lecturePurchase.do를 실행 후 return되는 JSON 데이터를 가지고 컨트롤 한다.
				
				var outerRow = document.getElementById("modal_body");
				
				//누를때마다 쌓이지 않게 초기화 한번 하고 시작
				outerRow.innerHTML = "";
				
				outerRow.setAttribute("class","modal-body row");
				
				var outerCol = document.createElement("div");
				outerCol.setAttribute("class","col");
				outerRow.appendChild(outerCol);
				
				//강의 이름
				var course_name_rowBox = document.createElement("div");
				course_name_rowBox.setAttribute("class","row");
				
				var course_name_col = document.createElement("div");
				course_name_col.setAttribute("class", "col");
				course_name_col.innerText = "선택하신 강의 제목 : " + data.lectureVo.course_name;
				
				course_name_rowBox.appendChild(course_name_col);
				
				outerCol.appendChild(course_name_rowBox);
				
				//강의 가격
				var course_price_rowBox = document.createElement("div");
				course_price_rowBox.setAttribute("class","row");
									
				var course_price_col = document.createElement("div");
				course_price_col.setAttribute("class", "col");
				course_price_col.innerText = "해당 강의의 가격 : " + data.lectureVo.course_price;
				
				course_price_rowBox.appendChild(course_price_col);
				
				outerCol.appendChild(course_price_rowBox);
														
				//현재 로그인 회원의 보유 포인트
				var member_point_rowBox = document.createElement("div");
				member_point_rowBox.setAttribute("class","row");
				
				var member_point_col = document.createElement("div");
				member_point_col.setAttribute("class", "col");
				member_point_col.innerText = "현재 보유중인 포인트 : " + data.memberVo.member_point;
				
				member_point_rowBox.appendChild(member_point_col);
				
				outerCol.appendChild(member_point_rowBox);
									
				if(data.lectureVo.course_price > data.memberVo.member_point){
					
					//포인트 부족 메세지
					var notEnough_div_Row = document.createElement("div");
					notEnough_div_Row.setAttribute("class", "row");
					
					var notEnough_div_Col = document.createElement("div");
					notEnough_div_Col.setAttribute("class", "col");
					notEnough_div_Col.innerText="포인트가 충분하지 않습니다. 충전하시겠습니까?";
					
					notEnough_div_Row.appendChild(notEnough_div_Col);
					
					outerCol.appendChild(notEnough_div_Row);
					
					//버튼들이 있는 modal-footer
					var notEnough = document.getElementById("modal_footer");
					
					notEnough.innerHTML = "";
					
					notEnough.setAttribute("class", "modal-footer");
					
					//취소 버튼
					var cancleButton = document.createElement("button");
					cancleButton.setAttribute("class", "btn btn-secondary");
					cancleButton.setAttribute("data-bs-dismiss", "modal");
					cancleButton.setAttribute("onclick", "hideModal()");
					cancleButton.innerText = "Close";
					notEnough.appendChild(cancleButton);
					
					//충전하러 가기 버튼
					var rechargeButton = document.createElement("button");
					rechargeButton.setAttribute("class", "btn btn-primary");
					rechargeButton.setAttribute("data-bs-target", "#pluspoint");
					rechargeButton.setAttribute("data-bs-toggle", "modal");
					rechargeButton.innerText = "충전하러 가기";
					notEnough.appendChild(rechargeButton);
					
				}else{
					var confirm_div_Row = document.createElement("div");
					confirm_div_Row.setAttribute("class", "row");
					
					var confirm_div_Col = document.createElement("div");
					confirm_div_Col.setAttribute("class", "col");
					confirm_div_Col.innerText="해당 강의를 구매 하시겠습니까?";
					
					confirm_div_Row.appendChild(confirm_div_Col);
					
					outerCol.appendChild(confirm_div_Row);
					
					//버튼들이 있는 modal-footer
					var confirm = document.getElementById("modal_footer");
					
					confirm.innerHTML = "";
					
					confirm.setAttribute("class", "modal-footer");
					
					//취소 버튼
					var cancleButton = document.createElement("button");
					cancleButton.setAttribute("class", "btn btn-secondary");
					cancleButton.setAttribute("data-bs-dismiss", "modal");
					cancleButton.setAttribute("onclick", "hideModal()");
					cancleButton.innerText = "Close";
					confirm.appendChild(cancleButton);
					
					//구매 버튼
					var href = document.createElement("a");
					href.setAttribute("href","./purchaseSuccess.do?course_no=" + data.lectureVo.course_no + "&lecture_no=" + data.lectureVo.lecture_no);
					
					var confirmButton = document.createElement("button");
					confirmButton.setAttribute("class", "btn btn-primary");
					//confirmButton.setAttribute("onclick", "purchaseAgreeModal("+ lecture_no +")");
					confirmButton.innerText = "구매 진행";
					
					href.appendChild(confirmButton);
					
					confirm.appendChild(href);
				}
			}
		}
		
		//JSON Data로 만들기 위해 REST 컨트롤러로 전송
		xmlhttp.open("get" , "./lecturePurchase.do?lecture_no=" + lecture_no); 
		xmlhttp.send();	
		
		myModal.show();
		
	}
				
	function hideModal() {
		
		myModal.hide();
	}
	
	function purchaseAgreeModal(lecture_no) {
		
	var xmlhttp = new XMLHttpRequest();
		
	//purchaseAgreeModal.show();
	
	xmlhttp.open("get" , "./purchaseSuccess.do?lecture_no=" + lecture_no); 
	xmlhttp.send();	
	
		/* $.ajax({
			type: "POST", //요청 메소드 방식
			//?course_no=&lecture_no=&member_no=
			
			url:"./purchaseSuccess.do",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data : "course_no="+data1+"&lecture_no="+data2+"&member_no="+data3,
			success : function(result){
				//서버의 응답데이터가 클라이언트에게 도착하면 자동으로 실행되는함수(콜백)
				//result - 응답데이터
				//$('#result').text(result);
				alert(result);
			},
			error : function(a, b, c){
				//통신 실패시 발생하는 함수(콜백)
				alert(a + b + c);
			}
		}); */
	}
		
	window.addEventListener('DOMContentLoaded', function() {
		var errorType = "${errorTypeCheck}";
		
		if(errorType == "1"){
			alert("구매 후 시청이 가능합니다!");
			errorType = "";
			
			location.href = "./courseViewerPage.do?course_no=" + ${data.courseVo.course_no}; 
									
		}
		
		modal = new bootstrap.Modal(document.getElementById('courseModal'));
		myModal = new bootstrap.Modal(document.getElementById("purchaseModal"));
		rechargeModal = new bootstrap.Modal(document.getElementById("rechargeModal"));
		purchaseAgreeModal = new bootstrap.Modal(document.getElementById("purchaseAgreeModal"));
	
	});  
	
	/*
	$(document).ready(function() {
		if( ${errorTypeCheck eq 1} ){
			alert("구매 후 시청이 가능합니다!");
		}
		
		myModal = new bootstrap.Modal(document.getElementById("purchaseModal"));
		rechargeModal = new bootstrap.Modal(document.getElementById("rechargeModal"));
		purchaseAgreeModal = new bootstrap.Modal(document.getElementById("purchaseAgreeModal"));
		
	});
	*/
			
</script>

</head>
<body>
	<div style="width: 100%" class="row">				<!-- 네비게이션 바 -->
		<div class="col">
			<header>
				<jsp:include page="../common/global_nav.jsp"></jsp:include>
			</header>
		</div>
	</div>

	<!-- Header - set the background image for the header in the line below-->
       <header class="py-5 bg-image-full" style="background-image: url(../resources/coursePage/img/test.jpg) ;background-size: 100% 100%;" >
           <div class="text-center my-5">
               <div class= "justify-content-center" style = "  margin: 0 auto; width : 50%; background-color: rgba( 0, 0, 0, 0.5 );">            		         	            	
                   <img class="img-fluid rounded-circle mb-4" src="../resources/img/mollu.gif" alt="..." / height="150" width="150">
                   <h1 class="text-white fs-3 fw-bolder">${data.courseVo.course_name}</h1>
                   <p class="text-white-50 mb-0">${creatorName}</p>
                   <button type="button" class="btn btn-outline-secondary" id="modalBtn" onclick = "introModal()">강좌 개요</button>					
               </div>				
           </div>
       </header>
	
	<div class="container mt-3">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#Notice">공지사항</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#Lecture">강의 듣기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#Review">후기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#Qna">Q&A</a>
			</li>
		</ul>
	
		<!-- Tab panes -->
		<div class="tab-content">
			<div id="Notice" class="container tab-pane active"><br>		
				<!-- 공지테이블 -->
				<div class="row mt-2">
					<div class="col">
						<table class="table table-dark table-hover">
						<thead>
							<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th><i class="text-primary bi bi-person"></i>작성자</th>									
							<th>작성일</th>								
							</tr>
						</thead>
						<c:forEach items="${noticeList }" var="data">
							<tr>
								<td>공지</td>
								<td><a href="./readNoticePage.do?notice_no=${data.noticeVo.notice_no }">${data.noticeVo.notice_title }</a></td>
								<td>${data.memberVo.member_name }</td>									
								<td><fmt:formatDate value="${data.noticeVo.notice_date }" pattern="yy년 MM월 dd일 hh:mm" /></td>
							</tr>	
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- 공지테이블 끝 -->	
			
			<!-- 강의 듣기 페이지 -->
			<div id="Lecture" class="container tab-pane fade"><br>
				<table class="table text-center">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">강의 제목</th>
				      <th scope="col">가격</th>
				      <th scope="col">등록일</th>
				      <th scope="col">구매 여부</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${lecture }" var="data" varStatus="i">
				    <tr>
				  		<th scope="row" style="vertical-align: middle">${fn:length(lecture) - i.index}</th>
						<td style="vertical-align: middle"><a href="./purchaseDirection.do?lecture_no=${data.lecture_no }&course_no=${data.course_no}"> ${data.course_name } </a></td>
						<td style="vertical-align: middle"><input type="hidden" id="course_price" name="course_price" value="${data.course_price }">${data.course_price }</td>
					    <td style="vertical-align: middle"><fmt:formatDate value="${data.course_register_date }" pattern="yy년 MM월 dd일 hh:mm" /></td>
					    <td align="center">
					    <!-- 
					    	<button onclick="purchaseModal('${data.lecture_no}', '${data.course_name }', '${data.course_price }')" class="btn btn-outline-primary">구매</button>
					     -->
					     <c:choose>
					     	<c:when test="${data.check_Purchase eq 0}">
					     		<div style="width: 130px; text-align: center;">
					     			<button onclick="purchaseProcessModal('${data.lecture_no }')" class="btn btn-outline-primary form-control">구매</button>
					     			<button onclick="addCart('${data.lecture_no}')" class="btn btn-outline-secondary form-control">장바구니 담기</button> 
					     		 </div>
					     	</c:when>
					     	<c:otherwise>
					     		<div>
					     			<button type="button" class="btn btn-secondary" disabled>구매 완료</button>
					     		</div>
					     	</c:otherwise>
					     </c:choose>
					    </td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>	
			</div>
			<!-- 강의 듣기 페이지 끝 -->
			<div id="Review" class="container tab-pane fade"><br>
				<p>강의 후기</p>
			</div>
			<div id="Qna" class="container tab-pane fade"><br>
			<div class="row mt-2">
				<div class="col">
					<table class="table table-info table-hover">
						<thead>
							<tr>
							<th>질문 번호</th>
							<th>질문 제목</th>							
							<th><i class="text-primary bi bi-person"></i>작성자</th>									
							<th>작성일</th>								
							</tr>
						</thead>
						<c:forEach items="${question }" var="question">
						<tr>
							<td>${question.questionVo.question_no }</td>
							<td><a href="./readQuestionPage.do?question_no=${question.questionVo.question_no }">${question.questionVo.question_name }</a></td>
							<td>${question.memberVo.member_id }</td>
							<td>${question.questionVo.question_date }</td>
						</tr>	
						</c:forEach>
					</table>
				</div>
			</div>			
			<a href = "questionWritePage.do?course_no=${data.courseVo.course_no}">
				<button class="btn btn-primary" type="button">테스트용</button>
			</a>	
		</div>
		</div>
	</div>
	
	<!-- Modal -->
		<div class="modal fade" id="purchaseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">구매 확인</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="modal_body">
		      
		      </div>
		      <div class="modal-footer" id="modal_footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- The Modal -->
		<div class="modal" id="pluspoint">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">포인트 충전</h4>
						<button type="button" class="btn-close"
							data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="../pluspoint/plusPoint.do" method="post">
							<input type="radio" name="plus_point" value="5000" id="5"
								checked="checked"><label for="5">5000<i
								class="fas fa-coins"></i></label> <input type="radio"
								name="plus_point" value="10000" id="10"><label
								for="10">10000<i class="fas fa-coins"></i></label> <input
								type="radio" name="plus_point" value="15000" id="15"><label
								for="15">15000<i class="fas fa-coins"></i></label> <input
								type="radio" name="plus_point" value="20000" id="20"><label
								for="20">20000<i class="fas fa-coins"></i></label> <br>
							<p></p>
							<span>
								<button type="button" id="no" data-bs-dismiss="modal">안할래요</button>
								<button type="submit" id="yes" name="plus_point">충전해요</button>
							</span>
						</form>
					</div>

				</div>
			</div>
		</div>
				
		<!-- Image element - set the background image for the header in the line below-->
       <div class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/4ulffa6qoKA/1200x800')">
           <div style="height: 20rem"></div>
       </div>
       <!-- Content section-->
       <section class="py-5" id = "footerPage">
           <div class="container my-5">
               <div class="row justify-content-center">
                   <div class="col-lg-6">
                   <div id="reviewDemo" class="carousel slide" data-bs-ride="carousel"></div>
                       
                   </div>
                   <div class="col-lg-6">
                   <div id="studentListBox"></div>
                       
                   </div>                   
               </div>
           </div>
       </section>
		
		<!-- Footer -->
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
	       <footer class="py-5 bg-dark">
	           <div class="container"><p class="m-0 text-center text-white">Alang &copy; JuanAng 2021</p>	           		
	           </div>
	       </footer>
	       <!-- Bootstrap core JS-->
	      <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  -->
	       <!-- Core theme JS-->
	    
	        <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content" id = "introContent">
	            </div>
	        </div>
	        </div>
        </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
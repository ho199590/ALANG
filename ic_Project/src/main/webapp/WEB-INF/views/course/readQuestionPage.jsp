<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
		<!--폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		
<style>
    .border-top-gray {border-top: 0.25rem solid #bfbfbf !important;}
    .border-top-lightgray {border-top: 0.25rem solid #DADADA !important;}
    .bg-gradient-success {background-color: #5ddbad;background-image: linear-gradient(180deg, #5ddbad 10%, #4d947a 100%);background-size: cover;}
    .bg-gradient-info {background-color: #36b9cc;background-image: linear-gradient(180deg, #36b9cc 10%, #5c97a1 100%);background-size: cover;}
    .btn-icon-split {padding: 0; overflow: hidden; display: inline-flex; align-items: stretch;justify-content: center;}
    .font-weight-middle {font-weight: 600 !important;}
    .font-weight-small {font-weight: 400 !important;}
    .text-gray {color: #6e707e !important;}
    .text-lightgray {color: #9294a0 !important;}
    body {font-family: 'Noto Sans KR', sans-serif !important}
</style>
<script type="text/javascript">
    
    
    var question_no = ${data.questionVo.question_no}	

    function writeAnswer(){

        var writeBox = document.getElementById("writeAnswer");
        var writeText = writeBox.value;

        var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);
                
				refreshCommentList();
			}
		};
		
		xmlhttp.open("post" , "./writeAnswerProcess.do"); 
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("question_no=" + question_no + "&answer_content=" + writeText);
				
		writeBox.value = "";
    }
    
    

    function refreshCommentList(){
		
		var xmlhttp = new XMLHttpRequest();
        cnt = 1;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);
								
				var answerBox = document.getElementById("answerAccordion");				
				answerBox.innerHTML = ""; 
				
				
				for(answerData of data.answerList){
					
					var xxx = document.getElementById("item-templete");
					var ttt = xxx.cloneNode(true);
					ttt.setAttribute('class' , "accordion-item");
					ttt.removeAttribute("id");
					
					var headerText = ttt.getElementsByClassName("headerText")[0];
					headerText.setAttribute('id' , "heading"+cnt);
					
					var box1 = ttt.getElementsByClassName("box1")[0];
					box1.setAttribute('data-bs-target' , "#collapse" + cnt);
					box1.setAttribute('aria-controls' , "collapse" + cnt);
					
					var box2 = ttt.getElementsByClassName("box2")[0];
					box2.setAttribute('id' , "collapse"+cnt);
					box2.setAttribute('aria-labelledby' , "heading" + cnt);
					box2.setAttribute('data-bs-parent' , "#answerAccordion");
					
					var box3 = ttt.getElementsByClassName("box3")[0];					
					box3.innerText = answerData.answerVo.answer_content;
					
					var idBox1 = ttt.getElementsByClassName("idBox1")[0];
					idBox1.innerText = answerData.memberVo.member_id + "님의 답변입니다.";

					
					var dateBox3 = ttt.getElementsByClassName("dateBox3")[0];
					dateBox3.innerText = answerData.answerVo.answer_date;
					
					
					answerBox.appendChild(ttt);
					

                    cnt++;
                }
				
			}
		};
		
		xmlhttp.open("get" , "./getAnswerList.do?question_no=" + question_no); 
		xmlhttp.send();		
		
	}

	function init(){		
		refreshCommentList();
	}

	window.addEventListener("DOMContentLoaded" , init);
    
    
</script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id = "header">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link h4 text-dark" id = "studentLogBtn">학생기록</a></li>                       
        </ul>
    </nav>	 
	
	<div class="text-center container" style="margin-top: 50px; ">
		<h1 class="display-5 fw-bold">${data.questionVo.question_name }</h1>
			<h6><small>${data.memberVo.member_id}</small></h6>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">
				${data.questionVo.question_content }
			</p>
			<div class="gap-2 justify-content-sm-center border-top-lightgray" style = "padding-top: 20px;;">
				<a href="#" class="btn bg-gradient-info text-white">
                    <span class="icon text-white-50">
                        <i class="bi bi-hand-thumbs-up"></i>
                    </span>
                    <span class="text">강사님의 답변</span>
                </a>
                <a class="btn bg-gradient-success text-white" onclick="writeAnswer()">
                    <span class="icon text-white-50">
                        <i class="bi bi-lightbulb"></i>
                    </span>
                    <span class="text">답변 작성하기</span>
                </a>
			</div>
		</div>
		
		<div class = "row" style = "margin-top: 25px;">
            <label for="writeAnswer" class = "font-weight-middle text-lightgray">나의 답변</label>
            <textarea id="writeAnswer" rows="3" cols="60" style = "margin: auto;"
            class = "col-8" placeholder="답변을 작성해 주세요"></textarea>
		</div>
		
        <div class="accordion border-top-gray" id="answerAccordion" style = "margin-top: 30px; padding-top: 40px;">

        </div>


        <div class="accordion-item d-none" id="item-templete">
            <h2 class="accordion-header headerText" id="headingOne">
              <button class="accordion-button collapsed box1" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                <span class = "idBox1"></span>
                <span class="dateBox3"></span>
              </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse box2" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
              <div class="accordion-body box3">
                <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
         </div>

	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>    
</body>
</html>
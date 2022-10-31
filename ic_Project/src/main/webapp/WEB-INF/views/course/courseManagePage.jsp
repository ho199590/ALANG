<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>자신의 강좌</title>
		<!--폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		
				
	<style>
		.border-left-info {border-left: 0.25rem solid #36b9cc !important;}
		.border-left-green {border-left: 0.25rem solid #11D853 !important;}
		.border-left-gray {border-left: 0.25rem solid #DADADA !important;}
		.border-left-purple {border-left: 0.25rem solid #E481FD !important;}
		.border-left-primary {border-left: 0.25rem solid #0275D8 !important;}
		.font-weight-bold {font-weight: 700 !important;}
		.font-weight-middle {font-weight: 600 !important;}
		.text-gray {color: #6e707e !important;}
		.border-top-gray {border-top: 0.25rem solid #bfbfbf !important;}
		.border-top-lightgray {border-top: 0.25rem solid #DADADA !important;}
		.bg-lightgray{background-color :#F5F5F5;}
		body {font-family: 'Noto Sans KR', sans-serif; !important}
		
	</style>
		
        <!-- Favicon-->
       <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
       <!-- Core theme CSS (includes Bootstrap)-->
       

		<!--내 부트스트랩-->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
       
       <script type="text/javascript">
       var course_no = ${data.courseVo.course_no};
       function changeTabNotice() {
           var xmlhttp = new XMLHttpRequest();        
           
           var noticeBox = document.getElementById("noticeTable");
           var lectureBox = document.getElementById("lectureTable");
           var reviewBox = document.getElementById("reviewTable");
           var questionBox = document.getElementById("questionTable");
           
           var noticeListBox = document.getElementById("noticeList");
           var lectureListBox = document.getElementById("Lecture");	
           var reviewListBox = document.getElementById("Review");	
           var questionListBox = document.getElementById("Qna");		
           
           var noticeTabBtn = document.getElementById("noticeTabBtn");
           var lectureTabBtn = document.getElementById("lectureTabBtn");				
           var questionTabBtn = document.getElementById("questionTabBtn");	
           var reviewTabBtn = document.getElementById("reviewTabBtn");				
   		noticeBox.innerHTML = ""; 

 /*
 		noticeBox.innerHTML = ""; 
          lectureBox.innerHTML = "";
          reviewBox.innerHTML = ""; 
          questionBox.innerHTML = ""; 
          
          noticeListBox.className = "container tab-pane active";
          lectureListBox.className = "container tab-pane fade";
          reviewListBox.className = "container tab-pane fade";
          questionListBox.className = "container tab-pane fade";

 		reviewTabBtn.className = "nav-link h4 text-light";
 		lectureTabBtn.className = "nav-link h4 text-light ";
 		noticeTabBtn.className = "nav-link active h4";
 		questionTabBtn.className = "nav-link h4 text-light ";
 */          
           
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);
                   
                   var xxx = document.getElementById("deleteAlter");   
                   var alterBox = xxx.cloneNode(true);
                   alterBox.setAttribute("id" , "cloneAlter");
                   
                   noticeBox.appendChild(alterBox);

                   
                   var tableBox =  document.createElement("table");
                   tableBox.setAttribute("class" , "table table-light table-hover");
                   noticeListBox.appendChild(tableBox);
                   
                   var tableHead = document.createElement("thead");
                   tableBox.appendChild(tableHead);
                   
                   var headRow = document.createElement("tr");
                   tableHead.appendChild(headRow);

                   var numTh = document.createElement("th");
                   numTh.setAttribute("class", "col-2");
                   numTh.innerText = "#"
                   var titleTh = document.createElement("th");
                   titleTh.setAttribute("class", "col-4");
                   titleTh.innerText = "제목"
                   var writerTh = document.createElement("th");
                   writerTh.setAttribute("class", "col-2");
                   writerTh.innerText = "작성자"
                   var dateTh = document.createElement("th");
                   dateTh.setAttribute("class", "col-3");
                   dateTh.innerText = "작성일"
                   var deleteTh = document.createElement("th");
                   deleteTh.setAttribute("class", "col-1");
                   deleteTh.innerText = "삭제";

                   headRow.appendChild(numTh);
                   headRow.appendChild(titleTh);
                   headRow.appendChild(writerTh);
                   headRow.appendChild(dateTh);
                   headRow.appendChild(deleteTh);

                   var tableBody = document.createElement("tbody");
                   tableBox.appendChild(tableBody);
                   
                   noticeBox.appendChild(tableBox);
                   
                   for(noticeData of data.noticeList){                	  
                       var rowBox = document.createElement("tr");
                       rowBox.setAttribute("id" , "notice"+ noticeData.noticeVo.notice_no);

                       var numTd = document.createElement("th");
                       numTd.setAttribute("scope", "row");
                       numTd.innerText = "공지";
                       rowBox.appendChild(numTd);
 					  
                       var titleTd = document.createElement("td");
                       titleTd.innerText = noticeData.noticeVo.notice_title;;
                       titleTd.setAttribute("onclick", "location.href='./readNoticePage.do?notice_no="+noticeData.noticeVo.notice_no +"'");
 					  rowBox.appendChild(titleTd);
 					  
                       var writerTd = document.createElement("td");
                       writerTd.innerText = noticeData.memberVo.member_name;
                       rowBox.appendChild(writerTd);

                       var dateTd = document.createElement("td");                      
                       var dateSet = noticeData.noticeVo.notice_date;
                       var today = new Date(noticeData.noticeVo.notice_date);

                       var year = today.getFullYear();
      	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
      	  	          var day = ('0' + today.getDate()).slice(-2);
      	  	          var hours = ('0' + today.getHours()).slice(-2); 
      	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
      	  	          var dateString = year + '-' + month  + '-' + day;
      	  	          var timeString = hours + '시' + minutes  + '분 갱신';
                       
                       
                       dateTd.innerText = dateString;
                       rowBox.appendChild(dateTd);

                       var deleteTd = document.createElement("td");
                       deleteTd.innerText = " ";
                       var icon = document.createElement("i");
                       deleteTd.setAttribute("class" , "bi bi-trash-fill h4");
                       
                       deleteTd.appendChild(icon);
                       deleteTd.setAttribute = ("style" , "text-align:center;");
                       icon.setAttribute("onclick" , "noticeDelete(this)");                      
                       rowBox.appendChild(deleteTd);
                       
                       tableBody.appendChild(rowBox);


                   }
               }
           }
           
           xmlhttp.open("get" , "./getCourseNoticeList.do?course_no=" + course_no); 
           xmlhttp.send();	
       
       }	
       
       
            
       function changeTabLecture() {
           var xmlhttp = new XMLHttpRequest();
           
           var noticeBox = document.getElementById("noticeTable");
           var lectureBox = document.getElementById("lectureTable");
           var reviewBox = document.getElementById("reviewTable");
           var questionBox = document.getElementById("questionTable");
           
           var noticeListBox = document.getElementById("noticeList");
           var lectureListBox = document.getElementById("Lecture");	
           var reviewListBox = document.getElementById("Review");	
           var questionListBox = document.getElementById("Qna");		
           
           var noticeTabBtn = document.getElementById("noticeTabBtn");
           var lectureTabBtn = document.getElementById("lectureTabBtn");				
           var questionTabBtn = document.getElementById("questionTabBtn");	
           var reviewTabBtn = document.getElementById("reviewTabBtn");				
           lectureBox.innerHTML = "";

 /*
 		noticeBox.innerHTML = ""; 
          lectureBox.innerHTML = "";
          reviewBox.innerHTML = ""; 
          questionBox.innerHTML = ""; 
          
          noticeListBox.className = "container tab-pane active";
          lectureListBox.className = "container tab-pane fade";
          reviewListBox.className = "container tab-pane fade";
          questionListBox.className = "container tab-pane fade";

 		reviewTabBtn.className = "nav-link h4 text-light";
 		lectureTabBtn.className = "nav-link h4 text-light ";
 		noticeTabBtn.className = "nav-link active h4";
 		questionTabBtn.className = "nav-link h4 text-light ";
 */       		
                   



           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);					
                               
                   var cnt = 0;

                   var size = data.lectureList.length;

                   var tableBox =  document.createElement("table");
                   tableBox.setAttribute("class" , "table table-light table-hover");
                   lectureListBox.appendChild(tableBox);
                   
                   var tableHead = document.createElement("thead");
                   tableBox.appendChild(tableHead);
                   
                   var headRow = document.createElement("tr");
                   tableHead.appendChild(headRow);

                   var numTh = document.createElement("th");
                   numTh.setAttribute("class", "col-2");
                   numTh.innerText = "강좌"
                   var titleTh = document.createElement("th");
                   titleTh.setAttribute("class", "col-5");
                   titleTh.innerText = "제목"
                   var writerTh = document.createElement("th");
                   writerTh.setAttribute("class", "col-1");
                   writerTh.innerText = "가격"
                   var dateTh = document.createElement("th");
                   dateTh.setAttribute("class", "col-1");
                   

                   headRow.appendChild(numTh);
                   headRow.appendChild(titleTh);
                   headRow.appendChild(writerTh);
                   headRow.appendChild(dateTh);

                   var tableBody = document.createElement("tbody");
                   tableBox.appendChild(tableBody);
                   
                   lectureBox.appendChild(tableBox);
                   
                   
       
                   for(lectureData of data.lectureList){
       
                     var rowBox = document.createElement("tr");
                       
                     rowBox.setAttribute("id" , "lecture"+ lectureData.lecture_no);

                       var numTd = document.createElement("th");
                       numTd.setAttribute("scope", "row");
                       numTd.innerText = size-cnt;
                       rowBox.appendChild(numTd);
 					  
                       var titleTd = document.createElement("td");                      
                       titleTd.setAttribute("onclick", "location.href='./lectureView.do?course_no="+course_no + "&lecture_no="+lectureData.lecture_no +"'");
                       
                       var titleText = document.createElement("h5");
                       titleText.setAttribute("class", "mb-0");
                       titleText.innerText = lectureData.course_name;
                       titleTd.appendChild(titleText);
                   
                       var today = new Date(lectureData.course_register_date);

                       var year = today.getFullYear();
      	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
      	  	          var day = ('0' + today.getDate()).slice(-2);
      	  	          var hours = ('0' + today.getHours()).slice(-2); 
      	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
      	  	          var dateString = year + '-' + month  + '-' + day;
      	  	          var timeString = hours + '시' + minutes  + '분 갱신';
                       
                       
                       var dateText = document.createElement("span");
                       dateText.innerText = dateString;
                       titleTd.appendChild(dateText);


                       
                       
                       rowBox.appendChild(titleTd);
 					  
                       var writerTd = document.createElement("td");
                       writerTd.innerText = lectureData.course_price;
                       rowBox.appendChild(writerTd);

                       var playTd = document.createElement("td");
                       playTd.setAttribute = ("style" , "text-align:center;");
                       var icon = document.createElement("i");
                       icon.setAttribute("class" , "bi bi-collection-play h4");
                       
                       playTd.appendChild(icon);
                       
                       
                       rowBox.appendChild(playTd);
                       
                       tableBody.appendChild(rowBox);




                       cnt++;
                   }
               }
           }
           
           xmlhttp.open("get" , "./getCourseLectureList.do?course_no=" + course_no); 
           xmlhttp.send();	
       
       }
       
       function changeTabReview() {
           var xmlhttp = new XMLHttpRequest();
           
           var noticeBox = document.getElementById("noticeTable");
           var lectureBox = document.getElementById("lectureTable");
           var reviewBox = document.getElementById("reviewTable");
           var questionBox = document.getElementById("questionTable");
           
           var noticeListBox = document.getElementById("noticeList");
           var lectureListBox = document.getElementById("Lecture");	
           var reviewListBox = document.getElementById("Review");	
           var questionListBox = document.getElementById("Qna");		
           
           var noticeTabBtn = document.getElementById("noticeTabBtn");
           var lectureTabBtn = document.getElementById("lectureTabBtn");				
           var questionTabBtn = document.getElementById("questionTabBtn");	
           var reviewTabBtn = document.getElementById("reviewTabBtn");				
           reviewBox.innerHTML = ""; 

 /*
 		noticeBox.innerHTML = ""; 
          lectureBox.innerHTML = "";
          reviewBox.innerHTML = ""; 
          questionBox.innerHTML = ""; 
          
          noticeListBox.className = "container tab-pane active";
          lectureListBox.className = "container tab-pane fade";
          reviewListBox.className = "container tab-pane fade";
          questionListBox.className = "container tab-pane fade";

 		reviewTabBtn.className = "nav-link h4 text-light";
 		lectureTabBtn.className = "nav-link h4 text-light ";
 		noticeTabBtn.className = "nav-link active h4";
 		questionTabBtn.className = "nav-link h4 text-light ";
 */       		
                   
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);					
                               
                   var cnt = 0;

                   var size = data.reviewList.length;

                   var tableBox =  document.createElement("table");
                   tableBox.setAttribute("class" , "table table-light table-hover");
                   lectureListBox.appendChild(tableBox);
                   
                   var tableHead = document.createElement("thead");
                   tableBox.appendChild(tableHead);
                   
                   var headRow = document.createElement("tr");
                   tableHead.appendChild(headRow);

                   var numTh = document.createElement("th");
                   numTh.setAttribute("class", "col-2");
                   numTh.innerText = "총 " + data.reviewList.length;
                   
                   var starTh = document.createElement("th");
                   starTh.setAttribute("class", "col-2");
                   starTh.innerText = "평가"
               
                   var titleTh = document.createElement("th");
                   titleTh.setAttribute("class", "col-3");
                   titleTh.innerText = "제목"
 				
                   var writerTh = document.createElement("th");
                   writerTh.setAttribute("class", "col-2");
                   writerTh.innerText = "작성자"
                   
                   var dateTh = document.createElement("th");
                   dateTh.setAttribute("class", "col-3");                  
                   dateTh.innerText = "등록일"
                   
                   


                   headRow.appendChild(numTh);
                   headRow.appendChild(starTh);
                   headRow.appendChild(titleTh);
                   headRow.appendChild(writerTh);
                   headRow.appendChild(dateTh);

                   var tableBody = document.createElement("tbody");
                   tableBox.appendChild(tableBody);
                   
                   reviewBox.appendChild(tableBox);
       
                   for(reviewData of data.reviewList){
       
                       var rowBox = document.createElement("tr");

   					rowBox.setAttribute("id" , "review"+ reviewData.reviewVo.review_no);

 					var numTd = document.createElement("th");
 					numTd.setAttribute("scope", "row");
 					numTd.innerText = size-cnt;
 					rowBox.appendChild(numTd);
 					
 					var starRage = "";
 					for(var i = 0 ; i<reviewData.reviewVo.review_rate ; i++){
 						starRage = starRage + "★";
 					}

 					var starTd = document.createElement("td");
 					starTd.setAttribute("style", "color:#ffd700; background-color : #F9F9F9");
 					starTd.innerText = starRage;
 					rowBox.appendChild(starTd);
 					
 					

 					var titleTd = document.createElement("td");
 					titleTd.innerText = reviewData.reviewVo.review_title;
 					rowBox.appendChild(titleTd);

 					var writerTd = document.createElement("td");                      
 					writerTd.innerText = reviewData.memberVo.member_name;
 					rowBox.appendChild(writerTd);
 					
 					
                    var today = new Date(reviewData.reviewVo.review_date);

                    var year = today.getFullYear();
   	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
   	  	          var day = ('0' + today.getDate()).slice(-2);
   	  	          var hours = ('0' + today.getHours()).slice(-2); 
   	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
   	  	          var dateString = year + '-' + month  + '-' + day;
   	  	          var timeString = hours + '시' + minutes  + '분 갱신';


 					var dateTd = document.createElement("td");                      
 					dateTd.innerText = dateString;
 					rowBox.appendChild(dateTd);



 					tableBody.appendChild(rowBox);


                 	  
                       cnt++;
                   }
               }
           }
           
           xmlhttp.open("get" , "./getCourseReviewList.do?course_no=" + course_no); 
           xmlhttp.send();	
       
       }
       
       function changeTabQuestion() {
           
           var length = 40;
           var xmlhttp = new XMLHttpRequest();
           
           var noticeBox = document.getElementById("noticeTable");
           var lectureBox = document.getElementById("lectureTable");
           var reviewBox = document.getElementById("reviewTable");
           var questionBox = document.getElementById("questionTable");
           
           var noticeListBox = document.getElementById("noticeList");
           var lectureListBox = document.getElementById("Lecture");	
           var reviewListBox = document.getElementById("Review");	
           var questionListBox = document.getElementById("Qna");		
           
           var noticeTabBtn = document.getElementById("noticeTabBtn");
           var lectureTabBtn = document.getElementById("lectureTabBtn");				
           var questionTabBtn = document.getElementById("questionTabBtn");	
           var reviewTabBtn = document.getElementById("reviewTabBtn");				
           questionBox.innerHTML = ""; 

 /*
 		noticeBox.innerHTML = ""; 
          lectureBox.innerHTML = "";
          reviewBox.innerHTML = ""; 
          questionBox.innerHTML = ""; 
          
          noticeListBox.className = "container tab-pane active";
          lectureListBox.className = "container tab-pane fade";
          reviewListBox.className = "container tab-pane fade";
          questionListBox.className = "container tab-pane fade";

 		reviewTabBtn.className = "nav-link h4 text-light";
 		lectureTabBtn.className = "nav-link h4 text-light ";
 		noticeTabBtn.className = "nav-link active h4";
 		questionTabBtn.className = "nav-link h4 text-light ";
 */       		
                   
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);					
                               
                   var cnt = 0;
                   
                   var tableBox =  document.createElement("table");
                   tableBox.setAttribute("class" , "table table-light table-hover");
                   questionBox.appendChild(tableBox);
                   
                   var tableHead = document.createElement("thead");
                   tableBox.appendChild(tableHead)
                   
                   var headRow = document.createElement("tr");
                   tableHead.appendChild(headRow);

                   var numTh = document.createElement("th");
                   numTh.setAttribute("class", "col-1");
                   numTh.innerText = "#"
                   var titleTh = document.createElement("th");
                   titleTh.setAttribute("class", "col-3");
                   titleTh.innerText = "제목"
                   var contentTh = document.createElement("th");
                   contentTh.setAttribute("class", "col-4");
                   contentTh.innerText = "질문내용"
                   var writerTh = document.createElement("th");
                   writerTh.setAttribute("class", "col-1");
                   writerTh.innerText = "작성자"
                   var dateTh = document.createElement("th");
                   dateTh.setAttribute("class", "col-2");
                   dateTh.innerText = "작성일"
                   var answerTh = document.createElement("th");
                   answerTh.setAttribute("class", "col-2");
                   answerTh.innerText = "답변"

                   headRow.appendChild(numTh);
                   headRow.appendChild(titleTh);
                   headRow.appendChild(contentTh);
                   headRow.appendChild(writerTh);
                   headRow.appendChild(dateTh);
                   headRow.appendChild(answerTh);

                   var tableBody = document.createElement("tbody");
                   tableBox.appendChild(tableBody);

                   var size = data.questionList.length;

                       for(questionData of data.questionList){                                
                           var rowBox = document.createElement("tr");
                           rowBox.setAttribute("id", "question"+questionData.questionVo.question_no)
                           
                           var numTd = document.createElement("th");
                           numTd.setAttribute("scope", "row");
                           numTd.innerText = size - cnt;
                           rowBox.appendChild(numTd);

                           var titleTd = document.createElement("td");
                           titleTd.innerText = questionData.questionVo.question_name;
                           titleTd.setAttribute("onclick", "location.href='./readQuestionPage.do?question_no="+questionData.questionVo.question_no + "'");
                           rowBox.appendChild(titleTd);
                           
                           if(titleTd.innerText.length > 30){
                         	  titleTd.innerText = questionData.questionVo.question_name.substr(0, 30) + "...";
                            }


                           var contentTd = document.createElement("td");
                           contentTd.innerText = questionData.questionVo.question_content;
                           rowBox.appendChild(contentTd);

                           if(contentTd.innerText.length > length){
                          	 contentTd.innerText = questionData.questionVo.question_content.substr(0, length-2) + "...";
                           }

                           var writerTd = document.createElement("td");
                           writerTd.innerText = questionData.memberVo.member_name;
                           rowBox.appendChild(writerTd);
                           
                           var today = new Date(questionData.questionVo.question_date);

                           var year = today.getFullYear();
          	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
          	  	          var day = ('0' + today.getDate()).slice(-2);
          	  	          var hours = ('0' + today.getHours()).slice(-2); 
          	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
          	  	          var dateString = year + '-' + month  + '-' + day;
          	  	          var timeString = hours + '시' + minutes  + '분 갱신';


                           var dateTd = document.createElement("td");
                           dateTd.innerText = dateString;
                           rowBox.appendChild(dateTd);

                           var answerTd = document.createElement("td");
                           answerTd.innerText = "빠른 답변";
                           answerTd.setAttribute("onclick" , "instantAnswer(this)");
                           answerTd.setAttribute("style" , "color : red;");
                           rowBox.appendChild(answerTd);


                           cnt++;
                           tableBody.appendChild(rowBox);
                       }                    
                   	getTeacherAnswerList();

                   }              	
               
               }
           
           
           xmlhttp.open("get" , "./getCoursQuestionList.do?course_no=" + course_no); 
           xmlhttp.send();	
       }
       
       function getTeacherAnswerList(){
       
      	 var length = 30;
      	 
      	 console.log("실실");
      	 
 		      var xmlhttp = new XMLHttpRequest();	
 		      xmlhttp.onreadystatechange = function(){
 		          if(xmlhttp.readyState==4 && xmlhttp.status==200){
 		              var data = JSON.parse(xmlhttp.responseText);
 		                             
 		              for(answerData of data.teacherAnswerList){
 		
 		             	var questionTr = document.getElementById("question" + answerData.answerVo.question_no);
 		             	var answerOk = questionTr.childNodes[5];
 		             	
                         answerOk.setAttribute("style", "color:#15b000; font-size:14px");
 		             	answerOk.innerText = "답변 완료";
 		             	 
 						var rowBox = document.createElement("tr");
 		                rowBox.setAttribute("class", "table-active");
 		                  
 		                var numTd = document.createElement("th");
 		                  numTd.setAttribute("scope", "row");                     
 		                  rowBox.appendChild(numTd);
 		
 		                  var titleTd = document.createElement("td");                     
 		                  rowBox.appendChild(titleTd);
 		
 		                  var contentTd = document.createElement("td");
 		                  contentTd.innerText = answerData.answerVo.answer_content;
 		                  rowBox.appendChild(contentTd);
 		
 		                  if(contentTd.innerText.length > length){
 		                 	 contentTd.innerText = answerData.answerVo.answer_content.substr(0, length-2) + "...";
 		                  }
 		
 		                  var writerTd = document.createElement("td");
 		                  writerTd.innerText = answerData.memberVo.member_id;
 		                  rowBox.appendChild(writerTd);
 		                  
                          var today = new Date(answerData.answerVo.answer_date);

                          var year = today.getFullYear();
         	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
         	  	          var day = ('0' + today.getDate()).slice(-2);
         	  	          var hours = ('0' + today.getHours()).slice(-2); 
         	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
         	  	          var dateString = year + '-' + month  + '-' + day;
         	  	          var timeString = hours + '시' + minutes  + '분 갱신';

 		
 		                  var dateTd = document.createElement("td");
 		                  dateTd.innerText = dateString;
 		                  rowBox.appendChild(dateTd);
 		
 		                  var answerTd = document.createElement("td");
 		                  rowBox.appendChild(answerTd);
 		
 		                  questionTr.after(rowBox);
 			              
 			              }
 			          }
 			      }
 	      
 	
 			xmlhttp.open("get" , "./getTeacherAnswerList.do?course_no=" + course_no); 
 			xmlhttp.send();	
 		}
 	      
       
       function getLatestReview() {
           
           var xmlhttp = new XMLHttpRequest();
           
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);				
                   
                   var reviewDemo = document.getElementById("reviewDemo");
                   reviewDemo.innerHTML = "";
                   
                   var indicators = document.createElement("div");
                   indicators.setAttribute("class" , "carousel-indicators");
                   reviewDemo.appendChild(indicators);
                   
                   var demoBtn1 = document.createElement("button");
                   demoBtn1.setAttribute("type" , "button");
                   demoBtn1.setAttribute("data-bs-target" , "#reviewDemo");
                   demoBtn1.setAttribute("data-bs-slide-to" , 0);
                   demoBtn1.setAttribute("class" , "active");
                   
                   var demoBtn2 = document.createElement("button");
                   demoBtn2.setAttribute("type" , "button");
                   demoBtn2.setAttribute("data-bs-target" , "#reviewDemo");
                   demoBtn2.setAttribute("data-bs-slide-to" , 1);				
                   
                   var demoBtn3 = document.createElement("button");
                   demoBtn3.setAttribute("type" , "button");
                   demoBtn3.setAttribute("data-bs-target" , "#reviewDemo");
                   demoBtn3.setAttribute("data-bs-slide-to" , 2);
                   
                   indicators.appendChild(demoBtn1);
                   indicators.appendChild(demoBtn2);
                   indicators.appendChild(demoBtn3);
                   
                   var inner = document.createElement("div");
                   inner.setAttribute("class", "carousel-inner");
                   reviewDemo.appendChild(inner);
                   
                   var cnt = 0;				
                   
                   for(reviewData of data.reviewList){					
                       
                       var item = document.createElement("div");
                       if(cnt == 0){
                           item.setAttribute("class", "carousel-item active");
                       }else{
                           item.setAttribute("class", "carousel-item");	
                       }					
                       inner.appendChild(item);
                       
                       var reviewView = document.createElement("div");
                       reviewView.setAttribute("class", "p-4 bg-secondary text-dark	 rounded");
                       item.appendChild(reviewView);
                       
                       var reviewTitle = document.createElement("h3");
                       reviewTitle.innerText = reviewData.reviewVo.review_title;
                       reviewView.appendChild(reviewTitle);
                       
                       var reviewContent = document.createElement("p");
                       reviewContent.setAttribute("style" , "color : #CCCCCC");
                       reviewContent.innerText = reviewData.reviewVo.review_content;
                       reviewView.appendChild(reviewContent);
                       
                       cnt++;
                   }
                   
               }
           }
           
           xmlhttp.open("get" , "./getLatestReview.do?course_no=" + course_no); 
           xmlhttp.send();	
       }
       
       
       function myStudentList() {
           var xmlhttp = new XMLHttpRequest();
           
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);
                   
                   var studentBox = document.getElementById("studentBox");
                   studentBox.innerHTML = "";
                   
                   for(studentData of data.studentList){
                       var listGroupBox = document.createElement("a");
                       listGroupBox.setAttribute("class", "list-group-item list-group-item-action d-flex gap-3 py-3");
                       studentBox.appendChild(listGroupBox);
                       
                       
                       var memberImage = document.createElement("img");
                       memberImage.setAttribute("src", "../resources/img/unknown.png");
                       memberImage.setAttribute("width", "32");
                       memberImage.setAttribute("height", "32");
                       memberImage.setAttribute("class", "rounded-circle flex-shrink-0");
                       
                       listGroupBox.appendChild(memberImage);
                       
                       var contentBox = document.createElement("div");
                       contentBox.setAttribute("class", "d-flex gap-2 w-100 justify-content-between");                       
                       
                       listGroupBox.appendChild(contentBox);
       
                       var contentMini = document.createElement("div");
                       contentBox.appendChild(contentMini);
                       
                       var memberName = document.createElement("h6");
                       memberName.setAttribute("style", "color:black;");
                       memberName.setAttribute("class", "mb-0");                      
                       memberName.innerText = studentData.studentVo.member_name + "님이 수강신청!";					
                       contentMini.appendChild(memberName);
                       
                       var lectureData = document.createElement("p");
                       lectureData.setAttribute("class", "mb-0 opacity-75");
                       lectureData.innerText = studentData.registVo.my_course_purchase_price + "포인트가 적립될 예정이에요!";
                       contentMini.appendChild(lectureData);
                       
                       
                       var whenTag = document.createElement("small");
                       whenTag.setAttribute("class", "opacity-50 text-nowrap");
                       
                       var today = new Date(studentData.registVo.my_course_date);

                       var year = today.getFullYear();
      	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
      	  	          var day = ('0' + today.getDate()).slice(-2);
      	  	          var hours = ('0' + today.getHours()).slice(-2); 
      	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
      	  	          var dateString = year + '-' + month  + '-' + day;
      	  	          var timeString = hours + '시' + minutes  + '분 갱신';

                       
                       
                       
                       whenTag.innerText = dateString;
                       contentBox.appendChild(whenTag);										
                   }
                   studentBoxShow();
               }
           }
           xmlhttp.open("get" , "./getSaleList.do?course_no=" + course_no);		
           xmlhttp.send();
       }
       
       function studentBoxShow(){   	  	
 			var toastElList = [].slice.call(document.querySelectorAll('.toast'))
 			var toastList = toastElList.map(function(toastEl) {
 			return new bootstrap.Toast(toastEl)
 			})
 			toastList.forEach(toast => toast.show()) 
 		}
       
       
       var modal = null;
       var cutmodal = null;
       var fixModal = null;
       
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
       
       function instantAnswer(btValue){    	
           var modali = document.getElementById('instantAnswer');
           var content =  document.getElementById('answerContent');
           content.innerHTML = "";

           
           var target = btValue.parentNode;
           var numId = target.getAttribute('id').replace("question","");

           var xmlhttp = new XMLHttpRequest();		                    
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var titleText = target.children[1].innerText;
                   var contentText = target.children[2].innerText;
                   
                   console.log(titleText);
                   console.log(contentText);
                   
                   var data = JSON.parse(xmlhttp.responseText);				
                   
                   var header = document.createElement("div");
                   header.setAttribute("class", "modal-header");
                   content.appendChild(header);
                   
                   var modalHeaderTitle = document.createElement("h4");
                   modalHeaderTitle.setAttribute("class" , "modal-title");
                   modalHeaderTitle.setAttribute("style" , "color : black");
                   modalHeaderTitle.innerText = titleText;				
                   header.appendChild(modalHeaderTitle);
                   
                   var modalCloseHead = document.createElement("button");
                   modalCloseHead.setAttribute("type", "button");
                   modalCloseHead.setAttribute("class", "btn-close");
                   modalCloseHead.setAttribute("data-bs-dismiss", "modal");
                   header.appendChild(modalCloseHead);                
       
                   var body = document.createElement("div");
                   body.setAttribute("class", "modal-body");
                   body.innerText = contentText;
                   content.appendChild(body);
                   
                   var answerTextBox = document.createElement("textarea");
                   answerTextBox.setAttribute("rows", "3");
                   answerTextBox.setAttribute("cols", "60");
                   answerTextBox.setAttribute("id", "instantWrite");
                   content.appendChild(answerTextBox);
       
                   
                   var footer = document.createElement("div");
                   footer.setAttribute("class", "modal-footer");
                   content.appendChild(footer);     
                   
                   var insertBtn = document.createElement("button");
                   insertBtn.setAttribute("class", "btn btn-outline-primary");
                   insertBtn.setAttribute("type", "button");
                   insertBtn.setAttribute("id", "insertAnswer");
                   insertBtn.setAttribute("onclick", "instantWriteAnswer("+ numId+")");
                   insertBtn.innerText = "등록";
       
                   footer.appendChild(insertBtn);
       
                   
                   cutmodal.show();
               }
           };
           xmlhttp.open("get" , "./getCourseParam.do?course_no=" + course_no); 
           xmlhttp.send();
       
       }
       
       function instantWriteAnswer(question_no){
           console.log(question_no);
           
           var writeBox = document.getElementById("instantWrite");
           var writeText = writeBox.value;
       
           var xmlhttp = new XMLHttpRequest();
           
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
                   var data = JSON.parse(xmlhttp.responseText);   
                   changeTabQuestion();
                   cutmodal.hide();
                   writeBox.value = "";

               }
           };
           
           xmlhttp.open("post" , "./writeAnswerProcess.do"); 
           xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
           xmlhttp.send("question_no=" + question_no + "&answer_content=" + writeText);
                   
           
       }
       
       function noticeDelete(rowNotice){
 	  		var target = rowNotice.parentNode;
 	  		var titleText = target.children[1].innerText;
 	  		var numId = target.getAttribute('id').replace("notice","");		

 	  		var alterBox = document.getElementById("cloneAlter");
 	  		alterBox.setAttribute("class", "alert alert-danger d-flex align-items-center");
 	
 	  		var s1 = alterBox.getElementsByClassName("dangerText")[0];
 	  		var s2 = alterBox.getElementsByClassName("dangerBtn")[0];
 	  		
 	  		var textBox = document.createElement("div");
 	  		
 	  		s1.appendChild(textBox);

 	  		var noticeTitle = document.createElement("mark");
 	  		noticeTitle.innerText = titleText;
 	  		s1.appendChild(noticeTitle);
 	  		
 	  		var vv = document.createElement("p");		
 	  		vv.innerText = "공지사항을 삭제하시겠습니까? ※삭제한 공지사항은 복구할 수 없습니다."
 	  		s1.appendChild(vv);
 	  		
 	  		var executeBtn = document.createElement("button");
 	  		executeBtn.setAttribute("class", "btn btn-outline-danger");
 	  		executeBtn.setAttribute("onclick", "deleteNotice(" + numId + ")");
 	  		executeBtn.innerText ="확인";
 	  		s2.appendChild(executeBtn);
 	  		
 	  		var cancleBtn = document.createElement("button");
 	  		cancleBtn.setAttribute("class", "btn btn-outline-danger");
 	  		cancleBtn.setAttribute("onclick", "deleteCancel()");
 	  		cancleBtn.innerText ="취소";
 	  		s2.appendChild(cancleBtn);
 	  	}
 	
 	  	function deleteNotice(numId){	  		
 	  		var xmlhttp = new XMLHttpRequest();
 	  		
 	  		xmlhttp.onreadystatechange = function(){
 	  			if(xmlhttp.readyState==4 && xmlhttp.status==200){	  				
 					var data = JSON.parse(xmlhttp.responseText);

 	  				var alterBox = document.getElementById("cloneAlter");
 	  				alterBox.setAttribute("class", "alert alert-danger d-flex align-items-center d-none");
 	
 	  				changeTabNotice();
 	  			}
 	  		};
 	  		
 	  		xmlhttp.open("get" , "./deleteNoticeProcess.do?notice_no=" + numId); 
 	  		xmlhttp.send();		
 	  	}
 	  	
 	  	function updateCourse() {
 			var updateDate = document.getElementById("updateDate"); //접근 핵심...
 			
 			var title = document.getElementById("updateTitle");
 			var tutorial = document.getElementById("tutorial");
 			
 			updateDate.submit();
 		}
       
       
       function thisCourseStudentList(){          
           var studentBox = document.getElementById("studentListBox");
           var xxx = document.getElementById("studentCardTemp");
         	  
           var xmlhttp = new XMLHttpRequest();
           
           studentBox.innerHTML = "";
           
           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
 					var data = JSON.parse(xmlhttp.responseText);
 					
 					var profile = [];
 					var num = 1;
 					
 					for(studentData of data.studentList){ 						
 						profile.push(num + ".jpg");
 						num++;
 						if(num > 20){
 							num = 1;
 						}
 					}
 					num = 0;
 					for(studentData of data.studentList){
 						var newCard = xxx.cloneNode(true);
 						newCard.setAttribute("class" , "card float-start m-2 p-2");					
 						newCard.removeAttribute("id");
 						
 						var s1 = newCard.getElementsByClassName("s1")[0]; 						
 						s1.setAttribute("src", "../resources/img/profile/" + profile[num]);
 						
 						var s2 = newCard.getElementsByClassName("s2")[0];
 						s2.setAttribute("style", "color:black;");
 						s2.innerText = studentData.studentVo.member_name;
 						
 						var s3 = newCard.getElementsByClassName("s3")[0];
 						
 						
                        var today = new Date(studentData.registVo.my_course_date);

                        var year = today.getFullYear();
                        var non = year.toString();
                        console.log("non" + non);
						var reg = non.substring(2, 4);

       	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
       	  	          var day = ('0' + today.getDate()).slice(-2);
       	  	          var hours = ('0' + today.getHours()).slice(-2); 
       	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
       	  	          var dateString = "ADD" + reg + month + day;
       	  	          var timeString = hours + '시' + minutes  + '분 갱신';
 						
 						var regDate = dateString;
 						s3.innerText = regDate;						
 						
 						studentBox.appendChild(newCard);
 						num++;
 					}
                   
               }
           };
           
           xmlhttp.open("get" , "./getStudentList.do?course_no=" + course_no); 
           xmlhttp.send();

           
       }

 	function getCourseRate(){
 		
         var xmlhttp = new XMLHttpRequest();

         xmlhttp.onreadystatechange = function(){
             if(xmlhttp.readyState==4 && xmlhttp.status==200){
 				var data = JSON.parse(xmlhttp.responseText);                    
 				var rate = document.getElementById("courseRate");
 				
 				rate.innerText = "평점 : " + data; 				
             }
         };
         
         xmlhttp.open("get" , "./courseRateAVG.do?course_no=" + course_no); 
         xmlhttp.send();

 	}
 	
 	function courseFix(){		
 		fixModal.show();
 	}
       function init(){
     	  thisCourseStudentList();
           
           getLatestReview();
           changeTabNotice();
           changeTabLecture();
           changeTabReview();
           changeTabQuestion();
           
           updatelectureViewCard();
           updateStudentListBox();          
           UpdateLectureStudentChart();
           UpdateCourseSalesChart();

           getCourseRate();
       }
       
       window.addEventListener("DOMContentLoaded" , init);
       window.addEventListener('DOMContentLoaded' , function(){
           modal = new bootstrap.Modal(document.getElementById('courseModal'));
           cutmodal = new bootstrap.Modal(document.getElementById('instantAnswer'));
           fixModal = new bootstrap.Modal(document.getElementById('fixModal'));          
       });
       
       
       function UpdateLectureStudentChart(){	
     	  
     	  
           var xmlhttp = new XMLHttpRequest();

           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
 				var data = JSON.parse(xmlhttp.responseText);
 /*				
 				var lectureStudentChart = document.getElementById("lectureStudentChart");
 				lectureStudentChart.setAttribute("class" , "card mb-4");
 				
 		      	var studentBox = document.getElementById("sutdentListGroup");
 		      	studentBox.setAttribute("class" , "d-none");
 		      	
 		    	var CourseSalesChart = document.getElementById("CourseSalesChart");
 		    	CourseSalesChart.setAttribute("class" , "card mb-4 d-none");

 		    	var lectureViewCard = document.getElementById("lectureViewCard");
 		    	lectureViewCard.setAttribute("class" , "card mb-4 d-none");
*/ 		    	
 		    	var lectureSales = document.getElementById("lectureSalesBest");
				var lectureSalesNum = document.getElementById("salesCount");
 		    	
 		    	lectureSales.innerHTML = ""
 		    	
				lectureSales.innerText = data.chart.lectureSalesRank[0].course_name;
 		    	lectureSalesNum.innerText = data.chart.lectureSalesRank[0].count + "P";

   				
   		    	
 	  	          var today = new Date();   
 	
 	  	          var year = today.getFullYear();
 	  	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
 	  	          var day = ('0' + today.getDate()).slice(-2);
 	  	          var hours = ('0' + today.getHours()).slice(-2); 
 	  	          var minutes = ('0' + today.getMinutes()).slice(-2);
 	  	          var dateString = year + '-' + month  + '-' + day;
 	  	          var timeString = hours + '시' + minutes  + '분 갱신';
 	
 	  	          
 	  	          chartData = document.getElementsByClassName('updateChartData');
 	  	          for(i = 0; i < chartData.length; i++){ 	  	        	  
 	  	        	  chartData[i].innerText = dateString + " | " + timeString;
 	  	          }
   	          
 	  	          
 	  	          var labelData = [];
 	  	          var datadata = [];
 	  	          var sum = 0;
 	  	          
 	  	          for(x of data.chart.lectureSalesRank){
                    
                        labelData.push(x.course_name);
 	  	        	    datadata.push(x.count);
                    
 	  	        	
 	  	        	
 	  	        	if(sum < x.count){
 	  	        		sum = x.count;
 	  	        	}
 	  	          }
 	  	          
   	          	//그래프 draw
 	              Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 	              Chart.defaults.global.defaultFontColor = '#292b2c';

 	              var ctx = document.getElementById("studentChart");
 	              var myLineChart = new Chart(ctx, {
 	              type: 'bar',
 	              data: {
 	                  labels: labelData,
 	                  datasets: [{
 	                  label: "판매수",
 	                  backgroundColor: "rgba(2,117,216,1)",
 	                  borderColor: "rgba(2,117,216,1)",
 	                  data: datadata,
 	                  }],
 	              },
 	              options: {
 	                  scales: {
 	                  xAxes: [{
 	                      time: {unit: 'month'},
 	                      gridLines: {
 	                      display: false
 	                      },
 	                      ticks: {
 	                      maxTicksLimit: 6
 	                      }
 	                  }],
 	                  yAxes: [{
 	                      ticks: {
 	                      min: 0,
 	                      max: sum * 1.2,
 	                      maxTicksLimit: 5
 	                      },
 	                      gridLines: {display: true}
 	                  }],
 	                  },
 	                  legend: {display: false}}
 	              }); 	          
   		    	
               }
           };
           
           xmlhttp.open("get" , "./upChart.do?course_no=" + course_no); 
           xmlhttp.send();      
       }
       
       function UpdateCourseSalesChart(){	
     	  
           var xmlhttp = new XMLHttpRequest();

           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
 				var data = JSON.parse(xmlhttp.responseText);
/*
 			var lectureStudentChart = document.getElementById("lectureStudentChart");
 			lectureStudentChart.setAttribute("class" , "card mb-4 d-none");
 			
 	      	var studentBox = document.getElementById("sutdentListGroup");
 	      	studentBox.setAttribute("class" , "d-none");
 	      	
 	    	var CourseSalesChart = document.getElementById("CourseSalesChart");
 	    	CourseSalesChart.setAttribute("class" , "card mb-4 ");

 	    	var lectureViewCard = document.getElementById("lectureViewCard");
 	    	lectureViewCard.setAttribute("class" , "card mb-4 d-none");
*/ 	    	
 	    	var courseSalesSum = document.getElementById("courseSalesSum"); 	    	
 	    	
			courseSalesSum.innerText = data.chart.courseSales;
 	    	

 	    	
 	        var today = new Date();   
 	
 	        var year = today.getFullYear();
 	        var month = ('0' + (today.getMonth() + 1)).slice(-2);
 	        var day = ('0' + today.getDate()).slice(-2);
 	        var hours = ('0' + today.getHours()).slice(-2); 
 	        var minutes = ('0' + today.getMinutes()).slice(-2);
 	        var dateString = year + '-' + month  + '-' + day;
 	        var timeString = hours + '시' + minutes  + '분 갱신';
 	
 	        
 	        chartData = document.getElementsByClassName('updateChartData');
 	        for(i = 1; i < chartData.length; i++){
 	      	  chartData[i].innerText = dateString + " | " + timeString;
 	        }
 	        
 	          var labelData = [];
   	          var datadata = [];

   	          var sum = parseInt(0);
   	          var i = 0;
   	          for(x of data.chart.getLectureSaleBank){
   	        	if(i%5 == 0){
                    labelData.push(i);
   	        	    datadata.push(sum);
                   }
                i += 1;
                sum += x.count;
                if(i == data.chart.getLectureSaleBank.length){
                	labelData.push(i);
   	        	    datadata.push(sum);
                }
   	          }

 	        
 	           Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 	           Chart.defaults.global.defaultFontColor = '#292b2c';
 	           var ctx = document.getElementById("courseSalesChart");
 	           var myLineChart = new Chart(ctx, {
 	           type: 'line',
 	           data: {
 	               labels: labelData,
 	               datasets: [{
 	               label: "포인트",
 	               lineTension: 0.3,
 	               backgroundColor: "rgba(17,216,83,0.1)",
 	               borderColor: "rgba(17,216,83,0.8)",
 	               pointRadius: 5,
 	               pointBackgroundColor: "rgba(17,216,83,1)",
 	               pointBorderColor: "rgba(255,255,255,0.8)",
 	               pointHoverRadius: 5,
 	               pointHoverBackgroundColor: "rgba(2,117,216,1)",
 	               pointHitRadius: 50,
 	               pointBorderWidth: 2,
 	               data: datadata,
 	               }],
 	           },
 	           options: {
 	               scales: {
 	               xAxes: [{
 	                   time: {unit: 'date'},
 	                   gridLines: {display: false},
 	                   ticks: {maxTicksLimit: 7},
 	                  x: {
	                       stacked: true
	                   }
 	               }],
 	               yAxes: [{
 	                   ticks: {min: 0,max: sum*1.2, maxTicksLimit: 5},
 	                   gridLines: {color: "rgba(0, 0, 0, .125)",},
 	                    	               }],},
 	               legend: {display: false}}});

 	        
               }
           };
           
           xmlhttp.open("get" , "./upChart.do?course_no=" + course_no); 
           xmlhttp.send();      


     }

       
       
       function updateStudentListBox(){
	         var xmlhttp = new XMLHttpRequest();

 	         xmlhttp.onreadystatechange = function(){
 	             if(xmlhttp.readyState==4 && xmlhttp.status==200){
 	 				var data = JSON.parse(xmlhttp.responseText);                    

    	   
/*  	   
    	   var lectureStudentChart = document.getElementById("lectureStudentChart");
 	   	 	lectureStudentChart.setAttribute("class" , "card mb-4 d-none");
 	    	var CourseSalesChart = document.getElementById("CourseSalesChart");
 	    	CourseSalesChart.setAttribute("class" , "card mb-4 d-none");
 	    	var studentBox = document.getElementById("sutdentListGroup");
 	    	studentBox.setAttribute("class" , "card mb-4");
 	    	var lectureViewCard = document.getElementById("lectureViewCard");
 	    	lectureViewCard.setAttribute("class" , "card mb-4 d-none");

 	    	
 	    	var studentList = document.getElementById("updateStudentListStatistics");;
 	    	studentList.innerHTML = "";
*/
 	    	
			var countStudent = document.getElementById("countStudent");
			countStudent.innerText = data.chart.courseStudentNum;
			
 	    	
 	          var today = new Date();
 	          var year = today.getFullYear();
 	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
 	          var day = ('0' + today.getDate()).slice(-2);
 	          var hours = ('0' + today.getHours()).slice(-2); 
 	          var minutes = ('0' + today.getMinutes()).slice(-2);
 	          var dateString = year + '-' + month  + '-' + day;
 	          var timeString = hours + '시' + minutes  + '분 갱신';

 	          chartData = document.getElementsByClassName('updateChartData');
 	          for(i = 1; i < chartData.length; i++){
 	        	  chartData[i].innerText = dateString + " | " + timeString;
 	          }
 	
 	    	thisCourseStudentList();
 	    	
 	             }
 	         };
 	         
 	         xmlhttp.open("get" , "./upChart.do?course_no=" + course_no); 
 	         xmlhttp.send();

       }
       
       function updatelectureViewCard(){
     	  
           var xmlhttp = new XMLHttpRequest();

           xmlhttp.onreadystatechange = function(){
               if(xmlhttp.readyState==4 && xmlhttp.status==200){
 				var data = JSON.parse(xmlhttp.responseText);
/*
 	   	  	var lectureStudentChart = document.getElementById("lectureStudentChart");
 	   		 lectureStudentChart.setAttribute("class" , "card mb-4 d-none");
 	    	
 	    	var CourseSalesChart = document.getElementById("CourseSalesChart");
 	    	CourseSalesChart.setAttribute("class" , "card mb-4 d-none");
 			
 	    	var studentBox = document.getElementById("sutdentListGroup");
 	    	studentBox.setAttribute("class" , "card mb-4 d-none");
 	    	
 	    	var lectureViewCard = document.getElementById("lectureViewCard");
 	    	lectureViewCard.setAttribute("class" , "card mb-4");
*/ 	    	
 	    	var lectureVolume = document.getElementById("lectureVolumeBest");
 	    	var lectureVolumeNum = document.getElementById("volumeCount");
 	    	
 	    	lectureVolume.innerHTML = ""
 	    	
			lectureVolume.innerText = data.chart.lectureVolumeRank[0].course_name;
 	    	lectureVolumeNum.innerText = data.chart.lectureVolumeRank[0].count + "회";
 	    	
 	    	
 	    	

 	    	
 	          var today = new Date();
 	          var year = today.getFullYear();
 	          var month = ('0' + (today.getMonth() + 1)).slice(-2);
 	          var day = ('0' + today.getDate()).slice(-2);
 	          var hours = ('0' + today.getHours()).slice(-2); 
 	          var minutes = ('0' + today.getMinutes()).slice(-2);
 	          var dateString = year + '-' + month  + '-' + day;
 	          var timeString = hours + '시' + minutes  + '분 갱신';

 	          chartData = document.getElementsByClassName('updateChartData');
 	          for(i = 1; i < chartData.length; i++){
 	        	  chartData[i].innerText = dateString + " | " + timeString;
 	          }
 	          
   	          var labelData = [];
   	          var datadata = [];
				var sum  = 0;
   	          for(x of data.chart.lectureVolumeRank){
   	        	labelData.push(x.course_name);
   	        	datadata.push(x.count);	        	  	        	  
   	        	if(sum < x.count){
	  	        		console.log("sum갱신" + sum);
	  	        		sum = x.count;
	  	        	}
   	          }


                 

 	          
 		        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 		        Chart.defaults.global.defaultFontColor = '#292b2c';
 		
 		        var ctx = document.getElementById("lectureViewChart");
 		        var lectureViewChart = new Chart(ctx, {
 		        type: 'bar',
 		        data: {
 		            labels: labelData,
 		            datasets: [{
 		            label: "판매수",
 		            backgroundColor: "rgba(54,185,204,1)",
 		            borderColor: "rgba(54,185,204,1)",
 		            data: datadata,
 		            }],
 		        },
 		        options: {
 		            scales: {
 		            xAxes: [{
 		                time: {unit: 'month'},
 		                gridLines: {
 		                display: false
 		                },
 		                ticks: {
 		                maxTicksLimit: 6
 		                }
 		            }],
 		            yAxes: [{
 		                ticks: {
 		                min: 0,
 		                max: Math.floor(sum * 1.5),
 		                maxTicksLimit: 5
 		                },
 		                gridLines: {display: true}
 		            }],
 		            },
 		            legend: {display: false}}
 		        });              }
           };
           
           xmlhttp.open("get" , "./upChart.do?course_no=" + course_no); 
           xmlhttp.send();
     }


       </script>
       
       
   </head>
   
   
       
   <body>
   <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">   
       <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id = "header">
           <div class="container">
               <a class="navbar-brand" href="">
					 
               </a>				
               <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                   <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                       <li class="nav-item"><a class="nav-link h4 text-dark" id = "studentLogBtn">학생기록</a></li>                       
                   </ul>
               </div>
           </div>
       </nav>	       
	</div>
	<!-- 여기부터 시작 -->
		<header class="container " style ="margin-top : 20px;">
			<div class ="row">
				<div class = "card col-3 bg-lightgray">
					<div class = "card-body" style = "text-align:center;">
						<img class="img-fluid rounded-circle mb-4" src="../resources/img/00000.jpg" alt="..." / height="150" width="150">
	                   <div class="font-weight-bold">${data.courseVo.course_name}</div>
	                   <p class="mb-0">${sessionUser.member_name}</p>                   					
					</div>
				</div>
				<div class = "card col-9">
					<div class = "card-body">
						<div class="row">
						<div class ="col-8">
							<p class = "text-gray" >${categoryName.BIG_CATEGORY_NAME} > ${categoryName.SMALL_CATEGORY_NAME}</p>
							<div class = "font-weight-middle" style = "margin-top : 10px;">${data.courseVo.course_tuto}</div>
						</div>
						<div class ="col-2 border-left-gray" style = "height : 165px; text-align:center; vertical-align: middle;" >
							<div class ="btn btn-outline-secondary"  id = "studentLogBtn" onclick = "myStudentList()">
								학생기록
				           </div>
				           <div onclick = "location.href='#sutdentListGroup'"
				            class ="btn btn-outline-secondary" style="margin-top: 7px">
								학생목록
				           </div>
						</div>
						<div class ="col-2 border-left-gray" style = "height : 165px; text-align:center; vertical-align: middle;" >
							<div onclick = "location.href='courseNoticeWritePage.do?course_no=${data.courseVo.course_no}'"
				            class ="btn btn-outline-secondary">
								공지사항
				           </div>
				           <div onclick = "location.href='./addLecturePage.do?course_no=${data.courseVo.course_no }'"
				            class ="btn btn-outline-secondary" style="margin-top: 7px">
								강좌추가
				           </div>
						</div>
						</div>
					</div>
					<div class = "card-fotter p-2 border-top-lightgray row">
						<div class="h4 text-dark"  id = "courseRate" style = "font-family:Oswald-Bold.ttf; font-weight : bold; width:50%"></div>		
						<div class="h4 text-gray font-weight-middle" onclick = "courseFix()" style = "text-decoration : none;  width:50%; text-align:right;">강의편집</div>                   		
					</div>
				</div>
				<div class="toast" style = "position:absolute; float:right; width : 400px; right:5%; z-index :8;">
					<div class="toast-body">
						<div id = "studentBox"></div>
					</div>
				</div>
			</div>
						
		</header>
		<section class="container border-top-lightgray" style = "margin-top:50px; padding-top : 20px;">
			<div class="row">
				<div class = "col-3">				
					<div class="card mb-4 border-left-gray shadow" style="margin-top:20px;">
					    <div class="card-body" id = "updateStudentListStatistics">
							<div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold mb-1">학생 수</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray" id = "countStudent"></div>
                                </div>
                                <div class="col-auto">
                                    	명
                                </div>
                            </div>					    
					    </div>
					</div>
				</div>
				<div class = "col-3">
					<div class="card mb-4 border-left-green shadow" style="margin-top :20px;"  onclick = "UpdateCourseSalesChart()">        
					    <div class="card-body">
					        <div class="row no-gutters align-items-center">
					            <div class="col mr-2">
					                <div class="text-xs font-weight-bold mb-1">누적 판매량</div>
					                <div class="h5 mb-0 font-weight-bold text-gray" id = "courseSalesSum"></div>
					            </div>
					            <div class="col-auto">P</div>
					        </div>
					    </div>
					</div>
				</div>
				<div class = "col-3">
					<div class="card mb-4 border-left-info shadow" style="margin-top :20px;"  onclick = "updatelectureViewCard()">           
					    <div class="card-body">
					        <div class="row no-gutters align-items-center">
					            <div class="col mr-2">
					                <div class="text-xs font-weight-bold mb-1">가장 많이 들은 강의</div>
					                <div class="mb-0 font-weight-bold text-gray" id = "lectureVolumeBest"></div>
					            </div>
					            <div class="col-auto" id = "volumeCount">회</div>
					        </div>
					    </div>
					</div>
				</div>
				<div class = "col-3">
				    <div class="card mb-4 border-left-primary shadow" style="margin-top :20px;"  onclick = "UpdateLectureStudentChart()">    
					    <div class="card-body">
					        <div class="row no-gutters align-items-center">
					            <div class="col mr-2">
					                <div class="text-xs font-weight-bold mb-1">가장 수익 높은 강의</div>
					                <div class="mb-0 font-weight-bold text-gray" id = "lectureSalesBest"></div>
					            </div>
					            <div class="col-auto" id = "salesCount">P</div>
					        </div>					    
					    </div>
					</div>
				</div>
			</div>            	
				<div class="row">
					<div class="card mb-4 me-1" id = "CourseSalesChart" style = "width : 33%;">
						<div class="card-header">강의 수익</div>
						<div class="card-body"><canvas id="courseSalesChart" width="100%" height="50"></canvas></div>
						<div class="card-footer small text-muted updateChartData">Updated today at 11:59 PM</div>
					</div>	                	
						                	
					<div class="card mb-4 me-1" id = "lectureViewCard"  style = "width : 33%;">
						<div class="card-header">강좌별 시청 횟수</div>
						<div class="card-body"><canvas id="lectureViewChart" width="100%" height="50"></canvas></div>
						<div class="card-footer small text-muted updateChartData">Updated today at 11:59 PM</div>
					</div>
					
					<div class="card mb-4 me-1"  id = "lectureStudentChart" style = "width : 33%;">
						<div class="card-header">강좌별 수익</div>
						<div class="card-body"><canvas id="studentChart" width="100%" height="51"></canvas></div>
						<div class="card-footer small text-muted updateChartData">Updated today at 11:59 PM</div>
					</div>
				</div>	                       
       </section>
       
       <div class = "d-none">       
      		<button type="button" class="btn btn-outline-secondary" id="modalBtn" onclick = "introModal()">강좌 개요</button>
           <a href = "reviewWritePage.do?course_no=${data.courseVo.course_no}">
               <button class="btn btn-primary" type="button">테스트 후기 만들기</button>
           </a>           	
           <a href = "questionWritePage.do?course_no=${data.courseVo.course_no}">
               <button class="btn btn-primary" type="button">테스트 질문 작성하기</button>
           </a>	
       </div>
       <section>                      		
           <div class="row justify-content-center container border-top-lightgray" style = "margin:auto; margin-top:40px; padding-top : 30px;">           
				<div class = "row bg-lightgray" style="margin-top:20px;">					
					<div class = "col-5">
						<div id="noticeList">
					        <div id = "noticeTable"></div>
					    </div>
						<div id="Lecture">					    
					        <div id = "lectureTable"></div>			
					    </div>						
						<div id="Review">
					    	<div id = "reviewTable"></div>
					    </div>
					</div>				
					<div class = "col-7 border">
						<div id="Qna">
						    <div id="questionTable" style="font-size:14px;"></div>						    
					    </div>					
					</div>					
			</div>               
           </div>
       </section>
       
       <div class="container border-top-lightgray" style = "margin-top : 50px; padding : 30px;">
			<div class="card mb-4" id = "sutdentListGroup">
				<div class="card-header"><i class="fas fa-chart-bar me-1"></i>수강 중인 학생</div>
				<div class="card-body"><div id="studentListBox" style = "text-align:center;"></div></div>
				<div class="card-footer small text-muted updateChartData">Updated today at 11:59 PM</div>
			</div>
       </div>
       		<div id="reviewDemo" class="carousel slide d-none" data-bs-ride="carousel"></div>
       
       <!-- Footer-->
       <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">      		
	       <footer class="py-5 bg-dark">
	           <div class="container"><p class="m-0 text-center text-white">Alang &copy; JuanAng 2021</p>	           		
	           </div>
	       </footer>	       	       
		</div>



	<!-- 여기부터는 클론 용 담기 -->
        <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content" id = "introContent">
	            </div>
	        </div>
        </div>
        
    
		<div class="card d-none" id = "studentCardTemp"style="width:159px">
			<img class="card-img-top s1" src="../bootstrap4/img_avatar1.png" alt="Card image" style="width :141px; height:141px;">
		    <div class="card-body">
				<h4 class="h4 card-title s2">노진호</h4>
				<p class="h5 card-text s3">2021-11-25 등록</p>								
			</div>
		</div>
		
		<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
		  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
		    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
		  </symbol>
		</svg>
		
		<div class="alert alert-danger d-flex align-items-center d-none" role="alert" id = "deleteAlter">
		  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		  <div class = "dangerText col-10">		  	
		  </div>
		  <div class = "dangerBtn col-2 btn-group pe-5">		  
		  </div>
		</div>
		
		<div class="modal" id="fixModal" data-bs-backdrop = "false">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title text-dark">강의 수정하기</h4>
		      </div>
		      <div class="modal-body">
				<form id="updateDate" action="updateCoursePage.do" method="post" enctype="multipart/form-data">
					<input type = "hidden" value=' ${data.courseVo.course_no}' name = "course_no">
			      	<div class="input-group mb-3">
			          <input type="file" class="form-control" 
			          multiple accept="image/*" name = "files">
			        </div>
			      	<div class="input-group mb-3">
			          <span class="input-group-text" id="inputGroup-sizing-default">강의제목</span>
			          <input type="text" class="form-control" aria-label="Sizing example input" name = "course_name"
			          id = "updateTitle"aria-describedby="inputGroup-sizing-default" value = '${data.courseVo.course_name}'>
			        </div>
					<div class="mb-3 mt-3">
			          <label for="tutorial">강의 개요</label>
			          <textarea class="form-control" rows="5" id="tutorial" name ="course_tuto">${data.courseVo.course_tuto}</textarea>
			        </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-success" onclick="updateCourse()">수정완료</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">수정취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="instantAnswer" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
		    <div class="modal-dialog"><div class="modal-content" id = "answerContent"></div></div>
	    </div>
	    

		
	

    </body>
</html>

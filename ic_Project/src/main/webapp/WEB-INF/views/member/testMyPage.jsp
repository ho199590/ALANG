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
        <title>강사기준 마이페이지</title>
        <link href="../resources/myPage/css/styles.css" rel="stylesheet" />
        <script src="../resources/myPage/js/simple-datatables.js"></script>
        <script src="../resources/myPage/js/datatables-simple-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <!--폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <style>
            .border-left-info {border-left: 0.25rem solid #36b9cc !important;}
            .font-weight-bold {font-weight: 700 !important;}        
            .text-gray {color: #6e707e !important;}
            body {font-family: 'Noto Sans KR', sans-serif;}
            .card-body2 {flex: 1 1 auto;}
			.border-top-lightgray {border-top: 0.25rem solid #DADADA !important;}
			.bg-lightgray{background-color :#F5F5F5;}
			.bg-gradient-success {background-color: #5ddbad;background-image: linear-gradient(180deg, #5ddbad 10%, #4d947a 100%);background-size: cover;}
    		.bg-gradient-info {background-color: #36b9cc;background-image: linear-gradient(180deg, #36b9cc 10%, #5c97a1 100%);background-size: cover;}
			.bg-gradient-infon {background-color: #36b9cc;background-image: linear-gradient(180deg, #90d7e1 10%, #73a3ab 100%);background-size: cover;}
    		
         </style>
        
        <script>
	        var member_no = ${sessionUser.member_no};
	        
	        function myCourseList(){
	    		var xmlhttp = new XMLHttpRequest();	    		
	    		var headLenght = 30;
	    		var bodyLenght = 45;	    		
	    		xmlhttp.onreadystatechange = function(){
	    			if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var data = JSON.parse(xmlhttp.responseText);
	                    
	                    var courseListBox = document.getElementById("courseListBox");
	                    courseListBox.innerHTML = "";
	                    
						var thumnail = [];
						var num = 1;
						
						for(courseData of data.courseList){ 						
							thumnail.push(num + ".png");
							num++;
							if(num > 10){
								num = 1;
							}
						}
						num = 0;

	                    for(courseData of data.courseList){
		                    var xxx = document.getElementById("course_card");   
		                    var course_card = xxx.cloneNode(true);
		                    course_card.setAttribute("id" , "cloneAlter");
		                    course_card.setAttribute("class" , "row m-1");
		                    
	 						var course_name = course_card.getElementsByClassName("course_name")[0];
	 						var nameText = courseData.courseVo.course_name;
	 						if(nameText.length > headLenght){
	 							nameText = nameText.substr(0, 28) + "...";
	 						}
	 						course_name.innerText = nameText;
	 						
	 						var lecture_image = course_card.getElementsByClassName("lecture_image")[0];
	 						lecture_image.setAttribute("style", "background: url(../resources/img/Thumnail/" + thumnail[num] + "); background-position: center; background-size: cover;")

	 						var countLecture = course_card.getElementsByClassName("lectureCount")[0];
	 						countLecture.innerText = "총" + courseData.countLecture + "강";
	 						
	 						var courseSales = course_card.getElementsByClassName("courseSales")[0];
	 						courseSales.innerText = courseData.courseSales + "P";	 					
	 						
	 						var studentCount = course_card.getElementsByClassName("studentCount")[0];
	 						studentCount.innerText = "수강생 "+ courseData.countSutdent;
	 						
	 						var course_tuto = course_card.getElementsByClassName("course_tuto")[0];
	 						var tutoText = courseData.courseVo.course_tuto;	 						
	 						if(tutoText.length > bodyLenght){
	 							tutoText = tutoText.substr(0, bodyLenght-2) + "...";
	 						}

	 						course_tuto.innerText = tutoText;
	 						
	 						var link = course_card.getElementsByClassName("btn-block")[0];
	 						link.setAttribute("href" , "../course/courseManagePage.do?course_no=" + courseData.courseVo.course_no);
		                    
	 						courseListBox.appendChild(course_card);	
							 num++;
	                    }
	                    	
	                    chartDate = document.getElementsByClassName('card-footer');
	                    chartDate[0].innerText = "총 " + data.courseList.length +"개의 강의"
	    			}
	    		};
	    		
	    		xmlhttp.open("get" , "./getCourseList.do?member_no=" + member_no); 
	    		xmlhttp.send();
	        }
	        
	        function getDBTable(){
	            var length = 40;
	    		var xmlhttp = new XMLHttpRequest();	    		
	    	
	    		xmlhttp.onreadystatechange = function(){
	    			if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var data = JSON.parse(xmlhttp.responseText);
	                    var body = document.getElementById("myQuestionList");
	                    var cnt = 0;
	                    var size = data.getMyQuestionList.length;

	                    for(questionData of data.getMyQuestionList){
	                    	var tr = document.createElement("tr");
	                    	body.appendChild(tr);
	                    	
	                    	var numTd = document.createElement("td");	                           
							numTd.innerText = size - cnt;
							tr.appendChild(numTd);
							
							var courseTd = document.createElement("td");
							courseTd.innerText =  questionData.courseVo.course_name;
							tr.appendChild(courseTd);

							var questionTd = document.createElement("td");
							questionTd.innerText = questionData.questionVo.question_name;
							tr.appendChild(questionTd);
	
							var contentTd = document.createElement("td");
							tr.appendChild(contentTd);
	
							var writeDate = document.createElement("td");
							var today = new Date(questionData.questionVo.question_date);							
							var year = today.getFullYear();
	          	  	        var month = ('0' + (today.getMonth() + 1)).slice(-2);
	          	  	        var day = ('0' + today.getDate()).slice(-2);	          	  	          
	          	  	        var dateString = year + '-' + month  + '-' + day;
							
	          	  	    	writeDate.innerText = dateString;
	          	  	        
							tr.appendChild(writeDate);
	                    }
	                    
	    			}
	    		};
	    		
	    		xmlhttp.open("get" , "./getTableListData.do?member_no=" + member_no); 
	    		xmlhttp.send();
		        

	        }
	        
	        function getMyCourseSales() {
	    		var xmlhttp = new XMLHttpRequest();	    		
		    	
	    		xmlhttp.onreadystatechange = function(){
	    			if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var data = JSON.parse(xmlhttp.responseText);

		   	  	          var labelData = [];
		 	  	          var datadata = [];
		 	  	          var sum = 0;
		 	  	          for(x of data.getMyCourseSales.saleGraphList){
		 	  	        	labelData.push(x.course_name);
		 	  	        	datadata.push(x.count);
		 	  	        	if(sum < x.count){
		 	  	        		sum = x.count;
		 	  	        	}
		 	  	          }
 
	                    
	                    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	                    Chart.defaults.global.defaultFontColor = '#292b2c';
	                    var ctx = document.getElementById("myCourseSalesChart");
	                    var myLineChart = new Chart(ctx, {
	                    type: 'line',
	                    data: {
	                        labels: labelData,
	                        datasets: [{
	                        label: "포인트",
	                        lineTension: 0.3,
	                        backgroundColor: "rgba(2,117,216,0.2)",
	                        borderColor: "rgba(2,117,216,1)",
	                        pointRadius: 5,
	                        pointBackgroundColor: "rgba(2,117,216,1)",
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
	                            ticks: {maxTicksLimit: 7}
	                        }],
	                        yAxes: [{
	                            ticks: {min: 0,max: sum*1.2,maxTicksLimit: 5},
	                            gridLines: {color: "rgba(0, 0, 0, .125)",}
	                        }],},
	                        legend: {display: false}}});

	    			
	                    }	    			
	    		};
	    		
	    		xmlhttp.open("get" , "./getGraphyData.do?member_no=" + member_no); 
	    		xmlhttp.send();			        
			}
	        
	        function myCategoryChart(){
	    		var xmlhttp = new XMLHttpRequest();	    		
	    	
	    		xmlhttp.onreadystatechange = function(){
	    			if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var data = JSON.parse(xmlhttp.responseText);
						
	                    	                    
		   	  	          var labelData = [];
		 	  	          var datadata = [];


		 	  	          for(x of data.getMyCourseSales.categoryGraph){
			 	  	        	labelData.push(x.course_name);
			 	  	        	datadata.push(x.count);
			 	  	          }
		 	  	          
		 	  	       var colors = [];
			 	  	    while (colors.length < datadata.length) {
			 	  	        do {
			 	  	            var color = Math.floor((Math.random()*1000000)+1);
			 	  	        } while (colors.indexOf(color) >= 0);
			 	  	        colors.push("#" + ("000000" + color.toString(16)).slice(-6));
			 	  	    }
			 	  	    
			 	  	    


		 	  	       Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			 	  	    Chart.defaults.global.defaultFontColor = '#292b2c';
	
			 	  	    // Pie Chart Example
			 	  	    var ctx = document.getElementById("myPieChart");
			 	  	    var myPieChart = new Chart(ctx, {
			 	  	      type: 'pie',
			 	  	      data: {
			 	  	        labels: labelData,
			 	  	        datasets: [{
			 	  	          data: datadata,
			 	  	          backgroundColor: colors,
			 	  	        }],
			 	  	      },
			 	  	    });
	                    	                    
	    			}
	    		};
	    		
	    		xmlhttp.open("get" , "./getGraphyData.do?member_no=" + member_no); 
	    		xmlhttp.send();
	        }
	        
	        
	        function myStudentChart(){
	    		var xmlhttp = new XMLHttpRequest();	    		
	    	
	    		xmlhttp.onreadystatechange = function(){
	    			if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var data = JSON.parse(xmlhttp.responseText);
						
	                    	                    
		   	  	          var labelData = [];
		 	  	          var datadata = [];
							var sum = 0;

		 	  	          for(x of data.getMyCourseSales.studentGraph){
			 	  	        	labelData.push(x.course_name);
			 	  	        	datadata.push(x.count);
			 	  	        	if(sum < x.count){
			 	  	        		sum = x.count;
			 	  	        	}

			 	  	          }
		 	  	        
		 	             Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		 	             Chart.defaults.global.defaultFontColor = '#292b2c';

		 	             var ctx = document.getElementById("myBarChart");
		 	             var myLineChart = new Chart(ctx, {
		 	             type: 'bar',
		 	             data: {
		 	                 labels: labelData,
		 	                 datasets: [{
		 	                 label: "수강생",
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
		 	                     max: Math.floor(sum*1.5),
		 	                     maxTicksLimit: 5
		 	                     },
		 	                     gridLines: {display: true}
		 	                 }],
		 	                 },
		 	                 legend: {display: false}}
		 	             });

	                    	                    
	    			}
	    		};
	    		
	    		xmlhttp.open("get" , "./getGraphyData.do?member_no=" + member_no); 
	    		xmlhttp.send();
	        }

	        
	        
	        function init(){
	        	myCourseList();
	        	getMyCourseSales();
	        	myCategoryChart();
	        	myStudentChart();
	        }
	        
	        window.addEventListener("DOMContentLoaded" , init);
        </script>
    </head>
    <body class =  "sb-nav-fixed">
        <div id="layoutSidenav" class = "row">        
        	<div  class = "bg-dark" style="width : 12.5%">
	            <div id="layoutSidenav_nav">
					<nav class="sb-sidenav accordion sb-sidenav-dark">
	                    <div class="sb-sidenav-menu">
	                        <div class="nav">
	                            <div class="sb-sidenav-menu-heading">XXX님의 마이페이지</div>
	                            <a class="nav-link" href="index.html">
	                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
	                              		  전부 보기
	                            </a>
	                            <div class="sb-sidenav-menu-heading">COURSE</div>
	                                <a class="nav-link collapsed">
	                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                                        	내가 수강 중인 강의
	                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                </a>
	                                <a class="nav-link collapsed " >
	                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
	                                        	내가 강의 중인 강의
	                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                </a>                                                            
	                            <div class="sb-sidenav-menu-heading">한눈에 보기</div>
	                                <a class="nav-link">
	                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
	                                    	차트
	                                </a>
	                                <a class="nav-link">
	                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
	                                    	테이블
	                                </a>
	                        </div>
	                    </div>	                    
                	</nav>
	                <div class="fotter">
                        <div class="small test-white">고품격 지식공유:</div>
                        ALANG
                    </div>
	            </div>
            </div>
            <div class = "col-10">                
                <main class = "container">
                	<div id = "statistics" class = "p-4">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-dark">Dashboard</h1>
                            <a href="#" class="d-sm-inline-block btn bg-gradient-infon shadow-sm text-white">강의 개설</a>
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2" onclick = "myCourseList()">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info mb-1">
                                                    	나의 강의 수</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray">${statistics.courseNum}</div>
                                            </div>
                                            <div class="col-auto">
                                                	개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info mb-1">
                                                    	나의 학생</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray">${statistics.studentNum}</div>
                                            </div>
                                            <div class="col-auto">
                                                	명
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info mb-1">나의 수익
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray">${statistics.pointNum}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                P
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info mb-1">나의 답변
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray">${statistics.answerNum}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                	개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </div>
                        </div>                        
                    </div>                    
                    <div id = "coursePreviewPage" class = "p-4 border border-5">
                        <div class="card">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1">!</i>
                                내 강연 목록
                            </div>
                                <div class="card-body">                                    
                                    <div class="row" id = "courseListBox">                                        
                                    </div>                                                                        
                                </div>
                            <div class="card-footer small text-muted c0">????</div>
                        </div>
                    </div>
                    <div id = "totalDatePage" class = "p-4 border border-5">
                        <div class = "row">
                            <div class = "col-6">
								<div class = "card bg-lightgray justify-content-center" style="height: 500px;">
								<div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        	내 강의 장르
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>                                
                               </div>
                                
                            </div>
                            <div class = "col-6">
                                <div class = "card bg-lightgray font-gray" style="height: 500px;">
                                    <div style = "margin: auto; text-align: center;">
                                        <img src="../resources/img/trophy.jpg" width="300" height="300">
                                        <h2>학생수 ${statistics.studentNum}명 달성!</h2>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <div id = "chartPage" class = "p-4 border border-5">
                        <div class = "row">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                    			                    나의 수익
                                    </div>
                                    <div class="card-body"><canvas id="myCourseSalesChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                   				                     월간 수강생
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="51"></canvas></div>
                                    <div class="card-footer small text-muted">Updated today at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id = "datePage">
                        <div class="container-fluid p-4 border border-5">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1">!</i>
                                  		  미응답 답변
                                </div>
                                <div class="card-body">
                                    <table id="myAnswerTalbe">
                                        <thead>
                                            <tr>
                                                <th class = "col-1">#</th>
                                                <th class = "col-2">강의명</th>
                                                <th class = "col-3">제목</th>
                                                <th class = "col-3">내용</th>
                                                <th class = "col-1">작성자</th>
                                                <th class = "col-1">작성일</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody id = "myQuestionList">
                                        	<c:forEach items = "${totalList}" var = "data" varStatus="i">
                                        		<tr>
                                        			<td>${fn:length(totalList) - i.index}</td>
	                                        		<td>${data.courseVo.course_name}</td>
	                                        		<td>${data.questionVo.question_name}</td>
	                                        		<td>${data.questionVo.question_content}</td>
	                                        		<td>${data.memberVo.member_name}</td>       		
	                                        		<td><fmt:formatDate value="${data.questionVo.question_date}" 
	                                        		pattern="yyyy-MM-dd" /></td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>                
            </div>
        </div>
        
        <!-- 숨김파일 존 -->   
		<div class = "row m-1 d-none " id="course_card"style = "border: #6e707e 0.1px solid; width:49%; height:300px;">
	    <div class="col d-lg-block lecture_image" style="background: url('img/rank.png'); background-position: center; background-size: cover;"></div>
		 <div class = "col card">
		     <div class = "card-header bg-transparent" style = "text-align :center;"> 
		         <h1 class="h5 text-dark mb-2 font-weight-bold course_name" style="height:48px;">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</h1>
		         <span class ="lectureCount" style = "float:right;">총 X강</span><br>
		     </div>
		     <div class = "card-body2 course_tuto border-top-lightgray" style = "padding-top:5px;"> 
		         강의설명
		     </div>
		     <div class = "card-fotter p-3">
		         <div class = "border-top border-2" style = "padding-top : 5px; margin-bottom : 10px;">
		          <span class = "studentCount"style="color : #6e707e;">{강의학생}</span>
		          <span class = "courseSales"style = "float:right; color : #6e707e;">{수익}</span>
		        </div>
		          <a href="" class="btn btn-primary btn-user btn-block form-control">강의 수정</a>
		     </div>
		 </div>
		</div>
		       	
        

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script>
        </script>
        <script>
			
        
        </script>
        <script>
            function updateChart(){
                var today = new Date();   

                var year = today.getFullYear();
                var month = ('0' + (today.getMonth() + 1)).slice(-2);
                var day = ('0' + today.getDate()).slice(-2);
                var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                var dateString = year + '-' + month  + '-' + day;
                var timeString = hours + '시' + minutes  + '분 갱신';

                chartDate = document.getElementsByClassName('card-footer');
                for(i = 1; i < chartDate.length; i++){
                    chartDate[i].innerText = dateString + " | " + timeString;
                }
            }

            window.addEventListener("DOMContentLoaded" , updateChart);
        </script>
    </body>
</html>

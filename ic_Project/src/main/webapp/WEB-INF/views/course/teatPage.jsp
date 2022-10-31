<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<title>강좌 설정 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<script type="text/javascript">
	var course_no = ${data.courseVo.course_no};
	
	
	function changeTabNotice() {
		var xmlhttp = new XMLHttpRequest();
		
		var noticeListBox = document.getElementById("noticeTable");
		noticeListBox.innerHTML = ""; 
		var lectureBox = document.getElementById("lectureTable");
		lectureBox.innerHTML = ""; 
		var reviewListBox = document.getElementById("reviewTable");
		reviewListBox.innerHTML = ""; 
		var questionListBox = document.getElementById("questionTable");
		questionListBox.innerHTML = ""; 

		
		var noticeBox = document.getElementById("noticeList");				
		noticeBox.className = "container tab-pane active";		
		var lectureListBox = document.getElementById("Lecture");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Review");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Qna");				
		lectureListBox.className = "container tab-pane fade";
		
		var noticeTabBtn = document.getElementById("noticeTabBtn");				
		noticeTabBtn.className = "nav-link active";		
		var lectureTabBtn = document.getElementById("lectureTabBtn");				
		lectureTabBtn.className = "nav-link";		
		var reviewTabBtn = document.getElementById("reviewTabBtn");				
		reviewTabBtn.className = "nav-link";		
		var questionTabBtn = document.getElementById("questionTabBtn");				
		questionTabBtn.className = "nav-link";		


		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);	

				for(noticeData of data.noticeList){
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class" , "row"); 
					
					var noticeTag = document.createElement("div");
					noticeTag.setAttribute("class" , "p-2 col-1 bg-primary text-white text-center" );
					noticeTag.innerText = "공지";
					
					rowBox.appendChild(noticeTag);
								
					var noticeTitle = document.createElement("div");
					noticeTitle.setAttribute("onclick", "location.href='./readNoticePage.do?notice_no="+noticeData.noticeVo.notice_no +"'");
					noticeTitle.setAttribute("class" , "p-2 col-8 bg-info text-white");
					noticeTitle.innerText = noticeData.noticeVo.notice_title;
					
					rowBox.appendChild(noticeTitle);
					
					var noticeDate = document.createElement("div");
					noticeDate.setAttribute("class" , "col-2 p-2 alert-primary");
					noticeDate.innerText = noticeData.noticeVo.notice_registdate;
					console.log(noticeData.noticeVo.notice_registdate);

					rowBox.appendChild(noticeDate);
					
					var deleteColBox = document.createElement("div");
					deleteColBox.setAttribute("class" , "col-1 p-2 bg-danger");
					
					
					rowBox.appendChild(deleteColBox);
					
					noticeListBox.appendChild(rowBox);
					
					console.log("새로운 시작");
				}
			}
		}
		
		xmlhttp.open("get" , "./getCourseNoticeList.do?course_no=" + course_no); 
		xmlhttp.send();	

	}	
	
	function changeTabLecture() {
		var xmlhttp = new XMLHttpRequest();
		
		var noticeListBox = document.getElementById("noticeTable");
		noticeListBox.innerHTML = ""; 
		var lectureBox = document.getElementById("lectureTable");
		lectureBox.innerHTML = ""; 
		var reviewListBox = document.getElementById("reviewTable");
		reviewListBox.innerHTML = ""; 
		var questionListBox = document.getElementById("questionTable");
		questionListBox.innerHTML = ""; 
		
		var noticeBox = document.getElementById("noticeList");				
		noticeBox.className = "container tab-pane fade";		
		var lectureListBox = document.getElementById("Lecture");				
		lectureListBox.className = "container tab-pane active";
		var lectureListBox = document.getElementById("Review");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Qna");				
		lectureListBox.className = "container tab-pane fade";
		
		var noticeTabBtn = document.getElementById("noticeTabBtn");				
		noticeTabBtn.className = "nav-link";		
		var lectureTabBtn = document.getElementById("lectureTabBtn");				
		lectureTabBtn.className = "nav-link active";		
		var reviewTabBtn = document.getElementById("reviewTabBtn");				
		reviewTabBtn.className = "nav-link";		
		var questionTabBtn = document.getElementById("questionTabBtn");				
		questionTabBtn.className = "nav-link";		
				
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);					
							
                var cnt = 1;

				for(lectureData of data.lectureList){
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class" , "row"); 
					
					var lectureNum = document.createElement("div");
					lectureNum.setAttribute("class" , "p-2 col-1 border-end border-bottom border-info text-primary text-center" );
					lectureNum.innerText = cnt;
					
					rowBox.appendChild(lectureNum);
								
					var lectureTitle = document.createElement("div");
					lectureTitle.setAttribute("onclick", "location.href='./lectureView.do?course_no="+lectureData.course_no +"&lecture_no=" + lectureData.lecture_no + "'");
					lectureTitle.setAttribute("class" , "p-2 col-7 border-end border-bottom border-info text-primary");
					lectureTitle.innerText = lectureData.course_name;
					
					rowBox.appendChild(lectureTitle);
					
					var lecturePrice = document.createElement("div");
					lecturePrice.setAttribute("class" , "col-1 border-end border-bottom border-info");
					lecturePrice.innerText = lectureData.course_price;
					rowBox.appendChild(lecturePrice);

                    var lectureDate = document.createElement("div");
					lectureDate.setAttribute("class" , "col-2 p-2 border-bottom border-info");
					lectureDate.innerText = lectureData.course_register_date;
					rowBox.appendChild(lectureDate);
					
					var deleteColBox = document.createElement("div");
					deleteColBox.setAttribute("class" , "col-1 p-2 bg-danger");
										
					rowBox.appendChild(deleteColBox);
					
					lectureBox.appendChild(rowBox);

                    cnt++;
				}
			}
		}
		
		xmlhttp.open("get" , "./getCourseLectureList.do?course_no=" + course_no); 
		xmlhttp.send();	

	}
	
    function chageTabReview() {
		var xmlhttp = new XMLHttpRequest();
		
		var noticeListBox = document.getElementById("noticeTable");
		noticeListBox.innerHTML = ""; 
		var lectureBox = document.getElementById("lectureTable");
		lectureBox.innerHTML = ""; 
		var reviewListBox = document.getElementById("reviewTable");
		reviewListBox.innerHTML = ""; 
		var questionListBox = document.getElementById("questionTable");
		questionListBox.innerHTML = ""; 
		
		var noticeBox = document.getElementById("noticeList");				
		noticeBox.className = "container tab-pane fade";		
		var lectureListBox = document.getElementById("Lecture");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Review");				
		lectureListBox.className = "container tab-pane active";
		var lectureListBox = document.getElementById("Qna");				
		lectureListBox.className = "container tab-pane fade";
		
		var noticeTabBtn = document.getElementById("noticeTabBtn");				
		noticeTabBtn.className = "nav-link";		
		var lectureTabBtn = document.getElementById("lectureTabBtn");				
		lectureTabBtn.className = "nav-link ";		
		var reviewTabBtn = document.getElementById("reviewTabBtn");				
		reviewTabBtn.className = "nav-link active";		
		var questionTabBtn = document.getElementById("questionTabBtn");				
		questionTabBtn.className = "nav-link";		
				
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);					
							
                var cnt = 1;

				for(reviewData of data.reviewList){
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class" , "row"); 
					
					var reviewNum = document.createElement("div");
					reviewNum.setAttribute("class" , "p-2 col-1 border-end border-bottom border-info text-primary text-center" );
					reviewNum.innerText = cnt;
					
					rowBox.appendChild(reviewNum);
								
					var reviewTitle = document.createElement("div");
					reviewTitle.setAttribute("onclick", "location.href='./여기아직없음?course_no=" + "'");
					reviewTitle.setAttribute("class" , "p-2 col-7 border-end border-bottom border-info text-primary");
					reviewTitle.innerText = reviewData.reviewVo.review_title;
					
					rowBox.appendChild(reviewTitle);
					
					var reviewPrice = document.createElement("div");
					reviewPrice.setAttribute("class" , "col-1 border-end border-bottom border-info");
					reviewPrice.innerText = reviewData.reviewVo.review_rate;
					rowBox.appendChild(reviewPrice);

                    var reviewDate = document.createElement("div");
					reviewDate.setAttribute("class" , "col-2 p-2 border-bottom border-info");
					reviewDate.innerText = reviewData.reviewVo.review_date;
					rowBox.appendChild(reviewDate);
					
					reviewListBox.appendChild(rowBox);

                    cnt++;
				}
			}
		}
		
		xmlhttp.open("get" , "./getCourseReviewList.do?course_no=" + course_no); 
		xmlhttp.send();	

	}
    
    function chageTabQuestion() {
    	
    	var length = 30;
		var xmlhttp = new XMLHttpRequest();
		
		var noticeListBox = document.getElementById("noticeTable");
		noticeListBox.innerHTML = ""; 
		var lectureBox = document.getElementById("lectureTable");
		lectureBox.innerHTML = ""; 
		var reviewListBox = document.getElementById("reviewTable");
		reviewListBox.innerHTML = ""; 
		var questionListBox = document.getElementById("questionTable");
		questionListBox.innerHTML = ""; 
		
		var noticeBox = document.getElementById("noticeList");				
		noticeBox.className = "container tab-pane fade";		
		var lectureListBox = document.getElementById("Lecture");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Review");				
		lectureListBox.className = "container tab-pane fade";
		var lectureListBox = document.getElementById("Qna");				
		lectureListBox.className = "container tab-pane active";
		
		var noticeTabBtn = document.getElementById("noticeTabBtn");				
		noticeTabBtn.className = "nav-link";		
		var lectureTabBtn = document.getElementById("lectureTabBtn");				
		lectureTabBtn.className = "nav-link ";		
		var reviewTabBtn = document.getElementById("reviewTabBtn");				
		reviewTabBtn.className = "nav-link";		
		var questionTabBtn = document.getElementById("questionTabBtn");				
		questionTabBtn.className = "nav-link active";		
				
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);					
							
                var cnt = 1;

                var labelBox = document.createElement("div");
                    labelBox.setAttribute("class" , "row border-bottom border-dark"); 
                
                var numBox = document.createElement("div");
                    numBox.setAttribute("class", "col-1 h5");
                    numBox.innerText = "번호";

                var titleBox = document.createElement("div");
                titleBox.setAttribute("class", "col-3 h5");
                titleBox.innerText = "제목";

                var contentBox = document.createElement("div");
                contentBox.setAttribute("class", "col-4 h5");
                contentBox.innerText = "내용";

                var writerBox = document.createElement("div");
                writerBox.setAttribute("class", "col-1 h5");
                writerBox.innerText = "작성자";
                    
                var dateBox = document.createElement("div");
                dateBox.setAttribute("class", "col-1 h5");
                dateBox.innerText = "작성일";
                    
                var answerBox = document.createElement("div");
                answerBox.setAttribute("class", "col-1 h5");
                answerBox.innerText = "답변";

                labelBox.appendChild(numBox);
                labelBox.appendChild(titleBox);
                labelBox.appendChild(contentBox);
                labelBox.appendChild(writerBox);
                labelBox.appendChild(dateBox);
                labelBox.appendChild(answerBox);

                questionListBox.appendChild(labelBox);

                
				for(questionData of data.questionList){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class" , "row border-bottom border-secondary");
					rowBox.setAttribute("id" , "row"+questionData.questionVo.question_no);
					
					var questionNum = document.createElement("div");
					questionNum.setAttribute("class" , "p-2 col-1 text-center" );
					questionNum.innerText = cnt;
					
					rowBox.appendChild(questionNum);
								
					var questionTitle = document.createElement("div");
					questionTitle.setAttribute("onclick", "location.href='./readQuestionPage.do?question_no="+questionData.questionVo.question_no + "'");
					questionTitle.setAttribute("class" , "p-2 col-3 ");
					questionTitle.setAttribute("id" , "title" + questionData.questionVo.question_no);
                    var questionTitleText = document.createElement("mark");
                    questionTitleText.innerText = questionData.questionVo.question_name;					
					
                    rowBox.appendChild(questionTitle);
                    questionTitle.appendChild(questionTitleText);

                    var questionContent = document.createElement("div");
					questionContent.setAttribute("class" , "p-2 col-4");
					questionContent.innerText = questionData.questionVo.question_content;
					questionContent.setAttribute("id" , "content" + questionData.questionVo.question_no);
					
					
					
					if(questionContent.innerText.length > length){
						questionContent.innerText = questionData.questionVo.question_content.substr(0, length-2) + "...";
					}
					

                    rowBox.appendChild(questionContent);

                    var questionWriter = document.createElement("div");
					questionWriter.setAttribute("class" , "p-2 col-1");
					questionWriter.innerText = questionData.memberVo.member_id;
					
                    rowBox.appendChild(questionWriter);

                    var questionDate = document.createElement("div");
					questionDate.setAttribute("class" , "p-2 col-1");
					questionDate.innerText = questionData.questionVo.question_date;

                    rowBox.appendChild(questionDate);

                    var questionAnswer = document.createElement("div");
                    questionAnswer.setAttribute("class" , "p-2 col-1 bg-danger text-white");                    
                    questionAnswer.setAttribute("id" , "answer"+ questionData.questionVo.question_no);
                    questionAnswer.setAttribute("value" , questionData.questionVo.question_no);
                    questionAnswer.setAttribute("onclick" , "instantAnswer(this)");
                    questionAnswer.innerText = "빠른답변"
                    

                    rowBox.appendChild(questionAnswer); 
				
                    /*
                    
                    if(questionData.answerVo.question_no != null &&
                    		questionData.questionVo.question_no == questionData.answerVo.question_no){
                    	
                        var answreRowBox =  document.createElement("div");
					    rowBox.setAttribute("class" , "row border-bottom border-secondary alert-secondary");

                        var answerNum = document.createElement("div");
					    questionNum.setAttribute("class" , "p-2 col-1 text-center" );					    
					
					    answreRowBox.appendChild(answerNum);
								
					    var answerTitle = document.createElement("div");
                        answerTitle.setAttribute("onclick", "location.href='./answerView.do?course_no=" + "'");
                        answerTitle.setAttribute("class" , "p-2 col-3");					
                        
					    answreRowBox.appendChild(answerTitle);

                        var answerContent = document.createElement("div");
                        answerContent.setAttribute("class" , "p-2 col-4");
                        answerContent.innerText = questionData.answerVo.answer_content;

                        answreRowBox.appendChild(answerContent);

                        var answerWriter = document.createElement("div");
                        answerWriter.setAttribute("class" , "p-2 col-1");
                        answerWriter.innerText = '선생님';
                        
                        answreRowBox.appendChild(answerWriter);

                        var answerDate = document.createElement("div");
                        answerDate.setAttribute("class" , "p-2 col-1");
                        answerDate.innerText = questionData.answerVo.answer_date;

                        answreRowBox.appendChild(answerDate);

                        var answerAnswer = document.createElement("div");
                        answerWriter.setAttribute("class" , "p-2 col-1");

                        answreRowBox.appendChild(answerAnswer);
                        
                        questionListBox.appendChild(answreRowBox);
                    }
                    */
					
					questionListBox.appendChild(rowBox);

                    cnt++;
				}
				getTeacherAnswerList();
			}
		}
		
		xmlhttp.open("get" , "./getCoursQuestionList.do?course_no=" + course_no); 
		xmlhttp.send();	
	}
    
    function getTeacherAnswerList(){
    	
		var xmlhttp = new XMLHttpRequest();

		
		var cnt = 1
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);					

				for(answerData of data.teacherAnswerList){
					
					var questionListBox = document.getElementById("row" + answerData.answerVo.question_no);
					var questionAnswerBox = document.getElementById("answer" + answerData.answerVo.question_no);
					questionAnswerBox.setAttribute("class" ,"p-1 col-1 bg-primary text-white");
					questionAnswerBox.innerText = "답변완료";

					var data = JSON.parse(xmlhttp.responseText);
					
	                var answreRowBox =  document.createElement("div");
	                answreRowBox.setAttribute("class" , "row border-bottom border-secondary alert-secondary");
	
	                var answerNum = document.createElement("div");
	                answerNum.setAttribute("class" , "p-2 col-1 text-center" );					    
				
				    answreRowBox.appendChild(answerNum);
							
				    var answerTitle = document.createElement("div");
	                answerTitle.setAttribute("onclick", "location.href='./answerView.do?course_no=" + "'");
	                answerTitle.setAttribute("class" , "p-2 col-3");					
	                
				    answreRowBox.appendChild(answerTitle);
	
	                var answerContent = document.createElement("div");
	                answerContent.setAttribute("class" , "p-2 col-4");
	                answerContent.innerText = answerData.answerVo.answer_content;
	
	                answreRowBox.appendChild(answerContent);
	
	                var answerWriter = document.createElement("div");
	                answerWriter.setAttribute("class" , "p-2 col-1");
	                answerWriter.innerText = '선생님';
	                
	                answreRowBox.appendChild(answerWriter);
	
	                var answerDate = document.createElement("div");
	                answerDate.setAttribute("class" , "p-2 col-1");
	                answerDate.innerText = '일단 테스트'; 
	                	
	                	//questionData.answerVo.answer_date;
	
	                answreRowBox.appendChild(answerDate);
	
	                var answerAnswer = document.createElement("div");
	                answerAnswer.setAttribute("class" , "p-2 col-1");
	                answerAnswer.innerText = "답변수정";
	                
	                answreRowBox.appendChild(answerAnswer);
	                
	                
	                
	                questionListBox.appendChild(answreRowBox);
	                cnt++;
	                
				
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
					reviewView.setAttribute("class", "p-4 bg-info text-dark	 rounded");
					item.appendChild(reviewView);
					
					var reviewTitle = document.createElement("h3");
					reviewTitle.innerText = reviewData.reviewVo.review_title;
					reviewView.appendChild(reviewTitle);
					
					var reviewContent = document.createElement("p");
					reviewContent.innerText = reviewData.reviewVo.review_content;
					reviewView.appendChild(reviewContent);
					
					cnt++;
				}
				
				console.log("반복문 실행 완료");
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
					memberImage.setAttribute("src", "../resources/img/exodia.png");
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
					memberName.setAttribute("class", "mb-0");
					memberName.innerText = studentData.studentVo.member_id + "님이 가입하셨습니다.";					
					contentMini.appendChild(memberName);
					
					var lectureData = document.createElement("p");
					lectureData.setAttribute("class", "mb-0 opacity-75");
					lectureData.innerText = studentData.registVo.my_course_purchase_price + "포인트가 적립될 예정이에요!";
					contentMini.appendChild(lectureData);
					
					
					var whenTag = document.createElement("small");
					whenTag.setAttribute("class", "opacity-50 text-nowrap");
					whenTag.innerText = studentData.registVo.my_course_date;
					contentBox.appendChild(whenTag);										
				}
			}
		}
		xmlhttp.open("get" , "./getStudentProcess.do?course_no=" + course_no);		
		xmlhttp.send();
	}
	
	
	var modal = null;
	var cutmodal = null;

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
				modalHeaderTitle.innerText = data.courseVo.course_name;				
				header.appendChild(modalHeaderTitle);
				
				var modalCloseHead = document.createElement("button");
				modalCloseHead.setAttribute("type", "button");
				modalCloseHead.setAttribute("class", "btn-close");
				modalCloseHead.setAttribute("data-bs-dismiss", "modal");
				header.appendChild(modalCloseHead);                

                var body = document.createElement("div");
                body.setAttribute("class", "modal-body");
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
        
        var numId = btValue.getAttribute('id').replace("answer","");
        console.log(numId);
 
                
        
		var xmlhttp = new XMLHttpRequest();		
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var titleText = document.getElementById('title' + numId);
				var contentText = document.getElementById('content' + numId);
				
		        console.log(titleText.innerText);
		        console.log(contentText.innerText);
				
                var data = JSON.parse(xmlhttp.responseText);				
                
                var header = document.createElement("div");
                header.setAttribute("class", "modal-header");
                content.appendChild(header);
                
				var modalHeaderTitle = document.createElement("h4");
				modalHeaderTitle.setAttribute("class" , "modal-title");
				modalHeaderTitle.innerText = titleText.innerText;				
				header.appendChild(modalHeaderTitle);
				
				var modalCloseHead = document.createElement("button");
				modalCloseHead.setAttribute("type", "button");
				modalCloseHead.setAttribute("class", "btn-close");
				modalCloseHead.setAttribute("data-bs-dismiss", "modal");
				header.appendChild(modalCloseHead);                

                var body = document.createElement("div");
                body.setAttribute("class", "modal-body");
                body.innerText = contentText.innerText;
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
				chageTabQuestion();
				cutmodal.hide();
			}
		};
		
		xmlhttp.open("post" , "./writeAnswerProcess.do"); 
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("question_no=" + question_no + "&answer_content=" + writeText);
				
		writeBox.value = "";
    	
    }
    
	
	function init(){
		
		changeTabNotice();
		getLatestReview();
		
	}

	window.addEventListener("DOMContentLoaded" , init);
    window.addEventListener('DOMContentLoaded' , function(){
        modal = new bootstrap.Modal(document.getElementById('courseModal'));
        cutmodal = new bootstrap.Modal(document.getElementById('instantAnswer'));
    });


</script>

</head>
<body>
	
	<div class="container p-5 my-5 border">
  		<h1 class="display-4 text-center">${data.courseVo.course_name }</h1>
  		<p class="text-center">${sessionUser.member_name }</p>
  		
		
		<div id="reviewDemo" class="carousel slide col-5 float-end" data-bs-ride="carousel">
		</div>
		
		<button type="button" class="btn btn-primary" id="modalBtn" onclick = "introModal()">강의 개요</button>

		<div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" id = "introContent">
		    </div>
		  </div>
		</div>
	
		<!-- 		
		<div class="modal fade" id="courseModal">
		</div>
		 -->
	</div>
	
	
<a href = "courseNoticeWritePage.do?course_no=${data.courseVo.course_no}">
	<button class="btn btn-primary" type="button">테스트 공지 만들기</button>
</a>
<a href = "reviewWritePage.do?course_no=${data.courseVo.course_no}">
	<button class="btn btn-primary" type="button">테스트 후기 만들기</button>
</a>
<a href="./addLecturePage.do?course_no=${data.courseVo.course_no }">
	<button class="btn btn-primary" type="button">강의 만들기</button>
</a>	
<a href = "questionWritePage.do?course_no=${data.courseVo.course_no}">
	<button class="btn btn-primary" type="button">테스트 질문 작성하기</button>
</a>	
	
<div class="container mt-3">
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a id = "noticeTabBtn" class="nav-link active" onclick = "changeTabNotice()">공지사항</a>
		</li>
		<li class="nav-item">
			<a id = "lectureTabBtn" class="nav-link" onclick = "changeTabLecture()">업로드 된 강의</a>
		</li>
		<li class="nav-item">
			<a id = "reviewTabBtn" class="nav-link" onclick = "chageTabReview()">후기</a>
		</li>
		<li class="nav-item">
			<a id = "questionTabBtn" class="nav-link"  onclick = "chageTabQuestion()">Q&A</a>
		</li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="noticeList" class="container tab-pane active">
			<div id = "noticeTable">
				
			</div>
		</div>
		<div id="Lecture" class="container tab-pane fade">
		<jsp:include page="../common/course_notice.jsp"></jsp:include>
			<div id = "lectureTable">
			
			</div>			
		</div>
		<div id="Review" class="container tab-pane fade">
		<div id = "reviewTable">			
		</div>
		</div>
		<div id="Qna" class="container tab-pane fade">
		<div id = "questionTable">
			
		</div>			
		
		<div class="modal fade" id="instantAnswer" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" id = "answerContent">
		    	
		    </div>
		  </div>
		</div>
		</div>
	</div>
</div>

	<div class = "float-end" style="position: absolute; right: 20px; bottom: 20px;">
		<div id = "studentBox"></div>
		<img src="../resources/img/mollu.gif" class="rounded float-end"  width="100" height="100" onclick = "myStudentList()">		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
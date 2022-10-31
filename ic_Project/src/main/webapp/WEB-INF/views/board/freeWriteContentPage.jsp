<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>      
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
hr.new1 {
  border-top: 3px solid blue;
}
</style>
<style>.info_size { font-size : small; color : gray;}</style>
<style>.title_size{font-size : xx-large; font-family: 'Jua', sans-serif; font-weight : bold;}</style>
<style>.content_size { font-size : x-large;}</style>
<style>.replyfont{ font-family : cursive;}</style>
<script>   
   $(document).ready(function(){ 
      $("#submit").click(function(){
            if($("#freename").val().length==0){ alert("제목을 입력하세요."); $("#freename").focus(); return false; }
            if($("#freeContent").val().length==0){ alert("내용 입력하세요."); $("#freeContent").focus(); return false; }
         });      
   });
</script>
<style>
.id_size {
   font-size: large;
   color: blue;
}
</style>
<style type="text/css">
a:link {
   text-decoration: none;
   color: black
}
a:visited {
   text-decoration: none;
   color: black
}
a:hover {
   color: blue
}
</style>
<style>
#user:hover {
   color: black;
   font-weight: bold
}
</style>
<style>
#freeread{word-break:break-all;}
</style>
<!-- 네비게이션 바 -->
                  <jsp:include page="../common/global_nav.jsp"></jsp:include>
</head>
<body>

		
		<div style="width:1200px; margin:0 auto">
		   <div class="container">
		      <div class="row">
		         <div class="col"></div>
		         <div class="col-10">
		            <div class="row mt-5">
		            	<div class="col fs-1 fw-bold text-left"
		                     onclick="location.href='./freeboardPage.do'"
		                     style="cursor: pointer;">자유 게시판</div>
		                     </div>
		                     <br>
		            <p class="title_size">글쓰기</p>
			
			
			<c:choose>
				<c:when test="${!empty sessionUser }">
					<form action="./freeWriteContentProcess.do" method="post" enctype="multipart/form-data">
					
						<p class="info_size">작성자 : ${sessionUser.member_id }</p>
						<hr class="new1">
						재목 : <input type="text" placeholder="제목을 입력하세요" name="free_title"style="width: 400px;"id="freename">
										<p></p>
				<script>
		    $(document).ready(function() {
		        $('#freename').on('keyup', function() {
		            $('#freename_cnt').html("("+$(this).val().length+" / 30)");
		 
		            if($(this).val().length > 30) {
		                $(this).val($(this).val().substring(0, 30));
		             
		            }
		        });
		    });      
		    </script>
		      <div id="freeread">
						<textarea rows="20" cols="127" style="resize: none;" placeholder="내용을 입력하세요"
						name="free_content" id="freeContent"></textarea>
					</div>
						
						<div id="freeContent_cnt">(0/800)</div>
						<br>
						<input type="file" multiple accept="image/*" name="freefile">
						
								<hr class="new1">
						<button type="submit" class="btn btn-success" id="submit">완료</button>
						<script>
		    $(document).ready(function() {
		        $('#freeContent').on('keyup', function() {
		            $('#freeContent_cnt').html("("+$(this).val().length+" / 800)");
		 
		            if($(this).val().length > 800) {
		                $(this).val($(this).val().substring(0, 800));
		                $('#freeContent_cnt').html("(800 / 800)");
		            }
		        });
		    });      
		    </script>
		  			</form>
				</c:when>
						
				<c:otherwise>
				로그인후 작성가능합니다. <a href="../member/loginPage.do">로그인</a>
				</c:otherwise>
			
			</c:choose>
			     </div>
			    <div class="col"></div>
			</div>
		</div>
		</div>
		
			<script
		      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		      crossorigin="anonymous"></script>
			
		
		</body>
		</html>
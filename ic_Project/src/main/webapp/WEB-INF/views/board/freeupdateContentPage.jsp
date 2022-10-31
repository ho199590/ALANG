<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script>   
   $(document).ready(function(){ 
      $("#submit").click(function(){
            if($("#freeupdate").val().length==0){ alert("제목을 입력하세요."); $("#freeupdate").focus(); return false; }
            if($("#freeupdateContent").val().length==0){ alert("내용 입력하세요."); $("#freeupdateContent").focus(); return false; }
         });      
   });
</script>
<style>
hr.new1 {
  border-top: 3px solid blue;
}
</style>
<style>
#freeread{word-break:break-all;}
</style>
<style>.info_size { font-size : small; color : gray;}</style>
<style>.title_size{font-size : xx-large; font-family: 'Jua', sans-serif; font-weight : bold;}</style>
<style>.content_size { font-size : x-large;}</style>

<!-- 네비게이션 바 -->
                  <jsp:include page="../common/global_nav.jsp"></jsp:include>
</head>


<body>
	<div style="width:1200px; margin: 0 auto">
	 <div class="container">
		<div class="row">
		<div class="col"></div>
			<div class="col-10">
			<div class="row mt-5">
            	<div class="col fs-1 fw-bold text-left"
                     onclick="location.href='./freeboardPage.do'">자유 게시판</div>
                     
		
		<form action="freeupdateContentprocess.do" method= "post">
			<p class="info_size">작성자 : ${sessionUser.member_id }<p>
			<hr class="new1">
			 재목:<input type="text" placeholder="제목을 입력하세요" name="free_title" style="width: 400px;
			 "id="freeupdate" value="${data.freeboardVo.free_title}" >
			 <p></p>
			 		<script>
    $(document).ready(function() {
        $('#freeupdate').on('keyup', function() {
            $('#freeupdate_cnt').html("("+$(this).val().length+" / 30)");
 
            if($(this).val().length > 30) {
                $(this).val($(this).val().substring(0, 30));
             
            }
        });
    });      
    </script>
    <div class="row mt-2">
    <div id="freeread">
		   <textarea rows="20" cols="127" style="resize: none;" placeholder="내용을 입력하세요"
			name="free_content" id="freeupdateContent">${data.freeboardVo.free_content }</textarea>
			<br>
			<div id="freeupdateContent_cnt">(0/800)</div>
			</div>
			</div>
			<input type="hidden" name="free_no" value="${data.freeboardVo.free_no }">
						<hr class="new1">
				<button type="submit" class="btn btn-success" id="submit">수정완료</button>
				<script>
    $(document).ready(function() {
        $('#freeupdateContent').on('keyup', function() {
            $('#freeupdateContent_cnt').html("("+$(this).val().length+" / 800)");
 
            if($(this).val().length > 800) {
                $(this).val($(this).val().substring(0, 800));
                $('#freeupdateContent_cnt').html("(800 / 800)");
            }
        });
    });      
    </script>
		</form>
				 </div>
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
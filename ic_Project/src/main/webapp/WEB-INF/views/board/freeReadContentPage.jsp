<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            if($("#freehere").val().length==0){ alert("댓글을 입력하세요."); $("#freehere").focus(); return false; }
         });      
   });
</script>
<style>
hr.new1 {
  border-top: 3px solid blue;
}
</style>
<style>.info_size { font-size : small; color : gray;}</style>
<style>.title_size{font-size : xx-large; font-family: 'Jua', sans-serif; font-weight : bold;}</style>
<style>.content_size { font-size : x-large;}</style>
<style>.replyfont{ font-family : cursive;}</style>
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
               <div class="col fs-1 fw-bold text-left" onclick="location.href='./freeboardPage.do'" style="cursor:pointer;">
                     자유 게시판
                  </div>      
               </div> 
               <br>   
               <br>   
               <br>   
                  <div id="freeread">
   <p class="title_size">${data.freeboardVo.free_title } </p>
   <p class="info_size">작성자 : ${data.memberVo.member_name }&nbsp;&nbsp;
   작성일 :<fmt:formatDate value="${data.freeboardVo.free_regdate }" pattern="yyyy-MM-dd"/>
   조회수 : ${data.freeboardVo.free_viewcount }<br></p>

   <hr class="new1">
   <p class="content_size">${data.freeboardVo.free_content }</p>
   </div>


   <table class=table style="width:100%;">
   
   <c:forEach items="${replylist }" var="rdata">
      <tr>
         <td width="10%">${rdata.memberVo.member_name }
         <td width='100%' style="word-break:break-all">${rdata.freeReplyBoardVo.free_reply_content }  
            
         <c:if test="${!empty sessionUser && sessionUser.member_no == rdata.freeReplyBoardVo.member_no }">
            <i class="fas fa-trash-alt" style="float: right;" onclick="location.href = './deleteReplyProcess.do?free_reply_no=${rdata.freeReplyBoardVo.free_reply_no}&free_no=${data.freeboardVo.free_no}'"></i>   
         </c:if>         
      </tr>      
   </c:forEach>
       <c:forEach items="${data.freeimageVoList }" var="freeImageVo">
         <img src="/upload/${freeImageVo.free_file_path }">
         
         </c:forEach>
            <hr class="new1">
   </table>
   
   <h5>댓글 쓰기</h5>
   
      <form action="./freeReplyWriteContentProcess.do" method="post">
      작성자 : ${sessionUser.member_name }<br>
      <textarea id="freehere" style="resize :none;"  rows="1" cols="70" name="free_reply_content"></textarea><br>
      <input type="hidden" name="free_no" value="${data.freeboardVo.free_no} ">
      <div id="freehere_cnt">(0/100)</div>
      <script>
    $(document).ready(function() {
        $('#freehere').on('keyup', function() {
            $('#freehere_cnt').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#freehere_cnt').html("(100 / 100)");
            }
        });
    });      
    </script>
      <button type="submit" class="btn btn-success" id="submit">댓글 작성</button>
         </form>

<br>
<button type="button" class="btn btn-info" onclick="location.href='./freeboardPage.do'">목록</button>
   <c:if test="${!empty sessionUser && sessionUser.member_no ==  data.freeboardVo.member_no}">
   <button type="button" class="btn btn-primary" onclick="location.href = './freedeleteContentProcess.do?free_no=${data.freeboardVo.free_no}'">삭제</button>
   <button type="button" class="btn btn-danger" onclick="location.href='./freeupdateContentPage.do?free_no=${data.freeboardVo.free_no }'">수정</button>
   </c:if>
</div>
<div class="col"></div>
</div>
</div>
</div>
   
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>            

</body>
</html>
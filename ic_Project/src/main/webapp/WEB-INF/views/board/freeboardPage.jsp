<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
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
<!-- 네비게이션 바 -->
                  <jsp:include page="../common/global_nav.jsp"></jsp:include>
</head>
<body>
      <div style="width: 1200px; margin: 0 auto">
      <div class="container">
         <div class="row">
            <div class="col"></div>
            <div class="col-10">
               <div class="row mt-5">
                  <div class="col fs-1 fw-bold text-left"
                     onclick="location.href='./freeboardPage.do'"
                     style="cursor: pointer;">자유 게시판</div>
               </div>
               <div style="float: right;">
                  <c:choose>
                     <c:when test="${!empty sessionUser }">
         사용자 <span class="id_size" id="user"
                           OnClick="location.href='../member/mypage.do'"
                           style="cursor: pointer;">${sessionUser.member_name }</span>
                     </c:when>
                     <c:otherwise>
         로그인 회원만 요청 가능합니다. <a href="../member/loginPage.do">로그인페이지</a>
                     </c:otherwise>
                  </c:choose>
               </div>
               <p style="clear: both;">&nbsp;</p>
               <div class="row mt-2">
                  <div class="col">
                  
      <table class="table table table-hover">
      <thead>
      <tr>
         <th>글번호 </th>
         <th>재목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>작성일</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach items="${freelist }" var="data">
      <tr>
         <td>${data.freeBoardVo.free_no }</td>
         <td><a href="./freeReadContentPage.do?free_no=${data.freeBoardVo.free_no }">${data.freeBoardVo.free_title }</a></td>
         <td>${data.memberVo.member_name }</td>
         <td>${data.freeBoardVo.free_viewcount }</td>
         <td><fmt:formatDate value="${data.freeBoardVo.free_regdate }" pattern="yyyy-MM-dd"/></td>         
      </tr>
   </c:forEach>
   </tbody>
   </table>
      </div>
            </div>   
            <br>
               <c:if test="${!empty sessionUser}">
                     <button type="button" class="btn btn-success" 
                     onclick = "location.href='./freeWriteContentPage.do'">글쓰기</button>
                  </c:if>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- include 대상이 되는 jsp는...html,head,body 태그 없어야 된다... -->    
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
a.nav-link_1:link {
   text-decoration: none;
   color: black;
   font-weight:bold;
   font-size:18px;
}

a.nav-link_1:visited {
   text-decoration: none;
   color: black
}

a.nav-link_1:hover {
   
   text-decoration: underline;
   font-weight:bold
}
a.nav-link_2:link {
   text-decoration: none;
   color: black;
   font-weight:bold;
   font-size:15px;
}

a.nav-link_2:visited {
   text-decoration: none;
   color: black
}

a.nav-link_2:hover {
   
   text-decoration: underline;
   font-weight:bold
}
</style>
<style type="text/css">
#navbardrop:link{
   text-decoration: none;
   color: black
}
#navbardrop:visited{
   text-decoration: none;
   color: black
}
#navbardrop:hover{
   
   text-decoration: underline;
   font-weight:bold
}

</style>
<nav class="navbar navbar-expand-sm" style="background-color:#e0e0e0;">
   <span class="navbar-brand" style= "width:70px; height:70px; margin:0px 0px 0px 10px;">
      <a href="../main/loggedIn.do"><img src = "../resources/img/alang_logo_nav.png" style="width:55px; height: 55px;  "></a>   
   </span>   
   <ul class="navbar-nav">   
    <!-- Dropdown -->
<!--       <li class="nav-item dropdown" > -->
<!--       <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> -->
<!--          드롭다운 -->
<!--       </a> -->
<!--          <div class="dropdown-menu"> -->
<!--             <a class="dropdown-item" href="#">Link 1</a> -->
<!--             <a class="dropdown-item" href="#">Link 2</a> -->
<!--             <a class="dropdown-item" href="#">Link 3</a> -->
<!--          </div> -->
<!--       </li> -->
   <li class="nav-item" style="padding:8px; width:120px; height:40px">
      <a class="nav-link_1"  href="../main/loggedIn.do">지식나누기</a>
   </li>
   <li class="nav-item" style="padding:8px; width:120px; height:40px">
      <a class="nav-link_1"  href="../board/freeboardPage.do">자유게시판</a>
   </li>
   <li class="nav-item" style="padding:8px; width:120px; height:40px">
      <a class="nav-link_1" href="../requestboard/requestMainPage.do">요청게시판</a>
   </li>
<!--    <form class="form-inline" action=""> -->
<!--       <input class="form-control mr-sm-2" type="text" placeholder="Search"> -->
<!--       <button class="btn btn-success" type="submit">Search</button> -->
<!--    </form> -->
<!--     </li>-->
      <li class="nav-item" style="padding:8px; width:120px; height:40px;">
         <a class="nav-link_1" href="../member/mypage.do">마이페이지</a>
      </li>      
      <li class="nav-item" style="padding:8px; width:120px; height:40px;">
         <a class="nav-link_1" href="../game/gameMainPage.do">이벤트</a>
      </li>   
      </ul>
      <ul class="navbar-nav ms-auto">   
   <li class="nav-item" style="width:40px; height:30px;">
   <a class="nav-link_1" href="../member/logoutProcess.do"><i class="fas fa-sign-out-alt"; style="font-size:30px"></i></a>
   </li>
   <ul></ul>
</ul>
</nav>            

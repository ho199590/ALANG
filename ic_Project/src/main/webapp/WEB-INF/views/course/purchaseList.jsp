<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
   <!-- 구매목록 -->
   <form action="" method="post">
      <table>
         <tr>
            <td>구매번호</td>
            <td>맴버번호</td>
            <td>몇번강의</td>
            <td>구매가격</td>
            <td>구매일</td>
         </tr>
 <c:forEach items="${purcharseList }" var="data">
      <tr>
         <td>${data.myCourseVo.my_course_no }</td>
         <td>${data.memberVo.member_no }</td>
         <td>${data.myCourseVo.lecture_no }</td>
         <td>${data.myCourseVo.my_course_purchase_price }</td>
         <td><fmt:formatDate value="${data.myCourseVo.my_course_date}" pattern="yyyy-MM-dd"/></td>  
      </tr>
   </c:forEach>
      </table>
   </form>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
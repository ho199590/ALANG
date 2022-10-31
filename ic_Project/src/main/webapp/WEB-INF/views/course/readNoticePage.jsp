<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>${data.noticeVo.notice_title }</title>
</head>
<body>
	 <!-- header -->
    <div class="jumbotron text-center mb-0">
        <h1>${data.courseVo.course_name }</h1>
        <p>${data.courseVo.course_tuto }</p>
    </div>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a href="#" class="navbar-brand">ALANG</a>
        <!-- Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="#" class="nav-link"></a></li>
                <li class="nav-item"><a href="#" class="nav-link"></a></li>
                <li class="nav-item"><a href="#" class="nav-link"></a></li>
            </ul>
        </div>
    </nav>

    <!-- content -->
    <div class="container pt-3">
        <div class="row">
            <!-- left content -->
            <div class="col-sm-2">
            </div>
            <!-- right content -->
            <div class="col-sm-8">
                <h2>${data.noticeVo.notice_title}</h2>                                
                <p class = "float-end"><fmt:formatDate value="${data.noticeVo.notice_registdate }" pattern="yy년 MM월 dd일 hh:mm" /></p>				                
					<c:forEach items="${data.imageVoList }" var="imageVo">
						<img src="/upload/${imageVo.image_link }"><br>
					</c:forEach>					
                <hr>
                <!-- side menu (link) -->
                <div class="text-center">
                </div>
                <p>${data.noticeVo.notice_content }
                </p>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="jumbotron text-center mt-5 mb-0">
        <h3 class="text-secondary">ALANG</h3>
        <p>三人行, 必有我師焉. 擇其善者而從之, 其不善者而改之. <span class="text-primary">Hongku</span> / Designed by <span class="text-primary">孔子</span></p>
    </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
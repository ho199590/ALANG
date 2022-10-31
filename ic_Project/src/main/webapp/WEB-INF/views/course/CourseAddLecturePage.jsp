<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
 hr.hrline{
 	border-top: 3px solid blue;
 }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>강의 등록</title>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row mt-5">
				<div class="col"></div>
				<div class="col-6">
					<form action="addLectureProcess.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="course_no" value="${data.courseVo.course_no }">
						<div class="input-group mb-2">
							<span class="input-group-text" id="basic-addon1">강의 제목 </span> 
							<input class="form-control" type="text" name="course_name" aria-label="Username" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text">강의 설명</span>
							<textarea rows="10" cols="50" name="course_tuto" class="form-control" aria-label="With textarea"></textarea>
						</div> 
						<div class="input-group mb-2">
							<span class="input-group-text" id="basic-addon2">가격 설정 </span>
							<input class="form-control" type="text" value="0" name="course_price" aria-label="Price" aria-describedby="basic-addon2">
							<span class="input-group-text">￦</span> 
						</div>
						<div class="input-group mb-1">
							<input class="form-control" type="file" accept="video/*" name="file" id="inputGroupFile02">
						</div>
						<div class="mb-2">
							<span style="font-size: 15px; color: gray;">※ 첨부파일은 1개만 등록이 가능합니다.</span>
						</div>
						
						<hr class="hrline mb-3">
						
						<div class="mt-4">
							<input class="form-control btn btn-primary" type="submit" value="강의 등록">
						</div>
					</form>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
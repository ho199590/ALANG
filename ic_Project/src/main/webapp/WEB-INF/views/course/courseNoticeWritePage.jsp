<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>공 지 사 항 작 성</title>
</head>
<body>	
	<div class="container p-2 my-2 bg-secondary text-white text-center">
		<h1 class="display-6">공지사항작성</h1>
	</div>
	
    <div class = "container p-3 my-3">
      <form action = "./courseNoticeWriteProcess.do" method="post" enctype="multipart/form-data" id = "notice">
      	<input type = "hidden" name = "course_no" value = "<%= request.getParameter("course_no") %>">
		<div class="form-floating mb-3 mt-3">
			<input type="text" class="form-control" id="title" placeholder="공지제목" name="notice_title">
			<label for="title">공지사항</label>
		</div>
          <label for="comment">Comments:</label>
          <textarea class="form-control" rows="5" id="comment" name="notice_content"></textarea>

          <div class="container p-5 my-3 input-group">
              <input type="file" multiple accept="image/*" class="form-control" name = "files">
          </div>
          <div class="float-end">
			<button type="submit" form="notice" class="btn btn-outline-secondary">등록하기</button>
          </div>
      </form>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
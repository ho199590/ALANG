<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jjquery-3.6.0.slim.min"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>강의 개설 페이지</title>
</head>
<body>
<form action="./courseOpenProcess.do">
	<input type = "hidden" value = "${sessionUser.member_no }">
	<div class="form-group">
		<label for="title">강좌명 :</label>
		<input type="text" class="form-control" placeholder="강좌명을 입력하세요" id="title" name = "course_name">
	</div>
	<div class="form-group">
		<label for="tutorial">강좌 개요 : </label>
		<textarea rows="5" cols="300" id = "tutorial" name = "course_tuto"></textarea>
	</div>
	<div class="form-group">
		<label for="tutorial">강의 대분류 : </label>
		<select class="bigcategory">
		<option value="">전체</option>
		</select>
		
		<label for="tutorial">강의 소분류 : </label>
			<select class="smallcategory" name="smallcategory">
		<option value="">전체</option>
		</select>
		
	</div>
	
	<button type="submit" class="btn btn-primary">개설하기</button>
</form>
<script>
	var jsonBigData = JSON.parse('${bigcategoryList}');
	console.log(jsonBigData);
	
	var BigcateArr = new Array();
	var BigcateObj = new Object();
	for(var i = 0; i < jsonBigData.length; i++) {
		
	
		
		BigcateObj = new Object();  
		BigcateObj.big_category_no = jsonBigData[i].big_category_no;
		BigcateObj.big_category_name = jsonBigData[i].big_category_name;
		BigcateArr.push(BigcateObj);}

	var cate1Select = $("select.bigcategory")
	for(var i = 0; i < BigcateArr.length; i++) {
		cate1Select.append("<option value='" + BigcateArr[i].big_category_no + "'>"
							+ BigcateArr[i].big_category_name + "</option>");	
	}
	
	$(document).on("change", "select.bigcategory", function(){
		
		var jsonSmallData = JSON.parse('${smallcategoryList}');
		var SmallcateArr = new Array();
		var SmallcateObj = new Object();
		
		// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonSmallData.length; i++) {
			
				SmallcateObj = new Object();  //초기화
				SmallcateObj.big_category_no = jsonSmallData[i].big_category_no;
				SmallcateObj.small_category_no = jsonSmallData[i].small_category_no;
				SmallcateObj.small_Category_Name = jsonSmallData[i].small_Category_Name;
				
				SmallcateArr.push(SmallcateObj);
			
		}
		
		var cate2Select = $("select.smallcategory");
		
		/*
		for(var i = 0; i < SmallcateArr.length; i++) {
				cate2Select.append("<option value='" + SmallcateArr[i].small_category_no + "'>"
									+ SmallcateArr[i].small_category_no + "</option>");
		}
*/
	cate2Select.children().remove();

	$("option:selected", this).each(function(){
	
	var selectVal = $(this).val();		
			
	cate2Select.append("<option value='" + selectVal + "'>전체</option>");
	
	for(var i = 0; i < SmallcateArr.length; i++) {
		if(selectVal == SmallcateArr[i].big_category_no) {
			cate2Select.append("<option value='" + SmallcateArr[i].small_category_no + "'>"
								+ SmallcateArr[i].small_Category_Name + "</option>");
		}
	}	
		
	});
	
	
	});
	</script>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 라이브러리 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- js 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="home1.jsp" %>
<!-- addrInfoForm.jsp: 유기동물 등록 화면 -->
<div class="d-flex justify-content-center">

	
	<form action="addrInfoProc.jsp" method="get" style="width:50%" >
	 
	 <div class="mb-3 text-center mb-5">
	  <h1 class="display-4">정보 입력</h1>
	  <div class="Lead text-secondary">
		유기동물의 정보를 입력해주세요
	  </div>
	 
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">이름</label>
	  <input type="text" class="form-control" name="name" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">나이</label>
	  <input type="text" class="form-control" name="age" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">견종</label>
	  <input type="text" class="form-control" name="breed" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">성별</label>
	  <select class="form-select" aria-label="Default select example" name="sex">
	  <option value="0">선택</option>
	  	<option value="수컷">수컷</option>
	    <option value="암컷">암컷</option>
	</select>
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">체중</label>
	  <input type="text" class="form-control" name="weight" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">특징</label><br>
	
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="흰색털">
		  <label class="form-check-label" for="inlineCheckbox1">흰색털</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="갈색털">
		  <label class="form-check-label" for="inlineCheckbox2">갈색털</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="검은색털">
		  <label class="form-check-label" for="inlineCheckbox1">검은색털</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="얼룩">
		  <label class="form-check-label" for="inlineCheckbox2">얼룩</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="활발">
		  <label class="form-check-label" for="inlineCheckbox1">활발</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="조용">
		  <label class="form-check-label" for="inlineCheckbox2">조용</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" name="characteristic" value="온순">
		  <label class="form-check-label" for="inlineCheckbox1">온순</label>
		</div>
	</div>
	
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">발견장소</label>
	  <input type="text" class="form-control" name="place" >
	</div>
	
	
	<input type="submit" class="btn btn-primary btn-sm" value="확인">
	<input type="reset" class="btn btn-primary btn-sm" value="취소"> 
	 
	 
	</form>  
</div>

</body>
</html>
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
<!-- login.jsp: 로그인 화면 -->
<%@ include file="home1.jsp" %> <!-- 상단 바 -->

<div class="d-flex justify-content-center">

	
	<form action="loginProc.jsp"  method="get" style="width:50%" >
	 
	 <div class="mb-3 text-center mb-5">
	  <h1 class="display-4">로그인</h1>
	  </div>
	 
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">아이디</label>
	  <input type="text" class="form-control" name="loginID" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
	  <input type="text" class="form-control" name="loginPassword" >
	</div>
	
	
	<input type="submit" class="btn btn-primary btn-sm" value="로그인">
	<input type="reset" class="btn btn-primary btn-sm" value="취소"> 
	 
	 
	</form>  
</div>

</body>
</html>
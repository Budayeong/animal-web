<%@page import="home.InfoDo"%>
<%@page import="addrBook.addressDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- js 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="home1.jsp" %>
	<jsp:useBean id="adao" class="home.InfoDao"/> 
	<%
		//어떤 주소 데이터를 수정할지 데이터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
	
		//dao에서 getOneAdr() 이용하여 num에 해당되는 데이터 가져오기
		InfoDo ado = adao.getOneAddr(num);
		
		
	%>


<!--  디자인 -->
<div class="d-flex justify-content-center">

	
	<form action="addrInfoModifyProc.jsp" method="get" style="width:50%" >
	
	 
	 <div class="mb-3 text-center mb-5">
	  <h1 class="display-4">정보 수정</h1>
	  <div class="Lead text-secondary">
		유기견/묘의 정보를 수정해주세요
	  </div>
	 
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">이름</label>
	  <input type="text" value="<%= ado.getName() %>" name="name" class="form-control">
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">나이</label>
	  <input type="text" value="<%= ado.getAge() %>" name="age" class="form-control" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">견종</label>
	  <input type="text" value="<%= ado.getBreed() %>" name="breed"  class="form-control" >
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">성별</label>
	  <input type="text" value="<%= ado.getSex() %>" name="sex" class="form-control">
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">체중</label>
	  <input type="text" value="<%= ado.getWeight() %>" name="weight" class="form-control">
	</div>
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">특징</label><br>
	  <input type="text" value="<%= ado.getCharacteristic() %>" name="characteristic" class="form-control">
	</div>
	
	
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">발견장소</label>
	  <input type="text" value="<%= ado.getPlace() %>" name="place" class="form-control">
	</div>
	
	<input type="hidden" name="num" value="<%= ado.getNum() %>">
	<input type="submit" class="btn btn-primary btn-sm" value="수정하기">
	<input type="reset" class="btn btn-primary btn-sm" value="목록보기" onclick="location.href='addrInfoCard.jsp'">  
	 
	
	</form>  
</div>


</body>
</html>
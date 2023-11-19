<%@page import="home.InfoDo"%>
<%@page import="addrBook.addressDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 라이브러리 -->
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
	
      
      <div class="col">
		<div class="card" style="width: 25rem; margin:auto;">
		  <img src="./assets/cat2.jpg" class="card-img-top" alt="..." style="height:10rem;">
		  <div class="card-body">
		    <h5 class="card-title"><%= ado.getName() %></h5>
		    <p class="card-text">
		    	나이: <%= ado.getAge() %>
		    	<br>
		    	견종: <%= ado.getBreed() %>
		    	<br>
		    	성별: <%= ado.getSex() %>
		    	<br>
		    	체중: <%= ado.getWeight() %>
		    	<br>
		    	특징: <%= ado.getCharacteristic() %>
		    	<br>
		    	발견장소: <%= ado.getPlace() %>
		    </p>
		    
		   <input type="button" value="수정하기" class="btn btn-outline-primary"
         	onclick="location.href='addrInfoModify.jsp?num=<%= ado.getNum() %>'">
           <input type="button" value="삭제하기" class="btn btn-outline-primary"
         	onclick="location.href='addrInfoDelete.jsp?num=<%= ado.getNum() %>'">
  		   <input type="button" value="목록보기" class="btn btn-outline-primary"
         	onclick="location.href='addrInfoCard.jsp'">
  
  
    
		  </div>
		</div>
    </div>
    
    
    <!-- card 1 END -->
	

</body>
</html>
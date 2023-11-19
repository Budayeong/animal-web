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
	
	<%
		//한글깨짐 방지
		request.setCharacterEncoding("utf-8");
	%>
	
	
	<!-- 새로셍길 java 파일 -->
	<jsp:useBean id="ado" class="home.InfoDo"/>
	<jsp:setProperty property="*" name="ado"/>
	
	<jsp:useBean id="adao" class="home.InfoDao"/> 
	
	<%
		//체크박스 처리 (여러개 데이터가 전달될 경우, 모두 저장하기 위한 처리)
		String[] characteristic = request.getParameterValues("characteristic");
		String characteristicText = "";
		for(int i=0 ; i <characteristic.length; i++){
			characteristicText += characteristic[i] + ", ";
		}
		
		//out.println("joinText: "+jobText);
		//ado의 job의 값을 jobText 값으로 변경
		ado.setCharacteristic(characteristicText);
		
		//입력된 데이터 저장 (Dao 이용)
		adao.insertAddr(ado);
	%>
	

<!-- 디자인2 -->

<div class="d-flex justify-content-center">

	<form action="addrInfoProc.jsp" method="get" style="width:50%" >
	 
	 <div class="mb-3 text-center mb-5">
	  <h1 class="display-4">정보 확인</h1>
	  <div class="Lead text-secondary">
		유기견/묘의 정보를 확인해주세요
	  </div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">이름</th>
		      <th scope="col">나이</th>
		      <th scope="col">견종</th>
		      <th scope="col">성별</th>
		      <th scope="col">체중</th>
		      <th scope="col">특징</th>
		      <th scope="col">발견장소</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td><%= ado.getName() %></td>
		      <td><%= ado.getAge() %></td>
		      <td><%= ado.getBreed() %></td>
		      <td><%= ado.getSex() %></td>
		      <td><%= ado.getWeight() %></td>
		      <td><%= ado.getCharacteristic() %></td>
		      <td><%= ado.getPlace() %></td>
		    </tr>
		  </tbody>
		</table>
		
		<input type="button" class="btn btn-primary btn-sm" value="목록보기" onclick="location.href='addrInfoCard.jsp';">
</form> 
</div>

</body>
</html>
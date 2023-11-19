<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>addrInfoDelete.jsp</h2>

	<jsp:useBean id="adao" class="home.InfoDao"/> 
	
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		//dao의 deleteAddr() 함수 이용하여 삭제 처리
		adao.deleteAddr(num);
		
		//삭제후에 전체 목록보기로 이동
		response.sendRedirect("addrInfoCard.jsp");
	%>

</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="home.InfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="ado" class="home.InfoDo"/>
	<jsp:setProperty property="*" name="ado"/>
	
	<jsp:useBean id="adao" class="home.InfoDao"/> 
	


<%

	request.setCharacterEncoding("UTF-8");

	int result = adao.login(ado.getLoginID(), ado.getLoginPassword());

	
	if (result == 1) {
		String id = ado.getLoginID();
		String password = ado.getLoginPassword();
		session.setAttribute("sessionID", id); 
		session.setAttribute("sessionPW", password);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='home.jsp';");
		script.println("</script>");
		
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
	} 

	
	
%>



 
	      

</body>
</html>
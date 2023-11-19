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
<!-- home1:상단 바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">

 <a class="navbar-brand" href="#">
	    	
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp"><img src="./assets/babycat.png" width="40" height="34" class="inline-block align-text-top">
	    Go to Home</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="addrInfoForm.jsp">유기동물 등록</a>
        <a class="nav-link" href="addrInfoCard.jsp">유기동물 목록</a>
      </div>
    </div>
  </div>
   						  
<%
		String logout = request.getParameter("logout");
		//logout 변수에 값이 들어있으면(= 로그아웃 버튼이 눌려지면)
		if(logout != null){ 
			session.setAttribute("sessionID", null);
		}
		
	%>
	      	
	 
	 	<!-- 로그인 처리 -->
		<%
			String sessionID = (String)session.getAttribute("sessionID");
		
		
	      	if (sessionID != null){
	      %>
	      
	      		<%=sessionID %>님
	      		<input class="btn btn-outline-primary"	type="button"	value="로그아웃" 
				onclick="location.href='home.jsp?logout=1'"	style="margin-left:20px;">
				<input class="btn btn-outline-primary"	type="button"	value="회원가입" 
				onclick="location.href='join.jsp'"	style="margin-left:20px;">		
	      						  					  
	      						  
	      <%
	      	}
	      	else{
	      %>
	      
	      <input class="btn btn-outline-primary"	type="button"	value="로그인" 
			onclick="location.href='login.jsp'"	style="margin-left:20px;">
		 <input class="btn btn-outline-primary"	type="button"	value="회원가입" 
			onclick="location.href='join.jsp'"	style="margin-left:20px;">						  
	      						  
	      <%
	      	}
	      %>

</nav> 
</body>
</html>
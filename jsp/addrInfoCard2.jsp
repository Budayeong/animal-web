<%@page import="home.InfoDo"%>
<%@page import="addrBook.addressDo"%>
<%@page import="java.util.ArrayList"%>
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
<!-- addrInfoCard2.jsp: home에 나타나는 유기동물 목록 화면 -->


<jsp:useBean id="adao" class="home.InfoDao"/> 

<%
	//주소록 전체 데이터 가져오기
	ArrayList<InfoDo> aList = adao.getAllAddr();

%>


<div class="container">	
  <div class="service-header text-center mb-5">
  <h1 class="display-4">유기동물 목록</h1>
  <div class="Lead text-secondary">
  	보호기간동안 동물들의 충분한 정보를 열람해보세요	
  </div>
  <!-- 검색창 -->
  <div class="d-flex justify-content-end">
		<div class="row">
			<form method="get" name="search" action="search.jsp">
				<table class="pull-right">
					<tr>
						<td>
						<select class="form-select" aria-label="Default select example" name="searchField">
						  <option value="1">검색 내용</option>
						  <option value="name">이름</option>
						  <option value="breed">견종</option>
						</select>
						</td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- 게시글 정렬 -->
	<div class="d-flex justify-content-end">
			<div class="row">
				<form method="get" name="range" action="rangePage.jsp">
					<table class="pull-right">
						<tr>
							<td>
							<select class="form-select" aria-label="Default select example" name="rangeField">
							  <option value="1">정렬 내용</option>
							  <option value="name">이름</option>
							  <option value="breed">견종</option>
							  <option value="sex">성별</option>
							  <option value="weight">체중</option>
							</select>
							</td>
							<td>
							<td><button type="submit" class="btn btn-success">정렬</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	
  <div class="row">
  <% //카드에 데이터를 for문으로 넣어줌
  	for(int i=0 ; i<aList.size() ; i++){
  		//aListt 어레이로 부터 하나씩 데이터 가져와서 ado 저장...
  		InfoDo ado = aList.get(i);
  %>
    <div class="col">
		<div class="card" style="width: 18rem; margin:auto;">
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
		    <a href="addrInfo.jsp?num=<%=ado.getNum()%>" class="btn btn-primary">더보기</a>
		  </div>
		</div>
    </div>
    <!-- card 1 END -->

   
  <%
  	}
  %>
 </div>
</div>

</body>
</html>
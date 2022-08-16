<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome~</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4">
		<h3>Please Sign In</h3>
		<%
			String error = request.getParameter("error");
			if(error != null){	//error가 있으면
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요");
				out.println("</div>");
			}
		%>
		<form action="j_security_check" method="post">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" name="j_username" class="form-control"
						placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label for="inputUserPassword" class="sr-only">Password</label>
					<input type="password" name="j_password" class="form-control"
						placeholder="Password" required>
			</div>
			<button type="submit" class="btn btn-success btn-block">로그인</button>
		</form>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
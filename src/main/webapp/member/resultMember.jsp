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
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 정보</h1>
		</div>
	</div>
	
	<div class="container">
		<%
			String msg = request.getParameter("msg");
			if(msg != null){
				if(msg.equals("0")){
					out.println("<h2 class='alert alert-danger'>회원 정보가 수정되었습니다.</h2>");
				}else if(msg.equals("1")){
					out.println("<h2 class='alert alert-danger'>회원 가입을 축하합니다.</h2>");
				}else if(msg.equals("2")){
					String loginId = (String)session.getAttribute("sessionId");
					out.println("<h2 class='alert alert-danger'>" + loginId + "님 환영합니다.</h2>");
				}
			}else{
				out.println("<h2 class='alert alert-danger'>회원 정보가 삭제되었습니다.</h2>");
			}
		
		%>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
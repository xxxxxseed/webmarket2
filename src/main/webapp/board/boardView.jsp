<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<h1 class="display-3">게시글 상세 보기</h1>
		</div>
	</div>
	
	<div class="container">
		<form action="/boardUpdateAction.do" method="post">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="com-sm-5">
					<input type="text" name="name" value="${board.name }" class="form-control" readonly>
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="com-sm-5">
					<input type="text" name="subject" value="${board.subject }" 
						placeholder="subject" class="form-control">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="com-sm-5">
					<textarea name="content" rows="5" cols="50"
						placeholder="content" class="form-control"><c:out value="${board.content }" /></textarea>
				</div>			
			</div>
			<div class="form-group row">
				<div class="com-sm-3">
					<a href="/boardListAction.do" class="btn btn-primary">목록</a>
				</div>			
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
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
			<h1 class="display-3">게시판 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div>
			<table class="table table-hover">
				<tr>
					<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
				</tr>
				<c:forEach items="${boardList }" var="board">
				<tr>
					<td><c:out value="${board.num }" /></td>
					<td><a href="/boardView.do?num=<c:out value="${board.num }" />"><c:out value="${board.subject }" /></a></td>
					<td><c:out value="${board.name }" /></td>
					<td><c:out value="${board.writeDate }" /></td>
					<td><c:out value="${board.hit }" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div align="right">
			<a href="/boardWriteForm.do" class="btn btn-success">글쓰기</a>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
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
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	
	<div class="container">
		<form action="./processShippingInfo.jsp" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="com-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="com-sm-3">
					<input type="text" name="shippingDate" class="form-control">(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="com-sm-3">
					<input type="text" name="country" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="com-sm-3">
					<input type="text" name="zipCode" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="com-sm-3">
					<input type="text" name="addressName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="com-sm-3">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" 
						class="btn btn-secondary">이전</a>
					<input type="submit" value="등록" class="btn btn-primary">
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
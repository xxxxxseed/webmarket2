<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">Home</a>
		</div>
	</div>
	
	<div>
		<ul class="navbar-nav">
			<li class="nav-item"><a href="./products.jsp" class="nav-link">상품 목록</a></li>
		</ul>
	</div>
	<div>
		<ul class="navbar-nav">
			<li class="nav-item"><a href="./addProduct.jsp" class="nav-link">상품 등록</a></li>
			<li class="nav-item"><a href="./editProduct.jsp?edit=update" class="nav-link">상품 수정</a></li>
			<li class="nav-item"><a href="./editProduct.jsp?edit=delete" class="nav-link">상품 삭제</a></li>
		</ul>
	</div>
	
</nav>
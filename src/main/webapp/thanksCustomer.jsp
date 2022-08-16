<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
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
<%

	String shipping_cartId = "";		//주문 번호
	String shipping_shippingDate = "";	//배송일
	
	Cookie[] cookies = request.getCookies();	//쿠키 받기(배열)
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if(name.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
			
		}
	}
	
%>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p>주문은 <%=shipping_shippingDate %>에 배송될 예정입니다.
		<p>주문번호: <%=shipping_cartId %>에 배송될 예정입니다.
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
<%
	//모든 세션 삭제
	session.invalidate();

	//모든 쿠키 삭제
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if(name.equals("Shipping_cartId"))
				cookie.setMaxAge(0);	//유효기간을 0				
			if(name.equals("Shipping_name"))
				cookie.setMaxAge(0);				
			if(name.equals("Shipping_shippingDate"))
				cookie.setMaxAge(0);				
			if(name.equals("Shipping_country"))
				cookie.setMaxAge(0);				
			if(name.equals("Shipping_zipCode"))
				cookie.setMaxAge(0);				
			if(name.equals("Shipping_addressName"))
				cookie.setMaxAge(0);				
			
			//클라이언트 컴퓨터에 삭제된 쿠키 보내줌
			response.addCookie(cookie);
		}
	}
%>
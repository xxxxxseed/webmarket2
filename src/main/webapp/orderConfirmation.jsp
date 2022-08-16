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
	request.setCharacterEncoding("utf-8");

	//쿠키를 받아서 사용할 변수
	String cartId = session.getId();	//주문 번호 - 세션 아이디
	String shipping_cartId = "";		//주문 번호
	String shipping_name = "";			//주문자 이름
	String shipping_shippingDate = "";	//배송일
	String shipping_country = "";		//국가
	String shipping_zipCode = "";		//우편번호
	String shipping_addressName = "";	//주소
	
	Cookie[] cookies = request.getCookies();	//쿠키 받기(배열)
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();		//쿠키이름
			if(name.equals("Shipping_cartId"))	//쿠키이름과 같으면
				//쿠키 값을 가져옴
				shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_name"))
				shipping_name = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_country"))
				shipping_country = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode(cookie.getValue(), "utf-8");
			if(name.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode(cookie.getValue(), "utf-8");
		}
	}
%>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소<br> 성명: <%=shipping_name %></strong><br>
				우편번호: <%=shipping_zipCode %><br>
				주소: <%=shipping_addressName %>(<%=shipping_country %>)
			</div>
			<div class="col-4" align="right">
				<p><em>배송일: <%=shipping_shippingDate %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소개</th>
				</tr>
				<%
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					if(cartList == null){
						cartList = new ArrayList<>();
					}
					int sum = 0;
					for(int i=0; i<cartList.size(); i++){
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum += total;	//총액
				%>
				<tr>
					<td class="text-center"><%=product.getPname() %></td>
					<td class="text-center"><%=product.getQuantity() %></td>
					<td class="text-center"><%=product.getUnitPrice() %></td>
					<td class="text-center"><%=total %></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=sum %></strong></td>
				</tr>
			</table>
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary"> 이전 </a>
			<a href="./thanksCustomer.jsp" class="btn btn-success"> 주문 완료 </a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary"> 취소 </a>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
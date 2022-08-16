<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//쿠키 발행
	Cookie cartId = new Cookie("Shipping_cartId",
			URLEncoder.encode(request.getParameter("cartId"), "utf-8"));		//쿠키 이름 - 주문번호
	Cookie name = new Cookie("Shipping_name",
			URLEncoder.encode(request.getParameter("name"), "utf-8"));			//쿠키 이름 - 이름
	Cookie shippingDate = new Cookie("Shipping_shippingDate",
			URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));	//쿠키 이름 - 배송일
	Cookie country = new Cookie("Shipping_country",
			URLEncoder.encode(request.getParameter("country"), "utf-8"));		//쿠키 이름 - 국가
	Cookie zipCode = new Cookie("Shipping_zipCode",
			URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));		//쿠키 이름 - 우편번호
	Cookie addressName = new Cookie("Shipping_addressName",
			URLEncoder.encode(request.getParameter("addressName"), "utf-8"));	//쿠키 이름 - 주소
			
	//쿠키 유효기간 1일
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	//클라이언트 컴퓨터로 쿠키 보내기
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	//주문 정보(영수증) 페이지로 이동
	response.sendRedirect("orderConfirmation.jsp");
%>
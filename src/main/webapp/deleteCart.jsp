<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	session.invalidate();	//장바구니 세션 삭제
	
	response.sendRedirect("cart.jsp");

%>
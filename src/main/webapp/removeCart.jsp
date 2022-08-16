<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	ProductRepository dao = ProductRepository.getInstance();
	
	//장바구니 리스트 가져오기
	ArrayList<Product> cartList = 
		(ArrayList<Product>)session.getAttribute("cartList");
	
	Product goodsQnt = new Product();
	for(int i=0; i<cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	//페이지 이동
	response.sendRedirect("cart.jsp");
%>
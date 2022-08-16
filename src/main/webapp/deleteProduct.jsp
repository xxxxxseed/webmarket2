<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconn.jsp" %>
<%
	String productId = request.getParameter("id");
	
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM product WHERE p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("./editProduct.jsp?edit=delete");

%>
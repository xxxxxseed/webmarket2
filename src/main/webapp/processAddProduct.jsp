<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");	//한글 인코딩
	//파일의 경로
	String realFolder = "C:/Dev/jspworks/WebMarket2/src/main/webapp/upload/";
	int maxSize = 5 * 1024 * 1024;	//최대 업로드 파일 크기: 5MB
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,
			encType, new DefaultFileRenamePolicy());
	
	//multi로 폼 입력값 받기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	

	//숫자 자료형 변환
	int price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	
	//이미지 파일 가져오기
	Enumeration<?> files = multi.getFileNames();	//파일 가져오기 반복
	String fname = (String)files.nextElement();		//파일 이름
	String productImage = multi.getFilesystemName(fname);
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitsInStock);
	}
	
	//dao 상품 추가
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, pname);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, productImage);
	pstmt.executeUpdate();	//실행
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("./products.jsp");

%>
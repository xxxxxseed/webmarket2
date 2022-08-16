<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 등록</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="./resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<!-- 선언문 태그 -->
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
		<%@ include file="./dbconn.jsp" %>
		<%
			String productId = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM product WHERE p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
		%>
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("p_productImage") %>" alt="image"
					style="width: 100%">
			</div>
			<div class="col-md-7">
				<form action="./processUpdateProduct.jsp" method="post"
					enctype="multipart/form-data" name="newProduct">
					<div class="form-group row">
						<label class="col-sm-2">상품 코드</label>
						<div class="col-sm-3">
							<input type="text" name="productId" id="productId"
								value="<%=rs.getString("p_id") %>" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" name="pname" id="pname"
								value="<%=rs.getString("p_name") %>" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="unitPrice"
								value="<%=rs.getInt("p_unitPrice") %>" id="unitPrice" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품 설명</label>
						<div class="col-sm-5">
							<textarea rows="2" cols="50" name="description"
								class="form-control"><%=rs.getString("p_description") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer"
								value="<%=rs.getString("p_manufacturer") %>" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category"
								value="<%=rs.getString("p_category") %>" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" name="unitsInStock"
								value="<%=rs.getLong("p_unitsInStock") %>" id="unitsInStock" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"></label>
						<div class="col-sm-5">
							<% if(rs.getString("p_condition").equals("New")){ %>
							<label><input type="radio" name="condition" value="New" checked>신규 제품</label>
							<label><input type="radio" name="condition" value="Old">중고 제품</label>
							<label><input type="radio" name="condition" value="Refurbished">재생 제품</label>
							<% }else if(rs.getString("p_condition").equals("Old")){ %>
							<label><input type="radio" name="condition" value="New">신규 제품</label>
							<label><input type="radio" name="condition" value="Old" checked>중고 제품</label>
							<label><input type="radio" name="condition" value="Refurbished">재생 제품</label>
							<% }else if(rs.getString("p_condition").equals("Refurbished")){ %>
							<label><input type="radio" name="condition" value="New">신규 제품</label>
							<label><input type="radio" name="condition" value="Old">중고 제품</label>
							<label><input type="radio" name="condition" value="Refurbished" checked>재생 제품</label>
							<% } %>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage"
								value="<%=rs.getString("p_productImage") %>" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<input type="button" class="btn btn-primary" 
								value="등록" onclick="checkAddProduct()">
						</div>
					</div>
				</form>
			</div>
			<%
			}
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			%>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

%>
<body>
	<!-- DB 연결 실행 -->
	<sql:setDataSource var="dataSource"
		driver = "com.mysql.cj.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
		user = "root"
		password = "12345"
	/>
	
	<!-- 로그인 처리 -->
	<sql:query var="resultSet" dataSource="${dataSource }">
		SELECT * FROM member WHERE id=? and password=?
		<sql:param value="<%=id %>" />
		<sql:param value="<%=password %>" />
	</sql:query>

	<!-- 일치하는 id, password 있으면 세션 발급 -->
	<c:forEach items="${resultSet.rows }" var="row">
		<% session.setAttribute("sessionId", id); %>
		<c:redirect url="resultMember.jsp?msg=2" />
	</c:forEach>
	
	<c:redirect url="loginMember.jsp?error=1"></c:redirect>
</body>
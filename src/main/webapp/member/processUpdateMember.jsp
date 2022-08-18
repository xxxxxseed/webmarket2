<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
	request.setCharacterEncoding("utf-8");	//한글 인코딩
	//폼 입력된 자료 가져오기
	String id =request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameterValues("birthmm")[0];
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	//등록일 설정
	/*Date currentDateTime = new Date(System.currentTimeMillis());
	Timestamp timestamp = new Timestamp(currentDateTime.getTime());*/
%>
<body>
	<!-- DB 연결 실행 -->
	<sql:setDataSource var="dataSource"
		driver = "com.mysql.cj.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
		user = "root"
		password = "12345"
	/>

	<!-- update 쿼리문 작성 -->
	<sql:update dataSource="${dataSource }" var="resultSet">
		UPDATE member SET password=?, name=?, gender=?, birth=?,
							mail=?, phone=?, address=? WHERE id=?
		<sql:param value="<%=password %>" />
		<sql:param value="<%=name %>" />
		<sql:param value="<%=gender %>" />
		<sql:param value="<%=birth %>" />
		<sql:param value="<%=mail %>" />
		<sql:param value="<%=phone %>" />
		<sql:param value="<%=address %>" />
		<sql:param value="<%=id %>" />
	</sql:update>
	
	<!-- 페이지 이동 -->
	<c:if test="${resultSet >= 1 }">
		<c:redirect url="resultMember.jsp?msg=0" />
	</c:if>
</body>
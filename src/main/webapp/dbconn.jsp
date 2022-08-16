<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc 연동</title>
</head>
<%
	String driverClass = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?" 
		+ "useUnicode=true&serverTimezone=Asia/Seoul";
	String username = "root";
	String password = "12345";
	
	Connection conn = null;
	
	try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url, username, password);
		//out.println(conn + " db 연결");
	}catch(Exception e){
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println(e.getMessage());
	}
	//close() 하지 않아야 함

%>
<body>

</body>
</html>
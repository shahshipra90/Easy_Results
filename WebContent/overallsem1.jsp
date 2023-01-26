<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alert</title>
</head>
<%@page import="java.sql.* ,java.util.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = conn.createStatement();
ResultSet rs;

	String dept = request.getParameter("department");
 	String sem = request.getParameter("semester");
 	
 	if (conn != null) {
 	    System.out.println("Connected to database #1");
 	}
 	rs = st.executeQuery("select * from overall_result where semester='" + sem + "'");
 	if (rs.next()) {
 		//session.setAttribute("dept", dept);
 		session.setAttribute("sem", sem);
 	    response.sendRedirect("manage_overall.jsp");
 	} else {
 		session.setAttribute("msg", "Entered Semester Results are not registered");  
 	    response.sendRedirect("overallsem.jsp");
 	}
%>
</body>
</html>
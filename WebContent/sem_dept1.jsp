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
try 
{
	//Connection conn = null;
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
     Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/er","root", "");
	 if (conn != null) {
         System.out.println("Connected to database #1");
     }
	 else{
		 
	 }
                         
Statement psmnt = conn.createStatement();

String dept=request.getParameter("department");
String seme=request.getParameter("semester");
//String mail=request.getParameter("mail");
//String mon=request.getParameter("mon");

ResultSet rs;
rs = psmnt.executeQuery("select * from reg where department='" + dept + "' and sem='" + seme + "'");
//rs = psmnt.executeQuery("select * from reg where enrollment='" + mail + "'");
//rs = psmnt.executeQuery("select * from reg where sem='" + seme + "'");
	if (rs.next()) {
		session.setAttribute("dept", dept);
		session.setAttribute("seme", seme);
	    response.sendRedirect("registeredstudents.jsp");
	} else {
		session.setAttribute("msg", "Entered Department and Semester students have not yet registered");  
	    response.sendRedirect("dept_sem1.jsp");
	} }
	 catch(Exception e)
 {
		System.out.println(e);
 }	
%>
</body>
</html>
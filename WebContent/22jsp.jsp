<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
	Statement st = conn.createStatement();
	PreparedStatement pstatement = null;
	
	String name = request.getParameter("text1");
 	String password = request.getParameter("password");
 	if (conn != null) {
 	    System.out.println("Connected to database #1");
 	}
 	System.out.println(name);
 	System.out.println(password);
 	pstatement=conn.prepareStatement ("INSERT INTO demo(name,password) values (?,?)");
 	pstatement.setString(1,name);
 	pstatement.setString(2,password);
 	int i= pstatement.executeUpdate();
 	if(i>0)
 	{
 	session.setAttribute("name",name);
 	response.sendRedirect("1.jsp");
 	}
 	else
 	{
 		//response.sendRedirect("2.jsp");
 	}
}
 	catch(Exception e)
 	{
 		System.out.print(e);
 	}


%>
</body>
</html>
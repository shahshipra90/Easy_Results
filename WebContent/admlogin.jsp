<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
String uname = request.getParameter("uname");
System.out.println(uname);
String pwd = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from admin_login where username='" + uname + "' and password='" + pwd + "'");
if (rs.next()) {
	session.setAttribute("uname", uname);  
    response.sendRedirect("dashboard.jsp");
} else {
	session.setAttribute("msg", "Please check your login details");  
    response.sendRedirect("adminlogin.jsp");
}
%>
</body>
</html>
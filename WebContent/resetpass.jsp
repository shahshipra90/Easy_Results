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
String enrol = request.getParameter("uname");
//int a=Integer.parseInt(enrol);
//System.out.println(enrol);
// System.out.println(a);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from reg where enrollment='" + enrol + "'");
if (rs.next()) {
    //session.setAttribute("enrollment",a );
    response.sendRedirect("forgotpassword.jsp");
} else {
	session.setAttribute("msg", "Enrollment not registered, Please try again!");  
    response.sendRedirect("resetpassword.jsp");
}
	%>
	<script>
    /*alert("Enrollment not registered, Please try again!");
    //response.sendRedirect("alert1.jsp");
    window.location="resetpassword.jsp";*/
    </script><%

    %>
</body>
</html>
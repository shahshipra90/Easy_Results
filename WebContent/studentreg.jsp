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
String enroll = request.getParameter("enroll");
System.out.println(enroll);
//String pwd = request.getParameter("opass");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = conn.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from reg where enrollment='" + enroll + "'");
if (rs.next()) {
	%>
	<script>
		alert("Enrollment already registered");
		window.location = "studentregistration.jsp";
	</script>
	<% 
}
else{
try
{
	
	PreparedStatement pstatement = null;
	
	String fname = request.getParameter("fname");
 	String lname = request.getParameter("lname");
 	String mail = request.getParameter("mail");
 	String conmail = request.getParameter("conmail");
 	String altmail = request.getParameter("altmail");
 	String pass = request.getParameter("pass");
 	String conpass = request.getParameter("cpass");
 	String gen = request.getParameter("radio1");
 	String phn = request.getParameter("phno");
    enroll = request.getParameter("enroll");
 	String course = request.getParameter("course");
 	String college = request.getParameter("clg");
 	String sem = request.getParameter("sem");
 	String dept = request.getParameter("dept");
 	String exam = request.getParameter("xam");
 	String cap = request.getParameter("captcha");
 	
 	if (conn != null) {
 	    System.out.println("Connected to database #1");
 	}
 	System.out.println(fname);
 	System.out.println(lname);
 	System.out.println(mail);
 	System.out.println(conmail);
 	System.out.println(altmail);
 	System.out.println(pass);
 	System.out.println(conpass);
 	System.out.println(gen);
 	System.out.println(phn);
 	System.out.println(enroll);
 	System.out.println(course);
 	System.out.println(college);
 	System.out.println(sem);
 	System.out.println(dept);
 	System.out.println(exam);
 	System.out.println(cap);
 	if(pass.equals(conpass)){

 	
 	pstatement=conn.prepareStatement ("INSERT INTO reg(firstname,lastname,email,confirmemail,altemail,password,conpassword,gender,phone,enrollment,course,college,sem,department,exam,captchacode) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
 	pstatement.setString(1,fname);
 	pstatement.setString(2,lname);
 	pstatement.setString(3,mail);
 	pstatement.setString(4,conmail);
 	pstatement.setString(5,altmail);
 	pstatement.setString(6,pass);
 	pstatement.setString(7,conpass);
 	pstatement.setString(8,gen);
 	pstatement.setString(9,phn);
 	pstatement.setString(10,enroll);
 	pstatement.setString(11,course);
 	pstatement.setString(12,college);
 	pstatement.setString(13,sem);
 	pstatement.setString(14,dept);
 	pstatement.setString(15,exam);
 	pstatement.setString(16,cap);
 	
 	
 	
 	int i= pstatement.executeUpdate();
 	if(i>0)
 	{
 	response.sendRedirect("studentlogin.jsp");
 	}
 	else
 	{
 		response.sendRedirect("studentregistration.jsp");
 	}
 	}
 	else{
 		%>
 		<script>
 			alert("Password's do not match");
 			window.location = "studentregistration.jsp";
 		</script>
 		
 		<%
 	}
 	}

 	catch(Exception e)
 	{
 		System.out.print(e);
 	}
}

%>
</body>
</html>
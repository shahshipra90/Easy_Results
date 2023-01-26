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

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = conn.createStatement();

try
{
	
	PreparedStatement pstatement = null;
	
	String dept = request.getParameter("department");
	String sem = request.getParameter("semester");
 	String sub1 = request.getParameter("sub1");
 	String sub2 = request.getParameter("sub2");
 	String sub3 = request.getParameter("sub3");
 	String sub4 = request.getParameter("sub4");
 	String sub5 = request.getParameter("sub5");
 	String sub6 = request.getParameter("sub6");
 	String sub7 = request.getParameter("sub7");
 	
 	String c1 = request.getParameter("c1");
 	String c2 = request.getParameter("c2");
 	String c3 = request.getParameter("c3");
 	String c4 = request.getParameter("c4");
 	String c5 = request.getParameter("c5");
 	String c6 = request.getParameter("c6");
 	String c7 = request.getParameter("c7");
 	
 	String pm1 = request.getParameter("pm1");
 	String pm2 = request.getParameter("pm2");
 	String pm3 = request.getParameter("pm3");
 	String pm4 = request.getParameter("pm4");
 	String pm5 = request.getParameter("pm5");
 	String pm6 = request.getParameter("pm6");
 	String pm7 = request.getParameter("pm7");
 	
 	String tm1 = request.getParameter("tm1");
 	String tm2 = request.getParameter("tm2");
 	String tm3 = request.getParameter("tm3");
 	String tm4 = request.getParameter("tm4");
 	String tm5 = request.getParameter("tm5");
 	String tm6 = request.getParameter("tm6");
 	String tm7 = request.getParameter("tm7");
 	String st1 = request.getParameter("total");
 	float subtotal = Float.parseFloat(st1);
 	if (conn != null) {
 	    System.out.println("Connected to database #1");
 	}
 	System.out.println(dept);
 	System.out.println(sem);
 	System.out.println(sub1);
 	System.out.println(sub2);
 	System.out.println(sub3);
 	System.out.println(sub4);
 	System.out.println(sub5);
 	System.out.println(sub6);
 	System.out.println(sub7);
 	
 	System.out.println(c1);
 	System.out.println(c2);
 	System.out.println(c3);
 	System.out.println(c4);
 	System.out.println(c5);
 	System.out.println(c6);
 	System.out.println(c7);
 	
 	System.out.println(pm1);
 	System.out.println(pm2);
 	System.out.println(pm3);
 	System.out.println(pm4);
 	System.out.println(pm5);
 	System.out.println(pm6);
 	System.out.println(pm7);
 	
  	System.out.println(tm1);
 	System.out.println(tm2);
 	System.out.println(tm3);
 	System.out.println(tm4);
 	System.out.println(tm5);
 	System.out.println(tm6);
 	System.out.println(tm7);
 	System.out.println(subtotal);
 	
 	pstatement=conn.prepareStatement ("INSERT INTO subject(department,semester,subject1,subject2,subject3,subject4,subject5,subject6,subject7,code1,code2,code3,code4,code5,code6,code7,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,subtotal) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
 	//pstatement=conn.prepareStatement ("INSERT INTO subject(code1,code2,code3,code4,code5,code6,code7) values (?,?,?,?,?,?,?)");
 	//pstatement=conn.prepareStatement ("INSERT INTO subject(practical1,practical2,practical2,practical3,practical4,practical5,practical6,practical7) values (?,?,?,?,?,?,?)");
 	//pstatement=conn.prepareStatement ("INSERT INTO subject(theory1,theory2,theory3,theory4,theory5,theory6,theory7) values (?,?,?,?,?,?,?)");
 	
 	pstatement.setString(1,dept);
 	pstatement.setString(2,sem);
 	pstatement.setString(3,sub1);
 	pstatement.setString(4,sub2);
 	pstatement.setString(5,sub3);
 	pstatement.setString(6,sub4);
 	pstatement.setString(7,sub5);
 	pstatement.setString(8,sub6);
 	pstatement.setString(9,sub7);
 	
 	pstatement.setString(10,c1);
 	pstatement.setString(11,c2);
 	pstatement.setString(12,c3);
 	pstatement.setString(13,c4);
 	pstatement.setString(14,c5);
 	pstatement.setString(15,c6);
 	pstatement.setString(16,c7);
 	
 	pstatement.setString(17,pm1);
 	pstatement.setString(18,pm2);
 	pstatement.setString(19,pm3);
 	pstatement.setString(20,pm4);
 	pstatement.setString(21,pm5);
 	pstatement.setString(22,pm6);
 	pstatement.setString(23,pm7);
 	
 	pstatement.setString(24,tm1);
 	pstatement.setString(25,tm2);
 	pstatement.setString(26,tm3);
 	pstatement.setString(27,tm4);
 	pstatement.setString(28,tm5);
 	pstatement.setString(29,tm6);
 	pstatement.setString(30,tm7);
 	
 	pstatement.setFloat(31,subtotal);
 	
 	
 	int i= pstatement.executeUpdate();
 	if(i>0)
 	{
 		session.setAttribute("dept", dept);
 		session.setAttribute("sem", sem);
 		//System.out.println("done");
		response.sendRedirect("addedsubject.jsp");
 	}
 	else
 	{   
 		%>
 		<script>
 			alert("Subject not added");
 			window.location="addsubject.jsp";
 		</script>
 		<%
 		//response.sendRedirect("addsubject.jsp");
 	}
 	
 	 	}

 	catch(Exception e)
 	{
 		System.out.print(e);
 	}


%>
</body>
</html>
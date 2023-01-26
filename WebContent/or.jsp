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
//String enroll = request.getParameter("enroll");
//System.out.println(enroll);
//String pwd = request.getParameter("opass");
String sem = request.getParameter("semester");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = conn.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from overall_result where semester='" + sem + "'");
if (rs.next()) {
	%>
	<script>
		alert("Semester's Result is already Done");
		window.location = "overallresult.jsp";
	</script>
	<% 
}
else{
try
{
	
	PreparedStatement pstatement = null;
	
	
	//sem = request.getParameter("semester");
 	
 	
 	String c1 = request.getParameter("c1");
 	String c2 = request.getParameter("c2");
 	String c3 = request.getParameter("c3");
 	String c4 = request.getParameter("c4");
 	String c5 = request.getParameter("c5");
 	String c6 = request.getParameter("c6");
 	String c7 = request.getParameter("c7");
 	
 	String p1 = request.getParameter("p1");
 	String p2 = request.getParameter("p2");
 	String p3 = request.getParameter("p3");
 	String p4 = request.getParameter("p4");
 	String p5 = request.getParameter("p5");
 	String p6 = request.getParameter("p6");
 	String p7 = request.getParameter("p7");
 	
 	String f1 = request.getParameter("f1");
 	String f2 = request.getParameter("f2");
 	String f3 = request.getParameter("f3");
 	String f4 = request.getParameter("f4");
 	String f5 = request.getParameter("f5");
 	String f6 = request.getParameter("f6");
 	String f7 = request.getParameter("f7");
 	
 	if (conn != null) {
 	    System.out.println("Connected to database #1");
 	}
 	//System.out.println(dept);
 	System.out.println(sem);
 	
 	
 	System.out.println(c1);
 	System.out.println(c2);
 	System.out.println(c3);
 	System.out.println(c4);
 	System.out.println(c5);
 	System.out.println(c6);
 	System.out.println(c7);
 	
 	System.out.println(p1);
 	System.out.println(p2);
 	System.out.println(p3);
 	System.out.println(p4);
 	System.out.println(p5);
 	System.out.println(p6);
 	System.out.println(p7);
 	
  	System.out.println(f1);
 	System.out.println(f2);
 	System.out.println(f3);
 	System.out.println(f4);
 	System.out.println(f5);
 	System.out.println(f6);
 	System.out.println(f7);
 	
 	pstatement=conn.prepareStatement ("INSERT INTO overall_result(semester,comp_code,comp_pass,comp_fail,it_code,it_pass,it_fail,elec_code,elec_pass,elec_fail,ec_code,ec_pass,ec_fail,civil_code,civil_pass,civil_fail,mech_code,mech_pass,mech_fail,aero_code,aero_pass,aero_fail) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
 	
 	
 	
 	pstatement.setString(1,sem);
 	
 	
 	pstatement.setString(2,c1);
 	pstatement.setString(3,p1);
 	pstatement.setString(4,f1);
 	pstatement.setString(5,c2);
 	pstatement.setString(6,p2);
 	pstatement.setString(7,f2);
 	pstatement.setString(8,c3);
 	pstatement.setString(9,p3);
 	pstatement.setString(10,f3);
 	pstatement.setString(11,c4);
 	pstatement.setString(12,p4);
 	pstatement.setString(13,f4);
 	pstatement.setString(14,c5);
 	pstatement.setString(15,p5);
 	pstatement.setString(16,f5);
 	pstatement.setString(17,c6);
 	pstatement.setString(18,p6);
 	pstatement.setString(19,f6);
 	pstatement.setString(20,c7);
 	pstatement.setString(21,p7);
 	pstatement.setString(22,f7);
 	
 	
 	int i= pstatement.executeUpdate();
 	if(i>0)
 	{
 		//session.setAttribute("dept", dept);
 		session.setAttribute("sem", sem);
		response.sendRedirect("manage_overall.jsp");
 	}
 	else
 	{   
 		%>
 		<script>
 			alert("Data not added");
 			window.location="overallresult.jsp";
 		</script>
 		<%
 		//response.sendRedirect("addsubject.jsp");
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
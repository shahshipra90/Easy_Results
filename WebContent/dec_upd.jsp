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
String upd = request.getParameter("update");
String dec = request.getParameter("declare");
String res_dec = request.getParameter("exam");
String res_upd = request.getParameter("exam1");
try
{
	PreparedStatement pstatement;
	
	if(conn != null){
		System.out.println("Connected to Database #1");
	}
	System.out.println(res_dec);
	System.out.println(res_upd);
	
	/* if(dec!=null){
			res_upd="Not Updated";
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_declare) values (?)");
			//pstatement.setString(1,res_dec);
			//pstatement.setString(2,res_upd)
			//pstatement.setString(1,res_dec);
			//pstatement.setString(2,res_upd);
		}
	     else if(upd!=null){
	    	 //System.out.println("done");
			res_dec="Not Declared";
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_update) values (?)");
			//pstatement=conn.prepareStatement("INSERT IGNORE INTO res_dec_upd (result_update) value (?)");
			//pstatement.setString(1,res_dec);
	         //pstatement.setString(1,res_upd);
			//pstatement.setString(1,res_dec);
			//pstatement.setString(2,res_upd);
		}
		else {
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_declare,result_update) values (?,?)");	
			//pstatement.setString(1,res_dec);
			//pstatement.setString(2,res_upd);
		}*/
		
		
		
		if(dec!=null){
			res_upd="Not Updated";
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_declare, result_update) values(?,?)");
			pstatement.setString(1,res_dec);
			pstatement.setString(2,"Not Updated");
		}
		else if(upd!=null){			
			res_dec="Not Declared";
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_declare, result_update) values(?,?)");
			pstatement.setString(1,"Not Declared");
			pstatement.setString(2,res_upd);
		}
		else{
			pstatement=conn.prepareStatement("INSERT INTO res_dec_upd (result_declare,result_update) values(?,?)");
			pstatement.setString(1,res_dec);
			pstatement.setString(2,res_upd);
		}
	
	int i = pstatement.executeUpdate();
	if(i>0){
		session.setAttribute("res_dec",res_dec);
		session.setAttribute("res_upd",res_upd);
		response.sendRedirect("dashboard.jsp");
	}
	else{
		response.sendRedirect("declared_updated.jsp");
	}
}
catch(Exception e){
	System.out.println(e);
	}
%>
</body>	
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<link rel = "stylesheet" href = "studentlogin.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<style>
	.msg{
		color: red;
		font-size: 25px;
		margin-left: 150px;
		//font-style: bold;
	}
	.thh{
	font-size:30px;
	}
</style>
</head>
<body background = "background.jpg">
<%@ page import ="java.sql.*" %>
<jsp:include page="header.jsp"/><hr>
<form action = "changepass.jsp" method = "post" onsubmit="return validate()">
    <table border = 0>
      <tr><th colspan = "2" ><b class = "thh">Change Password</b></th></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">&nbsp;Note :  * Indicates mandatory fields</td></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">*</span>&nbsp;Enrollment</td><td><input type = "text" name = "enroll" id = "enroll" required value = ""></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;Old Password</td><td><input type = "password" name = "opass" id = "opass" required></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;New Password</td><td><input type = "password" name = "pass" id = "pass" required></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;Confirm Password</td><td><input type = "password" name = "cpass" id = "cpass" required></td></tr>
        <tr><td colspan = "2"><a href = ""><center><input type = "submit" value = "Reset" class = "button" id = "btn" name = "button"></center></a></td></tr>
    </table>
  </form>
<span class = "msg"><marquee height= "20%" width = "20%" direction = "left"> <b>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session==null || session.getAttribute("enroll")==null)
{
	response.sendRedirect("studentlogin.jsp"); 
}
else{	
try{
  		String data = session.getAttribute("msg").toString();
  		out.print(data);
  		session.removeAttribute("msg");
  	}
	catch(Exception e){
	}
}
%></b></marquee></span>
<script>
  function validate(){
	  var pwd = document.getElementById("pass").value;
	  var cpwd = document.getElementById("cpass").value;
	  
	  var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,30}$/;
	  	if(!pwd.match(pattern)){
	  		alert("Enter atleast 8 charachters, one lowercase, one uppercase, one numeric digit, and one special character");
	  		return false;
	  	}
	  	return true;
  }              
  </script>
</body>
</html>
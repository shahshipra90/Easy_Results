<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Password</title>
<link rel = "stylesheet" href = "studentlogin.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<style>
	.msg{
		color: red;
		font-size: 25px;
		margin-left: 150px;
		//font-style: bold;
	}
</style>
</head>
<body background = "background.jpg">
<form action = "forgotpass.jsp" method = "post" name = "form" onsubmit = "return validate()"><br><br><br><br><hr>
    <table border = 0>
      <tr><th colspan = "2"><b>New Password</th></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">&nbsp;Note :  * Indicates mandatory fields</td></tr>
        <tr></tr>
        <tr></tr>
      <tr><td><span class = "required">*</span>&nbsp;<input type = "password" name = "pass" id = "pass" required placeholder = "New Password"></td></tr>
      <tr><td><span class = "required">*</span>&nbsp;<input type = "password" name = "cpass" id = "cpass" required placeholder = "Confirm Password"></td></tr>
      <tr><td colspan = "2"><center><input type = "submit" value = "Reset"  class = "button" id = "btn" name = "button"></center></td></tr>
    </table>
  </form>
  <br>
    <span class = "msg"><marquee height= "20%" width = "20%" direction = "left"> <b><%
	try{
  		String data = session.getAttribute("msg").toString();
  		out.print(data);
  		session.removeAttribute("msg");
	}
	catch(Exception e){
	}
%></b></marquee></span>
<script>
  function validate(){
	  var pwd = document.getElementById("pass").value;
	  var cpwd = document.getElementById("cpass").value;
	  
	  var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,30}$/;
	  	if(!pwd.match(pattern)){
	  		alert("Enter atleast one lowercase, one uppercase, one numeric digit, and one special character");
	  		return false;
	  	}
	  	return true;
  }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<title>Admin Login</title>
  <link rel = "stylesheet" href = "studentlogin.css">
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
	<form action = "admlogin.jsp" method = "post" name = "form"><br><br><br><br><hr>
      <table border = 0>
        <tr><th><b>Admin Panel Login</th></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">&nbsp;Note :  *Indicates mandatory fields</td></tr>
        <tr></tr>
        <tr></tr>
        <tr><td align = "center"><span class = "required">*</span>&nbsp;<input type = "text" placeholder = "Username" maxlength = "12" name = "uname" id = "uname" required></td></tr>
        <tr><td align = "center"><span class = "required">*</span>&nbsp;<input type = "password" placeholder = "Password" name = "pass" id = "pass" required></td></tr>
        <tr><td align = "center"><label><a href = "adminresetpass.jsp">Forgot Password?</a></label></td></tr>
      <!--   <tr><td align = "center"><button id = "refresh" onclick = "reload();"><img src = "refresh.png" width="30" height="30"></button>&nbsp; &nbsp; &nbsp;<canvas id="canvas" name = "canvas" width="120" height="30" style="background-image:url('captchabg.jpg');"></td></tr> 
        <tr><td align = "center"><span class = "required">*</span>&nbsp;<input type = "text" id ="capid"  name="captcha" placeholder="Enter captcha" required></td></tr>  -->
        <tr><td align = "center"><input type = "submit" class = "button" id = "btn" name = "button"></td></tr>
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
</body>
</html>
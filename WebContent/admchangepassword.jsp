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
		margin-top: 20px;
		color: red;
		font-size: 25px;
		margin-left: 600px;
		//font-style: bold;
	}
	.th{
	font-size:30px;
	}
	table{
		//margin-left: 520px;
	}
	hr{
	border: 1px solid black;
}
.title{
  margin-left: 290px;
  color: black;
  font-size: 25px;
  margin-top: 30px;
}
	
</style>
</head>
<body background = "">
<%@ page import ="java.sql.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session==null || session.getAttribute("uname")==null)
{
	response.sendRedirect("adminlogin.jsp"); 
}
else{
	
	try 
	{
   	 Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/er","root", "");
   	 if (conn != null) {
            System.out.println("Connected to database #1");
        }
   	 else{
   		 
   	 }
   	 Statement psmnt = conn.createStatement();
   	
   	 String uname = (String)session.getAttribute("uname");
   			 System.out.println(uname);
   			 ResultSet rs;
                rs = psmnt.executeQuery("SELECT * from admin_login where username='"+uname+"'");
                if (rs.next())
                {
                	uname = rs.getString("username");                  	
                	%>  


<header>
      <pre name = "uname"><%=uname %>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
<div class="title">
       Change Password<hr>
      </div>
<form action = "admchangepass.jsp" method = "post" onsubmit="return validate()">
   <center> <table border = 0>
      <tr><th colspan = "2" class = "th"><b>Change Password</b></th></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">&nbsp;Note :  * Indicates mandatory fields</td></tr>
        <tr></tr>
        <tr></tr>
        <tr><td><span class = "required">*</span>&nbsp;Username</td><td><input type = "text" name = "uname" id = "uname" required value = ""></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;Old Password</td><td><input type = "password" name = "opass" id = "opass" required></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;New Password</td><td><input type = "password" name = "pass" id = "pass" required></td></tr>
        <tr><td><span class = "required">*</span>&nbsp;Confirm Password</td><td><input type = "password" name = "cpass" id = "cpass" required></td></tr>
        <tr><td colspan = "2"><a href = ""><center><input type = "submit" value = "Reset" class = "button" id = "btn" name = "button"></center></a></td></tr>
    </table></center>
  </form>
   <%       
		  
                                }
                    }             
                    catch(Exception e)
                    {
System.out.println(e);
                    }
	}
                        %>
<span class = "msg"><marquee height= "20%" width = "20%" direction = "left"> <b>
<%
	
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
	  		alert("Enter atleast 8 charachters, one lowercase, one uppercase, one numeric digit, and one special character");
	  		return false;
	  	}
	  	return true;
  }              
  </script>
</body>
</html>
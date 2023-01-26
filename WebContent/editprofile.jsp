<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Your Profile</title>
<link rel = "stylesheet" href = "studentregistration.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body background = "background.jpg">
<jsp:include page="header.jsp"/><hr>
 <%
   String fname,lname,clg,enroll,mail,amail, ph, ct, seme, dpt, xam = "null";
  %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session==null || session.getAttribute("enroll")==null)
{
	response.sendRedirect("studentlogin.jsp"); 
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
                   	 String roll = (String)session.getAttribute("enroll");
                   			 System.out.println(roll);
                   			 ResultSet rs;
                                rs = psmnt.executeQuery("SELECT * from reg where enrollment='"+roll+"'");
                                if (rs.next())
                                {
                                	fname = rs.getString("firstname");
                                	lname = rs.getString("lastname");
                                	clg = rs.getString("college");
                                	roll=rs.getString("enrollment");
                                	mail=rs.getString("email");
                                	amail=rs.getString("altemail");
                                	ph=rs.getString("phone");
                                	ct=rs.getString("course");
                                	seme=rs.getString("sem");
                                	dpt=rs.getString("department");
                                	xam=rs.getString("exam");
                                	%>
                               
  <form action = "editprof.jsp" method = "post">                     	
    <table>
       <tr><th colspan = "4"><b>Edit Profile</th></tr>
       <tr></tr>
       <tr></tr>
       <tr></tr>
       <tr></tr>
       <tr><td><span class = "required">&nbsp;Note :  * Indicates mandatory fields</td></tr>
       <tr></tr>
       <tr></tr>
       <tr><td><span class = "required">*</span>First Name</td><td><input type = "text" name = "fname" required value = "<%=fname%>"></td></tr>
       <tr><td>&nbsp;&nbsp;Last Name</td><td><input type = "text" name = "lname" value = "<%=lname%>"></td></tr>
       <tr><td><span class = "required">*</span>E-mail</td><td><input type = "email" name = "mail" required value = "<%=mail%>"></td></tr>
       <tr><td><span class = "required">*</span>Alternate E-mail</td><td><input type = "email" name = "altmail" id = "altmail" requried value = "<%=amail%>"></td></tr>       
       <tr><td><span class = "required">*</span>Phone No.</td><td><input type = "text" maxlength = "10" name = "phno" required value = "<%=ph%>"></td></tr>
       <tr><td><span class = "required">*</span>Enrollment</td><td><input type = "text" maxlength = "12" name = "enroll" required value = "<%=roll%>"></td></tr>
       <tr><td><span class = "required">*</span>Course Type</td><td><input type = "text" maxlength = "12" name = "course" id = "course" required value = "<%=ct%>"><!-- <select required name = "course" value = "">
        <option value = "" selected></option>
        <option value = "None">None</option>
        <option value = "Diploma">Diploma</option>
        <option value = "BE">BE</option>
        <option value = "MCA">MCA</option>
        <option value = "MBA">MBA</option>
      </select> --></td></tr>
      <tr><td><span class = "required">*</span>College</td><td><input type = "text" name = "clg" required value = "<%=clg%>">
      <tr><td><span class = "required">*</span>Semester</td><td><select required name = "sem" value = "">
        <option value = "<%=seme%>" selected><%out.print(seme); %></option>
        <option value = "None">None</option>
        <option value = "Sem 1">Sem 1</option>
        <option value = "Sem 2">Sem 2</option>
        <option value = "Sem 3">Sem 3</option>
        <option value = "Sem 4">Sem 4</option>
        <option value = "Sem 5">Sem 5</option>
        <option value = "Sem 6">Sem 6</option>
        <option value = "Sem 7">Sem 7</option>
        <option value = "Sem 8">Sem 8</option>
      </select></td></tr>
      <tr><td><span class = "required">*</span>Department</td><td><select required name = "dept" value = "">
        <option value = "<%=dpt%>" selected><%out.print(dpt); %></option>
        <option value = "None">None</option>
        <option value = "Computer Enggineering"> Computer Enggineering</option>
        <option value = "IT Enggineering">IT Enggineering</option>
        <option value = "Electrical Enggineering">Electrical Enggineering</option>
        <option value = "E & C Enggineering"> E & C Enggineering</option>
        <option value = "Civil Enggineering"> Civil Enggineering</option>
        <option value = "Mechnical Enggineering">Mechnical Enggineering</option>
        <option value = "Aeronautical Enggineering">Aeronautical Enggineering</option>
      </select></td></tr>
      <tr><td><span class = "required">*</span>Exam</td><td><input type = "month" name = "exam" value = "<%=xam%>">
      <tr></tr>
      <tr></tr>
      <tr><td colspan = "4" align = "center"><a href = ""><input type = "submit" class = "button" id = "btn" value = "Submit"></a></td></tr>
  </table>
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
</body>
</html>
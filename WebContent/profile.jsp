<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Profile</title>
<link rel = "stylesheet" href = "profile.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
</head>
<%@page import="java.sql.*,java.util.*"%>
<body background = "background.jpg">
  <jsp:include page="header.jsp"/>
  <hr>
  <%
   String fname,lname,clg,enroll,mail,amail, ph, ct, seme, dpt, xam = "null";
  %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if(session==null || session.getAttribute("enroll")==null)
	{
		response.sendRedirect("studentlogin.jsp"); 
	}
	else 
	{
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
 
    <div class="r" style="margin-top: -150px">
			<fieldset>
				<legend>
					<h2>Your Profile</h2>
				</legend>
				<pre>

					
<center><table cellpadding = "10">
<tr><td>Name :</td>
<td><%=fname %>&nbsp;<%=lname %></td></tr>
<tr><td>College Name : </td>
<td><%=clg %></td></tr>
<tr><td>Enrollment : </td>
<td><%=roll %></td></tr>
<tr><td>Email : </td>
<td><%=mail %></td></tr>
<tr><td>Alternative Email :</td>
<td><%=amail %></td></tr>
<tr><td>Phone Number : </td>
<td><%=ph%></td></tr> 
<tr><td>Course Type : </td>
<td><%=ct %></td></tr>
<tr><td>Semester : </td>
<td><%=seme %></td></tr>
<tr><td>Department : </td>
<td><%=dpt %></td></tr>
<tr><td>Exam : </td>
<td><%=xam %></td></tr>
</table></center>
</pre>
</fieldset>
</div>
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
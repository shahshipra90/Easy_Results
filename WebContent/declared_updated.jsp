<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel = "stylesheet" href = "declared_updated.css">
<title>Updated & Declared Results</title>
</head>
<%@page import="java.sql.*,java.util.*"%>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session==null || session.getAttribute("uname")==null)
	{
		response.sendRedirect("adminlogin.jsp"); 
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
        Updated & Declared Results<hr>
      </div>
      <table>
      <form action = "dec_upd.jsp" method= "post">
      <thead>
      	<tr>
	      	<th><span name = "declare">Declared</span></th>
	      	<th><span name =  "update">Updated</span></th>
	    </tr>
	   </thead>
	 <tbody>
      <tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 1">&nbsp;&nbsp;&nbsp;Regular Sem 1</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 1">&nbsp;&nbsp;&nbsp;Regular Sem 1</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 1">&nbsp;&nbsp;&nbsp;Remedial Sem 1</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 1">&nbsp;&nbsp;&nbsp;Remedial Sem 1</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 2">&nbsp;&nbsp;&nbsp;Regular Sem 2</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 2">&nbsp;&nbsp;&nbsp;Regular Sem 2</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 2">&nbsp;&nbsp;&nbsp;Remedial Sem 2</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value= "Remedial Sem 2">&nbsp;&nbsp;&nbsp;Remedial Sem 2</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 3">&nbsp;&nbsp;&nbsp;Regular Sem 3</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 3">&nbsp;&nbsp;&nbsp;Regular Sem 3</td>
      	</tr>
      	<tr>
     		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 3">&nbsp;&nbsp;&nbsp;Remedial Sem 3</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 3">&nbsp;&nbsp;&nbsp;Remedial Sem 3</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 4">&nbsp;&nbsp;&nbsp;Regular Sem 4</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 4">&nbsp;&nbsp;&nbsp;Regular Sem 4</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 4">&nbsp;&nbsp;&nbsp;Remedial Sem 4</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 4">&nbsp;&nbsp;&nbsp;Remedial Sem 4</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 5">&nbsp;&nbsp;&nbsp;Regular Sem 5</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 5">&nbsp;&nbsp;&nbsp;Regular Sem 5</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value ="Remedial Sem 5">&nbsp;&nbsp;&nbsp;Remedial Sem 5</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 5">&nbsp;&nbsp;&nbsp;Remedial Sem 5</td>
      	</tr>
      		<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 6">&nbsp;&nbsp;&nbsp;Regular Sem 6</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 6">&nbsp;&nbsp;&nbsp;Regular Sem 6</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 6">&nbsp;&nbsp;&nbsp;Remedial Sem 6</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value="Remedial Sem 6">&nbsp;&nbsp;&nbsp;Remedial Sem 6</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 7">&nbsp;&nbsp;&nbsp;Regular Sem 7</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 7">&nbsp;&nbsp;&nbsp;Regular Sem 7</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 7">&nbsp;&nbsp;&nbsp;Remedial Sem 7</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 7">&nbsp;&nbsp;&nbsp;Remedial Sem 7</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Regular Sem 8">&nbsp;&nbsp;&nbsp;Regular Sem 8</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Regular Sem 8">&nbsp;&nbsp;&nbsp;Regular Sem 8</td>
      	</tr>
      	<tr>
      		<td><input type = "checkbox" class="check" name = "exam" value = "Remedial Sem 8">&nbsp;&nbsp;&nbsp;Remedial Sem 8</td>
      		<td><input type = "checkbox" class="check" name = "exam1" value = "Remedial Sem 8">&nbsp;&nbsp;&nbsp;Remedial Sem 8</td>
      	</tr>
      	<tr>
      		<td colspan="5"><center><input type = "submit" name = "btn" class = "sbtn" value="Submit"></center></td>
      	</tr>
		</tbody></form>
      </table>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Sem & Department</title>
<link rel = "stylesheet" href = "dept_sem.css">
    <style>
	.msg{
		color: black;
		font-size: 25px;
		margin-left: 500px;
		//font-style: bold;
	}
</style>
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
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
      <pre name = "uname"><%=uname%>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
	<div class="title">
        Select Sem & Department<hr>
      </div>
      <br /><br /><br />
        <form action="overallsem1.jsp" method = "post">
        <center><table class = "dept">
            <tr>
              <td>
                Semester
              </td>
              <td>
                <select name = "semester" required placeholder = "None">
                  <option value = ""></option>
                  <option value = "Sem 1">Sem 1</option>
                  <option value = "Sem 2">Sem 2</option>
                  <option value = "Sem 3">Sem 3</option>
                  <option value = "Sem 4">Sem 4</option>
                  <option value = "Sem 5 ">Sem 5</option>
                  <option value = "sem 6">Sem 6</option>
                  <option value = "Sem 7">Sem 7</option>
                  <option value = "Sem 8">Sem 8</option>
                </select>
              </td>
            </tr>
           
                <tr>
              <td colspan = "2" >
                <a href = "#"><center><input type = "submit" value = "GO" name = "submit" id = "submit" class= "subbtn"/></center></a>
              </td>
            </tr>
          </table></center>
            <%       
		  
                                }
                    }             
                    catch(Exception e)
                    {
System.out.println(e);
                    }
	}
                        %>
                        <span class = "msg"><marquee height= "20%" width = "40%" direction = "left"> <b><%
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
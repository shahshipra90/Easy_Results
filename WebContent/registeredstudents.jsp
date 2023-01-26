<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Students</title>
<link rel = "stylesheet" href = "registeredstudents.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
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
	 
	 
		String fname, lname, enroll, sem,dept="null";
	
                   	 Class.forName("com.mysql.jdbc.Driver").newInstance();
                   	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/er","root", "");
                   	Statement psmnt = conn.createStatement();
                   	ResultSet rs;
                   	 if (conn != null) {
                            System.out.println("Connected to database #1");
                        }
                   	 else{
                   		 
                   	 }
                   	 %>
                   	  <%
                 
                 String uname = (String)session.getAttribute("uname");
                   			 System.out.println(uname);
                   			 //ResultSet rs;
                                rs = psmnt.executeQuery("SELECT * from admin_login where username='"+uname+"'");
                                if (rs.next())
                                {
                                	uname = rs.getString("username");
                                }
                                	%>  
                                	<%
                                	  dept = (String)session.getAttribute("dept");
                               		System.out.println(dept);
                               		sem = (String)session.getAttribute("seme");
                              		 System.out.println(sem);
                                	rs = psmnt.executeQuery("SELECT COUNT(*) FROM reg where department='"+dept+"' and sem='"+sem+"' ");
                                	String Countstudents="";
                                	%>
<header>
      <pre name = "uname"><%=uname %>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
      <div class="title">
        Registered Students<hr>
      </div>
      <br /><br /><br />
      <table class = "total_students">
      	<table class = "dept">
      	<%
      		while(rs.next()){
			Countstudents = rs.getString(1);     		
%>
            <tr>
              <td>
                Total Students
              </td>
              <td>
              <%=Countstudents %>
              </td>
             </tr>
             <%
      		}
             rs = psmnt.executeQuery("SELECT * from reg where department='"+dept+"' and sem='"+sem+"'");
             %>
      	<tr>
      		<td>
      			Department
      		</td>
      		<td>
      			<%=dept %>
      		</td>
      	</tr>
      		<tr>
      			<td>
      				Semester
      			</td>
      			<td>
      				<%=sem %>
      			</td>
      		</tr>
         </table>
       <br /><br />
       <table class = "students" border="0">
            <thead>
            <tr>
              <th>Student Name</th>
              <th>Enrollment</th>
              <th>Course</th>
              <th>Department</th>
              <th></th>
            </tr>
           </thead>
           
           <tbody>
          <%
           while (rs.next())
           {

               
	           fname=rs.getString("firstname");
	           lname=rs.getString("lastname");
	           enroll=rs.getString("enrollment");
	           dept=rs.getString("department");
	           sem=rs.getString("sem");
	           
           %>
            <tr>
            	<td><%=fname %>&nbsp;&nbsp;<%=lname %></td>
            	<td><%=enroll %></td>
            	<td><%=dept %></td>
            	<td><%=sem %></td>
 				<form action="studentdetails.jsp" method="post">
 				<td><input type="submit" class="subbtn" value="Get Details"></td>
				<input type="hidden" name="roll" value="<%=enroll %>"> </form></tr>
            <%
     		      }
             %>
           </tbody>
          </table> 
       <%       
      // session.setAttribute("enroll",enroll);
       
					} 
 
                    catch(Exception e)
                    {
System.out.println(e);
                    }
	
	}
      %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recent Result Details</title>
<link rel = "stylesheet" href = "managesubject.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
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
                   		 
                   	 }%>
                    	<%
                    	 Statement psmnt = conn.createStatement();
                   	 String uname = (String)session.getAttribute("uname");
             			 System.out.println(uname);
             		 ResultSet rs;
                          rs = psmnt.executeQuery("SELECT * from admin_login where username='"+uname+"'");
                          if (rs.next())
                          {
                          	uname = rs.getString("username");    
                          }
%>
<%
                   	
                 /*  	    String  enroll = (String)session.getAttribute("enroll");
                   		 System.out.println(enroll);
                   		String dept = (String)session.getAttribute("dept");
                  		 System.out.println(dept);
                  		String sem = (String)session.getAttribute("sem");
                 		 System.out.println(sem);*/
                 		 String enroll = request.getParameter("enroll");
                 		 String sem = request.getParameter("semester");
                 		 String dept = request.getParameter("department");
                   		//	 ResultSet rs;
                   		
                   		if(dept.equals("Computer Enggineering") && sem.equals(sem)){	
                   			rs = psmnt.executeQuery("SELECT * from result_ce where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("IT Enggineering") && sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_it where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("Electrical Enggineering")&& sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_electrical where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("E & C Enggineering")&& sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_ec where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("Civil Enggineering")&& sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_civil where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("Mechnical Enggineering")&& sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_mech where enrollment='"+enroll+"'");
                   		   }
                   		   else if(dept.equals("Aeronautical Enggineering")&& sem.equals(sem)){
                   			rs = psmnt.executeQuery("SELECT * from result_aero where enrollment='"+enroll+"'");
                   		   }
                   		  else{
                   			%>
                   			<script>
                   			alert("Department does't exist");
                   			</script>
                   			<%
                   	   }
                   		if(rs.next()){
                   			session.setAttribute("dept",dept);
                   			session.setAttribute("sem",sem);
                   			session.setAttribute("enroll",enroll);
                   			response.sendRedirect("manageresult.jsp");
                    
					}  else{
						session.setAttribute("msg", "Entered Department and Semester students result have not yet registered");  
						response.sendRedirect("res_dept_sem1.jsp");}           }
                catch(Exception e)
                {
System.out.println(e);
                }

}
                   		%>
  </body>
</html>
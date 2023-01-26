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
                   			session.setAttribute("msg", "This Students result is already registered");  
    						response.sendRedirect("addresult.jsp");
					}  else{
					
						try
			   			{
			   				
							PreparedStatement pstatement = null;
			   			 	String pm1 = request.getParameter("pm1");
			   			 	String pm2 = request.getParameter("pm2");
			   			 	String pm3 = request.getParameter("pm3");
			   			 	String pm4 = request.getParameter("pm4");
			   			 	String pm5 = request.getParameter("pm5");
			   			 	String pm6 = request.getParameter("pm6");
			   			 	String pm7 = request.getParameter("pm7");
			   			 	
			   			 	String tm1 = request.getParameter("tm1");
			   			 	String tm2 = request.getParameter("tm2");
			   			 	String tm3 = request.getParameter("tm3");
			   			 	String tm4 = request.getParameter("tm4");
			   			 	String tm5 = request.getParameter("tm5");
			   			 	String tm6 = request.getParameter("tm6");
			   			 	String tm7 = request.getParameter("tm7");
			   			 	
			   			 	int st1 = Integer.parseInt(request.getParameter("st1"));
			   			 	String st2 = request.getParameter("st2");
			   				String st3 = request.getParameter("st3");
			   				String st4 = request.getParameter("st4");
			   				String st5 = request.getParameter("st5");
			   				String st6 = request.getParameter("st6");
			   				String st7 = request.getParameter("st7");
			   			 	
			   			 	String total = request.getParameter("total");
			   			 	String per = request.getParameter("per");
			   			 	
			   			 	if (conn != null) {
			   			 	    System.out.println("Connected to database #1");
			   			 	}
			   			 	else{}
			   			 	System.out.println(dept);
			   			 	System.out.println(sem);
			   			 	System.out.println(enroll);
			   			 	
			   			 	System.out.println(pm1);
			   			 	System.out.println(pm2);
			   			 	System.out.println(pm3);
			   			 	System.out.println(pm4);
			   			 	System.out.println(pm5);
			   			 	System.out.println(pm6);
			   			 	System.out.println(pm7);
			   			 	
			   			  	System.out.println(tm1);
			   			 	System.out.println(tm2);
			   			 	System.out.println(tm3);
			   			 	System.out.println(tm4);
			   			 	System.out.println(tm5);
			   			 	System.out.println(tm6);
			   			 	System.out.println(tm7);
			   			 	
			   			 	//System.out.println(bl);
			   			 	//System.out.println(spi);
			   			 	
			   			 	System.out.println(st1);
			   				System.out.println(st2);
			   				System.out.println(st3);
			   				System.out.println(st4);
			   				System.out.println(st5);
			   				System.out.println(st6);
			   				System.out.println(st7);
			   			 	
			   			 	
			   			 	
			   if(dept.equals("Computer Enggineering")){	
			 	pstatement=conn.prepareStatement ("INSERT INTO result_ce(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("IT Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_it(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("Electrical Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_electrical(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("E & C Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_ec(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("Civil Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_civil(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("Mechnical Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_mech(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else if(dept.equals("Aeronautical Enggineering")){
				   pstatement=conn.prepareStatement ("INSERT INTO result_aero(department,semester,enrollment,practical1,practical2,practical3,practical4,practical5,practical6,practical7,theory1,theory2,theory3,theory4,theory5,theory6,theory7,st1,st2,st3,st4,st5,st6,st7,total,percentage) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			   }
			   else{

			   }
			 	pstatement.setString(1,dept);
			 	pstatement.setString(2,sem);
			 	pstatement.setString(3,enroll);
			 	
			 	pstatement.setString(4,pm1);
			 	pstatement.setString(5,pm2);
			 	pstatement.setString(6,pm3);
			 	pstatement.setString(7,pm4);
			 	pstatement.setString(8,pm5);
			 	pstatement.setString(9,pm6);
			 	pstatement.setString(10,pm7);
			 	
			 	pstatement.setString(11,tm1);
			 	pstatement.setString(12,tm2);
			 	pstatement.setString(13,tm3);
			 	pstatement.setString(14,tm4);
			 	pstatement.setString(15,tm5);
			 	pstatement.setString(16,tm6);
			 	pstatement.setString(17,tm7);
			 	
			 	pstatement.setInt(18,st1);
			 	pstatement.setString(19,st2);
			 	pstatement.setString(20,st3);
			 	pstatement.setString(21,st4);
			 	pstatement.setString(22,st5);
			 	pstatement.setString(23,st6);
			 	pstatement.setString(24,st7);
			 	
			 	pstatement.setString(25,total);
			 	pstatement.setString(26,per);
			 	
			 	int i= pstatement.executeUpdate();
			 	if(i>0)
			 	{
			 		session.setAttribute("dept", dept);
			 		session.setAttribute("enroll", enroll);
			 		session.setAttribute("sem", sem);
					response.sendRedirect("addedresult.jsp");
			 	}
			 	else
			 	{   
			 		%>
			 		<script>
			 			alert("Result not added");
			 			window.location="addresult.jsp";
			 		</script>
			 		<%
			 		//response.sendRedirect("addsubject.jsp");
			 	}
			 	
			   			}
			 	catch(Exception e)
			 	{
			 		System.out.print(e);
			 	}

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
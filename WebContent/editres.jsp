<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
	<%
					String dept,sem,enroll="null";
					String p1,p2,p3,p4,p5,p6,p7="null";
					String t1,t2,t3,t4,t5,t6,t7="null";
	%>
	<%
	try 
	{
    	//Connection conn = null;
    	 Class.forName("com.mysql.jdbc.Driver").newInstance();
    	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/er","root", "");
    	 if (conn != null) {
             System.out.println("Connected to database #1");
         }
    	 else{
    		 
    	 }
    	 Statement psmnt = conn.createStatement();
    	 PreparedStatement ps = null;
    	 dept=request.getParameter("department");
		 sem=request.getParameter("semester");
		enroll=request.getParameter("enroll");
		 
		 p1=request.getParameter("pm1");
		 p2=request.getParameter("pm2");
		 p3=request.getParameter("pm3");
		 p4=request.getParameter("pm4");
		 p5=request.getParameter("pm5");
		 p6=request.getParameter("pm6");
		 p7=request.getParameter("pm7");
		 t1=request.getParameter("tm1");
		 t2=request.getParameter("tm2");
		 t3=request.getParameter("tm3");
		 t4=request.getParameter("tm4");
		 t5=request.getParameter("tm5");
		 t6=request.getParameter("tm6");
		 t7=request.getParameter("tm7");
		 
		 System.out.println(dept);
		 System.out.println(sem);
		 System.out.println(enroll);
		
		 System.out.println(p1);
		 System.out.println(p2);
		 System.out.println(p3);
		 System.out.println(p4);
		 System.out.println(p5);
		 System.out.println(p6);
		 System.out.println(p7);
		 
		 System.out.println(t1);
		 System.out.println(t2);
		 System.out.println(t3);
		 System.out.println(t4);
		 System.out.println(t5);
		 System.out.println(t6);
		 System.out.println(t7);
		
		 if(dept.equals("Computer Enggineering")){	
			  ps=conn.prepareStatement ("update result_ce set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else if(dept.equals("IT Enggineering")){
				   ps=conn.prepareStatement ("update result_it set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else if(dept.equals("Electrical Enggineering")){
				    ps=conn.prepareStatement ("update result_electrical set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");;
			   }
			   else if(dept.equals("E & C Enggineering")){
				    ps=conn.prepareStatement ("update result_ec set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else if(dept.equals("Civil Enggineering")){
				    ps=conn.prepareStatement ("update result_civil set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else if(dept.equals("Mechnical Enggineering")){
				     ps=conn.prepareStatement ("update result_mech set department=?, semester=?,enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else if(dept.equals("Aeronautical Enggineering")){
				    ps=conn.prepareStatement ("update result_aero set department=?,semester=?, enrollment=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
			   }
			   else{

			   }
		// PreparedStatement ps=conn.prepareStatement("update result_ce set department=?, semester=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where enrollment='"+enroll+"'");
		
		 
		 ps.setString(1,dept);
		 ps.setString(2,sem);
	     ps.setString(3,enroll);
	     
		 ps.setString(4,p1);
		 ps.setString(5,p2);
		 ps.setString(6,p3);
		 ps.setString(7,p4);
		 ps.setString(8,p5);
		 ps.setString(9,p6);
		 ps.setString(10,p7);
		 
		 ps.setString(11,t1);
		 ps.setString(12,t2);
		 ps.setString(13,t3);
		 ps.setString(14,t4);
		 ps.setString(15,t5);
		 ps.setString(16,t6);
		 ps.setString(17,t7);
		 
		 int i= ps.executeUpdate();
		 
		 if(i>0)
		 {
			 session.setAttribute("dept",dept);
			 session.setAttribute("sem",sem);
			 session.setAttribute("enroll",enroll);
			 response.sendRedirect("manageresult.jsp");
		 }
		 else
		 {
			 response.sendRedirect("editresult.jsp");
		 }
		                        
		                    }    
		                   
		                    
		                    catch(Exception e)
		                    {
		System.out.println(e);
		                    }
		                    
	%>
</body>
</html>






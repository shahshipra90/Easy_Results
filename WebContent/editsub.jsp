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
					String dept,sem,s1,s2,s3,s4,s5,s6,s7="null";
					String c1,c2,c3,c4,c5,c6,c7="null";
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
    	 dept=request.getParameter("department");
		 sem=request.getParameter("semester");
		 s1=request.getParameter("sub1");
		 s2=request.getParameter("sub2");
		 s3=request.getParameter("sub3");
		 s4=request.getParameter("sub4");
		 s5=request.getParameter("sub5");
		 s6=request.getParameter("sub6");
		 s7=request.getParameter("sub7");
		 c1=request.getParameter("c1");
		 c2=request.getParameter("c2");
		 c3=request.getParameter("c3");
		 c4=request.getParameter("c4");
		 c5=request.getParameter("c5");
		 c6=request.getParameter("c6");
		 c7=request.getParameter("c7");
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
		 System.out.println(s1);
		 System.out.println(s2);
		 System.out.println(s3);
		 System.out.println(s4);
		 System.out.println(s5);
		 System.out.println(s6);
		 System.out.println(s7);
		 System.out.println(c1);
		 System.out.println(c2);
		 System.out.println(c3);
		 System.out.println(c4);
		 System.out.println(c5);
		 System.out.println(c6);
		 System.out.println(c7);
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
		 //preparedStatement ps = conn
				 
		//String sb="UPDATE  subject set department=?,semester=?,subject1=?,subject2=?,subject3=?,subject4=?,subject5=?,subject6=?,subject7=?,code1=?,code2=?,code3=?,code4=?,code5=?,code6=?,code7=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where department="+dept;
		 PreparedStatement ps=conn.prepareStatement("update subject set department=?, semester=?,subject1=?,subject2=?,subject3=?,subject4=?,subject5=?,subject6=?,subject7=?,code1=?,code2=?,code3=?,code4=?,code5=?,code6=?,code7=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where department='"+dept+"' and semester='"+sem+"'");
		// ps=conn.prepareStatement("update subject set department=?, semester=?,subject1=?,subject2=?,subject3=?,subject4=?,subject5=?,subject6=?,subject7=?,code1=?,code2=?,code3=?,code4=?,code5=?,code6=?,code7=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where department='"+dept+"'");
		//ps=conn.prepareStatement("update subject set department=?, semester=?,subject1=?,subject2=?,subject3=?,subject4=?,subject5=?,subject6=?,subject7=?,code1=?,code2=?,code3=?,code4=?,code5=?,code6=?,code7=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where semester='"+sem+"'");
		// ps=conn.prepareStatement("update subject set department=?,subject1=?,subject2=?,subject3=?,subject4=?,subject5=?,subject6=?,subject7=?,code1=?,code2=?,code3=?,code4=?,code5=?,code6=?,code7=?,practical1=?,practical2=?,practical3=?,practical4=?,practical5=?,practical6=?,practical7=?,theory1=?,theory2=?,theory3=?,theory4=?,theory5=?,theory6=?,theory7=? where semester=?");
		//PreparedStatement ps = conn.prepareStatement(sb); 
		 
		 ps.setString(1,dept);
		 ps.setString(2,sem);
		 ps.setString(3,s1);
		 ps.setString(4,s2);
		 ps.setString(5,s3);
		 ps.setString(6,s4);
		 ps.setString(7,s5);
		 ps.setString(8,s6);
		 ps.setString(9,s7);
		 ps.setString(10,c1);
		 ps.setString(11,c2);
		 ps.setString(12,c3);
		 ps.setString(13,c4);
		 ps.setString(14,c5);
		 ps.setString(15,c6);
		 ps.setString(16,c7);
		 ps.setString(17,p1);
		 ps.setString(18,p2);
		 ps.setString(19,p3);
		 ps.setString(20,p4);
		 ps.setString(21,p5);
		 ps.setString(22,p6);
		 ps.setString(23,p7);
		 ps.setString(24,t1);
		 ps.setString(25,t2);
		 ps.setString(26,t3);
		 ps.setString(27,t4);
		 ps.setString(28,t5);
		 ps.setString(29,t6);
		 ps.setString(30,t7);
		 int i= ps.executeUpdate();
		 
		 if(i>0)
		 {
			 session.setAttribute("dept",dept);
			 session.setAttribute("sem",sem);
			 response.sendRedirect("managesubject.jsp");
		 }
		 else
		 {
			 response.sendRedirect("editsubject.jsp");
		 }
		                        
		                    }    
		                   
		                    
		                    catch(Exception e)
		                    {
		System.out.println(e);
		                    }
		                    
	%>
</body>
</html>






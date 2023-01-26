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
		
					String fname=request.getParameter("fname");
					String lname=request.getParameter("lname");
					String mail=request.getParameter("mail");
					String altmail=request.getParameter("altmail");
					String ph=request.getParameter("phno");
					String roll=request.getParameter("enroll");
					String ct=request.getParameter("course");
					String clg=request.getParameter("clg");
					String sem=request.getParameter("sem");
					String dpt=request.getParameter("dept");
					String xam=request.getParameter("exam");
					
					String sb="UPDATE reg set  firstname=?,lastname=?, email=?,altemail=?,phone=?,enrollment=?,course=?,college=?,sem=?,department=?,exam=? where enrollment="+roll;
					PreparedStatement pstatement=conn.prepareStatement(sb);					
					pstatement.setString(1,fname);
					pstatement.setString(2,lname);
					pstatement.setString(3,mail);
					pstatement.setString(4,altmail);
					pstatement.setString(5,ph);
					pstatement.setString(6,roll);
					pstatement.setString(7,ct);
					pstatement.setString(8,clg);
					pstatement.setString(9,sem);
					pstatement.setString(10,dpt);
					pstatement.setString(11,xam);
					//pstatement.setString(9,cno);
					int i= pstatement.executeUpdate();
					if(i>0)
					{
						 session.setAttribute("roll",roll);
						 response.sendRedirect("profile.jsp");	 
					}
					else
					{
						 
					}
					     }                
                         catch(Exception e)
	                     {
			         		System.out.println(e);
                         }	
					
                       %>
</body>
</html>
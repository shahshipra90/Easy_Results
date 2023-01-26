<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.sql.* ,java.util.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
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
					String p=request.getParameter("pass");
					String cp=request.getParameter("cpass");
					 if(p.equals(cp))
					 {
					 String sb="UPDATE  reg set  password=?,conpassword=?";
					 //String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
					PreparedStatement pstatement=conn.prepareStatement(sb);
					
pstatement.setString(1,p);
pstatement.setString(2,cp);

int i= pstatement.executeUpdate();
					 if(i>0)
{
	 response.sendRedirect("studentlogin.jsp");	 
}
					 else{}
}
			else{
				 session.setAttribute("msg", "Password doesn't match, please enter again!");  
	     		 response.sendRedirect("forgotpassword.jsp");
}   
          }            
                   catch(Exception e)
                   {
System.out.println(e);
                   }
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Correction</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String pwd = request.getParameter("opass");
String pass = request.getParameter("pass");
String cpass = request.getParameter("cpass");
//String apass = "";
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from admin_login where username='" + uname + "' and password='" + pwd + "'");
if (rs.next()) {
//response.sendRedirect("profile.jsp");
	 if(pass.equals(cpass))
		{
		String sb="UPDATE  admin_login set  password=?";
		//String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
		PreparedStatement pstatement=con.prepareStatement(sb);

		pstatement.setString(1,pass);
	//	pstatement.setString(2,pass);

		int i= pstatement.executeUpdate();
		if(i>0)
		{
			%>
			<script>
		alert("Password updated");
			window.location="dashboard.jsp";
			</script><%		 
		}
		else{}
		}
		else{
			   %>
			   <script>
		  		alert("Password and Confirm Password doesn't match, Please check");
			   		window.location="admchangepassword.jsp";
			   </script>
			   <%
			} 
}
else{
session.setAttribute("msg", "Your username old password is incorrect, Please check"); 
response.sendRedirect("admchangepassword.jsp");
}

}catch(Exception e){
	
}

%>

</body>
</html>
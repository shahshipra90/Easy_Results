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
String enroll = request.getParameter("enroll");
String pwd = request.getParameter("opass");
String pass = request.getParameter("pass");
String cpass = request.getParameter("cpass");
//String apass = "";
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/er","root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from reg where enrollment='" + enroll + "' and password='" + pwd + "'");
if (rs.next()) {
//response.sendRedirect("profile.jsp");
	 if(pass.equals(cpass))
		{
		String sb="UPDATE  reg set  password=?,conpassword=?";
		//String sb="UPDATE personal_information set Age=? where Criminal_ID="+dem;
		PreparedStatement pstatement=con.prepareStatement(sb);

		pstatement.setString(1,pass);
		pstatement.setString(2,cpass);

		int i= pstatement.executeUpdate();
		if(i>0)
		{
			%>
			<script>
		alert("Password updated");
			window.location="profile.jsp";
			</script><%		 
		}
		else{}
		}
		else{
			   %>
			   <script>
		  		alert("Password and Confirm Password doesn't match, Please check");
			   		window.location="changepassword.jsp";
			   </script>
			   <%
			} 
}
else{
session.setAttribute("msg", "Your enrollment or old password is incorrect, Please check"); 
response.sendRedirect("changepassword.jsp");
}

}catch(Exception e){
	
}

%>

</body>
</html>
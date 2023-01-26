<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
	<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel = "stylesheet" href = "dashboard.css">
    <link rel = "stylesheet" href = "dashboard1.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<%@page import="java.sql.*,java.util.*"%>
<body>
<% 
	String total,c_pass,c_fail,i_pass,i_fail,e_pass,e_fail,ec_pass,ec_fail,civil_pass,civil_fail,mech_pass,mech_fail,aero_pass,aero_fail = "null";
%>
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
                                	<%
                                		
                                	%>
 
<header>
      <pre name = "uname"><%=uname%>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
    </header>
   
<jsp:include page="navigation.jsp"/>
 <div class="title">
       Admin Dashboard<hr>
      </div>
      <div class = "data">
        <div class = "regstu">
        <div class = "icon">
        	<i class="fa fa-users"></i>
        </div>
          <span class = "box-title"><pre>Total Students
  Registered</pre>
          </span><br>
          <form action = "" method ="post" id = "frm" name = "frm">
          <span class = "students" >500</span>
          </form>
        </div>
        <div class = "resupd">
         <div class = "icon">
        	<i class="fa fa-graduation-cap"></i>
        </div>
          <span class = "box-title1"><pre>Total Results
  Updated</pre>
          </span>
          <form action = "" method ="post" id = "frm" name = "frm">
          <span class = "results"><marquee direction="up"><pre>
BE Reg Sem 2
BE Reg Sem 3
BE Reg Sem 4
BE Reg Sem 2
BE Reg Sem 3
BE Reg Sem 4
</pre></marquee >
          </span>
          </form>
        </div>
        <div class = "resdec">
        <div class = "icon">
        	<i class="fa fa-graduation-cap"></i>
        </div>
          <span class = "box-title1"><pre>Total Results
   Declared</pre>
          </span>
          <form action = "" method ="post" id = "frm" name = "frm">
          <span class = "results"><marquee direction="up"><pre>BE Reg Sem 4
BE Reg Sem 2
BE Reg Sem 3
</pre></marquee>
          </span>
          </form>
        </div>
      </div>
      <div class = "data2">
      	<div class = "ce">
      	 <div class = "icon">
        	<i class='fas fa-desktop'></i>
        </div>
      		<span class = "box-title2"><pre>
      		Computer Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      	<div class = "it">
      	 <div class = "icon">
        	<i class='fas fa-laptop' ></i>
        </div>
      		<span class = "box-title2"><pre>
      		IT Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      	<div class = "electrical">
      	<div class = "icon">
        	<i class='fas fa-plug'></i>
        </div>
      		<span class = "box-title2"><pre>
      		Electrical Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      </div>
      <div class = "data2">
      	<div class = "ec">
      	 <div class = "icon">
        	<i class='fas fa-broadcast-tower'></i>
        </div>
      		<span class = "box-title2"><pre>
      		E&C Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      	<div class = "civil">
      	 <div class = "icon">
        	<i class='far fa-building'></i>
        </div>
      		<span class = "box-title2"><pre>
      		Civil Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      	<div class = "mechnical">
      	<div class = "icon">
        	<i class="fa fa-wrench"></i>
        </div>
      		<span class = "box-title2"><pre>
      		Mechnical Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      </div>
      <div class = "data3">
      	<div class = "aero">
      	<div class = "icon">
        	<i class='fas fa-plane' ></i>
        </div>
      		<span class = "box-title2"><pre>
      		Aeronautical Engineering</pre>
      		</span>
      		<form action = "" method = "post" id = "frm" name = "frm">
      			<span class = "pass">Pass  86%</span>
      			<span class = "fail">Fail 14%</span>
      		</form>
      	</div>
      </div>
  <%       
		  
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
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
	String sem,total,c_pass,c_fail,i_pass,i_fail,e_pass,e_fail,ec_pass,ec_fail,civil_pass,civil_fail,mech_pass,mech_fail,aero_pass,aero_fail = "null";
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
                                	  
                               		/*String sem = (String)session.getAttribute("seme");
                              		 System.out.println(sem);*/
                              		rs = psmnt.executeQuery("SELECT COUNT(*) FROM reg");
                             		String Countstudents="";	
                                	%>
                                	
       							   
 
<header>
      <pre name = "uname"><%=uname%>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
    </header>
   
<jsp:include page="navigation.jsp"/>
 <div class="title">
       Admin Dashboard<hr>
      </div>
      <div class = "data2">
      	<%	
      		while(rs.next()){
			Countstudents = rs.getString(1);     		
%>
        <div class = "regstu">
        	<div class = "icon">
        		<i class="fa fa-users"></i>
        	</div>
         	<span class = "box-title"><pre>Total Students
  Registered</pre>
          	</span><br>          
          <span class = "students" >&nbsp;&nbsp;<%=Countstudents %></span>
        </div>
         <%
			 rs = psmnt.executeQuery("SELECT * FROM res_dec_upd WHERE result_update IS NOT NULL");
	         String upd="";
         	 while(rs.next()){
         		upd = rs.getString("result_update");
          %>
        <div class = "resupd">
        	<div class = "icon">
        		<i class="fa fa-graduation-cap"></i>
        	</div>
          <span class = "box-title1"><pre>Recent Result
   Updated</pre><br>
           <pre>&nbsp;&nbsp;&nbsp;<%=upd %></pre>
          </span>
        </div>
         <%
         	 }
      %>
      
          <%
			 rs = psmnt.executeQuery("SELECT * FROM res_dec_upd WHERE result_declare IS NOT NULL");
	         String dec="";
         	 while(rs.next()){
         		dec = rs.getString("result_declare");
          %>
        <div class = "resdec">
        	<div class = "icon">
        		<i class="fa fa-graduation-cap"></i>
        	</div>
          <span class = "box-title1"><pre>Recent Result
   Declared</pre><br>
           <pre>&nbsp;&nbsp;&nbsp;<%=dec %></pre>
          </span>
        </div>
         <%
         	 }
      %>
      </div>
     

<%
rs = psmnt.executeQuery("SELECT * FROM overall_result");
while(rs.next()){
	sem = rs.getString("semester");
	c_pass = rs.getString("comp_pass");
	c_fail = rs.getString("comp_fail");
	i_pass = rs.getString("it_pass");
	i_fail = rs.getString("it_fail");
	e_pass = rs.getString("elec_pass");
	e_fail = rs.getString("elec_fail");
	ec_pass = rs.getString("ec_pass");
	ec_fail = rs.getString("ec_fail");
	civil_pass = rs.getString("civil_pass");
	civil_fail = rs.getString("civil_fail");
	mech_pass = rs.getString("mech_pass");
	mech_fail = rs.getString("mech_fail");
	aero_pass = rs.getString("aero_pass");
	aero_fail = rs.getString("aero_fail");

%>
      <div class = "data2">
      	<div class = "ce">
      	 <div class = "icon">
        	<i class='fas fa-desktop'></i>
         </div>
      	 <span class = "box-title2"><pre>
      		Computer Engineering   
      			      <%=sem %>
      		</pre>
      	 </span>
      		<span class = "pass">Pass  <%=c_pass%>%</span>
      		<span class = "fail">Fail <%=c_fail%>%</span>
      	</div>
      	
      	<div class = "it">
      	 <div class = "icon">
        	<i class='fas fa-laptop' ></i>
        </div>
      	<span class = "box-title2"><pre>
      		      IT Engineering
      			     <%=sem %>
      		</pre>
      	</span>     		
        	<span class = "pass">Pass  <%=i_pass%>%</span>
      		<span class = "fail">Fail <%=i_fail%>%</span>   	
      	</div>
      	
      	<div class = "electrical">
      		<div class = "icon">
        		<i class='fas fa-plug'></i>
       		</div>
      		<span class = "box-title2"><pre>
      		Electrical Engineering
      			    <%=sem %>
      			</pre>
      		</span>    		
      	  <span class = "pass">Pass  <%=e_pass%>%</span>
      	  <span class = "fail">Fail <%=e_fail%>%</span>    
       </div>
     </div>
      <div class = "data2">
      	<div class = "ec">
      	 <div class = "icon">
        	<i class='fas fa-broadcast-tower'></i>
        </div>
      		<span class = "box-title2"><pre>
      		     E&C Engineering
      			    <%=sem %>	
      	 </pre>
      		</span>
      		
      			<span class = "pass">Pass  <%=ec_pass%>%</span>
      			<span class = "fail">Fail <%=ec_fail%>%</span>

      	</div>
      	<div class = "civil">
      	 <div class = "icon">
        	<i class='far fa-building'></i>
        </div>
      		<span class = "box-title2"><pre>
      		     Civil Engineering
      				<%=sem %>
      		</pre>
      		</span>
      		
      			<span class = "pass">Pass  <%=civil_pass%>%</span>
      			<span class = "fail">Fail <%=civil_fail%>%</span>
      		
      	</div>
      	<div class = "mechnical">
      	<div class = "icon">
        	<i class="fa fa-wrench"></i>
        </div>
      		<span class = "box-title2"><pre>
      		Mechnical Engineering
      			    <%=sem %>
      		</pre>
      		</span>
      		    <span class = "pass">Pass  <%=mech_pass%>%</span>
      			<span class = "fail">Fail <%=mech_fail%>%</span>
      		
      	</div>
      </div>
      <div class = "data3">
      	<div class = "aero">
      	<div class = "icon">
        	<i class='fas fa-plane' ></i>
        </div>
      		<span class = "box-title2"><pre>
      		Aeronautical Engineering
      				<%=sem %>
      		</pre>
      		</span>
      			<span class = "pass">Pass  <%=aero_pass%>%</span>
      			<span class = "fail">Fail <%=aero_fail%>%</span>   
      	</div>
      </div>
         
     <% 
     
      		}     }
                                               } }   
                    catch(Exception e)
                    {
System.out.println(e);
                    }}

%>
</body>
</html>
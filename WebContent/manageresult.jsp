<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Result</title>
<link rel = "stylesheet" href = "managesubject.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>

<%
   String dept,sem,enroll, sub1, sub2, sub3, sub4, sub5, sub6, sub7,
   p1,p2,p3,p4,p5, p6,p7,t1,t2,t3,t4,t5,t6,t7,p8,p9,p10,p11,p12,p13,
   p14,t8,t9,t10,t11,t12,t13,t14,
   st1,st2,st3,st4,st5,st6,st7,per,total= "null";
  %>
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
                   	
                   	      enroll = (String)session.getAttribute("enroll");
                   		 System.out.println(enroll);
                   		dept = (String)session.getAttribute("dept");
                  		 System.out.println(dept);
                  		sem = (String)session.getAttribute("sem");
                 		 System.out.println(sem);
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
                               // rs = psmnt.executeQuery("SELECT * from result_ce where enrollment='"+enroll+"'");
                                //rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                                //		PreparedStatement preparedStatement = conn.prepareCall("SELECT * FROM subject WHERE department = ? AND semester = ? ");
                                if (rs.next())
                                {
                                	
                                	enroll = rs.getString("enrollment");
                                	dept = rs.getString("department");
                                	sem = rs.getString("semester");
                                	p1=rs.getString("practical1");
                                    p2=rs.getString("practical2");
                                	p3=rs.getString("practical3");
                                	p4=rs.getString("practical4");
                                	p5=rs.getString("practical5");
                                	p6=rs.getString("practical6");
                                	p7=rs.getString("practical7");
                                	t1 = rs.getString("theory1");
                                	t2 = rs.getString("theory2");
                                	t3=rs.getString("theory3");
                                	t4=rs.getString("theory4");
                                	t5=rs.getString("theory5");
                                    t6=rs.getString("theory6");
                                	t7=rs.getString("theory7");
                                	st1=rs.getString("st1");
                                	st2=rs.getString("st2");
                                	st3=rs.getString("st3");
                                	st4=rs.getString("st4");
                                	st5=rs.getString("st5");
                                	st6=rs.getString("st6");
                                	st7=rs.getString("st7");
                                	per=rs.getString("percentage");
                                	total=rs.getString("total");
                                	%>
                                	<%
                                	rs = psmnt.executeQuery("SELECT * from subject where department='"+dept+"' and semester='"+sem+"'"); 
                                	if(rs.next()){
                                		p8=rs.getString("practical1");
                                		p9=rs.getString("practical2");
                                		p10=rs.getString("practical3");
                                		p11=rs.getString("practical4");
                                		p12=rs.getString("practical5");
                                		p13=rs.getString("practical6");
                                		p14=rs.getString("practical7");
                                		
                                		t8=rs.getString("theory1");
                                		t9=rs.getString("theory2");
                                		t10=rs.getString("theory3");
                                		t11=rs.getString("theory4");
                                		t12=rs.getString("theory5");
                                		t13=rs.getString("theory6");
                                		t14=rs.getString("theory7");
                                		
                                		
                                    	sub1 = rs.getString("subject1");
                                    	sub2=rs.getString("subject2");
                                    	sub3=rs.getString("subject3");
                                    	sub4=rs.getString("subject4");
                                        sub5=rs.getString("subject5");
                                    	sub6=rs.getString("subject6");
                                    	sub7=rs.getString("subject7");
                                		
                                	
                                	%>
 
<header>
      <pre name = "uname"><%=uname %>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
	<div class="title">
       Manage Result<hr>
     </div>
     <br /><br /><br />
     <div class="main-content">
       <form action="">
       <table class = "dept" >
           <tr>
             <td>
               Department
             </td>
             <td>
               <%=dept %>
             </td>
           </tr>
            <tr>
              <td>
                Semester
              </td>
              <td>
                <%=sem %>
              </td>
            </tr>
            <tr>
            	<td>
            		Enrollment
            	</td>
            	<td>
            		<%=enroll %>
            	</td>
            </tr>
         </table>
         <br /><br />
         <table class = "subject" >
           <thead>
             <tr>
               <th class = "none">
                 Subject Name
               </th>
              
               <th>
                 Practical Marks(Out of)
               </th>
               <th>
                 Theory Marks(Out of)
               </th>
               <th>
                 Action
               </th>
             </tr>
           </thead>
           <tbody>
             <tr>
               <td class = "none">
                <%=sub1 %>
               </td>
              
               <td>
                 <%= p1%>/<%=p8 %>
               </td>
               <td>
                 <%= t1%>/<%=t9 %>
               </td>
               <td>
                 <a href = "editresult.jsp"><i class="fasss fa fa-edit fa-1x"></i></a>
              </td>
            </tr>
              <tr>
                <td class = "none">
                  <%=sub2 %>
                </td>
                
                <td>
                  <%= p2%>/<%=p9 %>
                </td>
                <td>
                  <%=t2 %>/<%=t10 %>
                </td>
                <td>
                  <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
               </td>
             </tr>
               <tr>
                 <td class = "none">
                   <%=sub3 %>
                 </td>
                 
                 <td>
                   <%=p3 %>/<%=p10 %>
                 </td>
                 <td>
                   <%=t3 %>/<%=t11 %>
                 </td>
                 <td>
                   <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                </td>
              </tr>
                <tr>
                  <td class = "none">
                    <%=sub4 %>
                  </td>
                  
                  <td>
                    <%= p4%>/<%=p11 %>
                  </td>
                  <td>
                    <%= t4%>/<%=t11 %>
                  </td>
                  <td>
                    <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                 </td>
               </tr>
               <tr>
                 <td class = "none">
                   <%=sub5 %>
                 </td>
                
                 <td>
                   <%= p5%>/<%=p12 %>
                 </td>
                 <td>
                   <%= t5%>/<%=t12 %>
                 </td>
                 <td>
                   <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                </td>
              </tr>
              <tr>
                <td class = "none">
                 <%=sub6%>
                </td>
                
                <td>
                  <%=p6 %>/<%=p13 %>
                </td>
                <td>
                  <%= t6%>/<%=t13 %>
                </td>
                <td>
                  <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
               </td>
             </tr>
             <tr>
               <td >
                 <%=sub7%>
               </td>
               
               <td>
                 <%=p7 %>/<%=p14 %>
               </td>
               <td>
                 <%=t7 %>/<%=t14 %>
               </td>
               <td>
                 <a href = "editresult.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
              </td>
            </tr>
           <tr> 
            	<td></td>
				<td><center>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Percentage</center></td>
				<td><input type = "text" name = "per" id = "per" required value= "<%=per%>"></td>
			</tr>
            <tr class="none">
              <td colspan = "6" >
                <a href = "addresult.jsp"><center><input type = "button" value = "Add new Result" name = "submit" id = "submit" class= "subbtn"/></center></a>
              </td>
            </tr>
           </tbody>
         </table>
     </div>
     <%       
                        }
                    }             }
                    catch(Exception e)
                    {
System.out.println(e);
                    }
	
}
                        %>
     
</body>
</html>
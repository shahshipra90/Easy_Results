<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Subject Details</title>
<link rel = "stylesheet" href = "managesubject.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>	
<%
   String dept,sem, sub1, sub2, sub3, sub4, sub5, sub6, sub7, c1,c2,c3,c4,c5,c6,c7,p1,p2,p3,p4,p5, p6,p7,t1,t2,t3,t4,t5,t6,t7,total,subtotal = "null";
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
                   		 
                   	 }
                   	 Statement psmnt = conn.createStatement();
                   	 //dept =request.getParameter("department");
                   	 //sem = request.getParameter("semester");
                   	      dept = (String)session.getAttribute("dept");
                   		System.out.println(dept);
                   		sem = (String)session.getAttribute("sem");
                  		 System.out.println(sem);
                   			 ResultSet rs;
                                rs = psmnt.executeQuery("SELECT * from subject where department='"+dept+"' and semester='"+sem+"'");
                               // rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                                //rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                                //		PreparedStatement preparedStatement = conn.prepareCall("SELECT * FROM subject WHERE department = ? AND semester = ? ");
                                if (rs.next())
                                {
                                	dept = rs.getString("department");
                                	sem = rs.getString("semester");
                                	sub1 = rs.getString("subject1");
                                	sub2=rs.getString("subject2");
                                	sub3=rs.getString("subject3");
                                	sub4=rs.getString("subject4");
                                    sub5=rs.getString("subject5");
                                	sub6=rs.getString("subject6");
                                	sub7=rs.getString("subject7");
                                	c1=rs.getString("code1");
                                	c2=rs.getString("code2");
                                	c3 = rs.getString("code3");
                                	c4 = rs.getString("code4");
                                	c5 = rs.getString("code5");
                                	c6=rs.getString("code6");
                                	c7=rs.getString("code7");
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
                                	//total=rs.getString("");
                                	//subtotal=rs.getString("subtotal");
                                	%>
                                	<%
                                	 String uname = (String)session.getAttribute("uname");
                          			 System.out.println(uname);
                          			// ResultSet rs;
                                       rs = psmnt.executeQuery("SELECT * from admin_login where username='"+uname+"'");
                                       if (rs.next())
                                       {
                                       	uname = rs.getString("username"); 
                                       	
                                       }
%>
<header>
      <pre name = "uname"><%=uname %>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>                           	
<jsp:include page="navigation.jsp"/>
	<div class="title">
       Manage subject Details<hr>
     </div>
     <br /><br /><br />
     <div class="main-content">
       <form action="">
       <table class = "dept">
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
         </table>
         <br /><br />
         <table class = "subject">
           <thead>
             <tr>
               <th class = "none">
                 Subject Name
               </th>
               <th>
                 Subject Code
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
                 <%= c1 %>
               </td>
               <td>
                 <%= p1%>
               </td>
               <td>
                 <%= t1%>
               </td>
               <td>
                 <a href = "editsubject.jsp"><i class="fasss fa fa-edit fa-1x"></i></a>
               </td>
              </tr>
              <tr>
                <td class = "none">
                  <%=sub2 %>
                </td>
                <td>
                  <%= c2%>
                </td>
                <td>
                  <%= p2%>
                </td>
                <td>
                  <%=t2 %>
                </td>
                <td>
                  <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
               </td>
             </tr>
               <tr>
                 <td class = "none">
                   <%=sub3 %>
                 </td>
                 <td>
                   <%= c3%>
                 </td>
                 <td>
                   <%=p3 %>
                 </td>
                 <td>
                   <%=t3 %>
                 </td>
                 <td>
                   <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                </td>
              </tr>
                <tr>
                  <td class = "none">
                    <%=sub4 %>
                  </td>
                  <td>
                    <%= c4%>
                  </td>
                  <td>
                    <%= p4%>
                  </td>
                  <td>
                    <%= t4%>
                  </td>
                  <td>
                    <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                 </td>
               </tr>
               <tr>
                 <td class = "none">
                   <%=sub5 %>
                 </td>
                 <td>
                   <%= c5%>
                 </td>
                 <td>
                   <%= p5%>
                 </td>
                 <td>
                   <%= t5%>
                 </td>
                 <td>
                   <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>   
                </td>
              </tr>
              <tr>
                <td class = "none">
                 <%=sub6%>
                </td>
                <td>
                  <%=c6 %>
                </td>
                <td>
                  <%=p6 %>
                </td>
                <td>
                  <%= t6%>
                </td>
                <td>
                  <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>  
               </td>
             </tr>
             <tr>
               <td class = "none">
                 <%=sub7%>
               </td>
               <td>
                <%= c7%>
               </td>
               <td>
                 <%=p7 %>
               </td>
               <td>
                 <%=t7 %>
               </td>
               <td>
                 <a href = "editsubject.jsp"><i class="fas fa fa-edit fa-1x"></i></a>   
              </td>
            </tr>
           </tbody>
         </table>
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
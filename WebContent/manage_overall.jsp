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
   
%>
<%
   String sem,cc,cp,cf,ic,ip,itf,ec,ep,ef,ecc,ecp,ecf,cic,cip,cif,mc,mp,mf,ac,ap,af = "null";
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
                   	   /*   dept = (String)session.getAttribute("dept");
                   		System.out.println(dept); */
                   		sem = (String)session.getAttribute("sem");
                  		 System.out.println(sem);
                   			 ResultSet rs;
                                rs = psmnt.executeQuery("SELECT * from overall_result where semester = '"+sem+"'");
                               // rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                                //rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                                //		PreparedStatement preparedStatement = conn.prepareCall("SELECT * FROM subject WHERE department = ? AND semester = ? ");
                                if (rs.next())
                                {
                                	
                                	sem = rs.getString("semester");
                                	//dept = rs.getString("department");
                                	cc = rs.getString("comp_code");
                                	cp = rs.getString("comp_pass");
                                	cf=rs.getString("comp_fail");
                                	ic=rs.getString("it_code");
                                	ip=rs.getString("it_pass");
                                    itf=rs.getString("it_fail");
                                	ec=rs.getString("elec_code");
                                	ep=rs.getString("elec_pass");
                                	ef=rs.getString("elec_fail");
                                	ecc=rs.getString("ec_code");
                                	ecp = rs.getString("ec_pass");
                                	ecf = rs.getString("ec_fail");
                                	cic = rs.getString("civil_code");
                                	cip=rs.getString("civil_pass");
                                	cif=rs.getString("civil_fail");
                                	mc=rs.getString("mech_code");
                                    mp=rs.getString("mech_pass");
                                	mf=rs.getString("mech_fail");
                                	ac=rs.getString("aero_code");
                                	ap=rs.getString("aero_pass");
                                	af=rs.getString("aero_fail");
                                	
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
       Manage Overall Result<hr>
     </div>
     <br /><br /><br />
     <div class="main-content">
       <form action="">
       <table class = "dept">
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
                 Department Name
               </th>
               <th>
                 Department Code
               </th>
               <th>
                 Pass (In %)
               </th>
               <th>
                 Fail (In %)
               </th>
               <th>
                 Action
               </th>
             </tr>
           </thead>
           <tbody>
             <tr>
               <td class = "none">
                Computer Engineering
               </td>
               <td>
                 <%= cc %>
               </td>
               <td>
                 <%= cp%>
               </td>
               <td>
                 <%= cf%>
               </td>
               <td>
                 <a href = "editoverall.jsp"><i class="fasss fa fa-edit fa-1x"></i></a>
              </td>
            </tr>
              <tr>
                <td class = "none">
                  It Engineering
                </td>
                <td>
                  <%= ic%>
                </td>
                <td>
                  <%= ip%>
                </td>
                <td>
                  <%=itf %>
                </td>
                <td>
                  <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
               </td>
             </tr>
               <tr>
                 <td class = "none">
                   Electrical Engineering
                 </td>
                 <td>
                   <%= ec%>
                 </td>
                 <td>
                   <%=ep%>
                 </td>
                 <td>
                   <%=ef %>
                 </td>
                 <td>
                   <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                </td>
              </tr>
                <tr>
                  <td class = "none">
                   E & C Engineering
                  </td>
                  <td>
                    <%=ecc%>
                  </td>
                  <td>
                    <%= ecp%>
                  </td>
                  <td>
                    <%= ecf%>
                  </td>
                  <td>
                    <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                 </td>
               </tr>
               <tr>
                 <td class = "none">
                   Civil Engineering
                 </td>
                 <td>
                   <%= cic%>
                 </td>
                 <td>
                   <%= cip%>
                 </td>
                 <td>
                   <%= cif%>
                 </td>
                 <td>
                   <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
                </td>
              </tr>
              <tr>
                <td class = "none">
                Mechnical Engineering
                </td>
                <td>
                  <%=mc %>
                </td>
                <td>
                  <%=mp %>
                </td>
                <td>
                  <%=mf%>
                </td>
                <td>
                  <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
               </td>
             </tr>
             <tr>
               <td class = "none">
                 Aeronautical Engineering
               </td>
               <td>
                <%= ac%>
               </td>
               <td>
                 <%=ap %>
               </td>
               <td>
                 <%=af %>
               </td>
               <td>
                 <a href = "editoverall.jsp"><i class="fas fa fa-edit fa-1x"></i></a>
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
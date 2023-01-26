<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Overall Results</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "addsubject.css">
</head>
<%@page import="java.sql.*,java.util.*"%>
<body>
<%
String sem,cc,cp,cf,ic,ip,itf,ec,ep,ef,ecc,ecp,ecf,cic,cip,cif,mc,mp,mf,ac,ap,af = "null";
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
                                	 sem = (String)session.getAttribute("sem");
                             		 System.out.println(sem);
                             		
                             		 rs = psmnt.executeQuery("SELECT * from overall_result where semester='"+sem+"'");
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
<header>
      <pre name = "uname"><%=uname%>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
      <div class="title">
        Edit Overall Result<hr>
      </div>
      <br /><br /><br />
      <div class="main-content">
        <form action="updateoverall.jsp" method = "post">
        <table class = "dept">
            <!-- <tr>
              <td>
                Department
              </td>
              <td>
                <select name = "department">
                 <option value="" disabled selected>Select your option</option>
                  <option value = "Computer Enggineering"> Computer Enggineering</option>
                  <option value = "IT Enggineering">IT Enggineering</option>
                  <option value = "Electrical Enggineering">Electrical Enggineering</option>
                  <option value = "E & C Enggineering"> E & C Enggineering</option>
                  <option value = "Civil Enggineering"> Civil Enggineering</option>
                  <option value = "Mechnical Enggineering">Mechnical Enggineering</option>
                  <option value = "Aeronautical Enggineering">Aeronautical Enggineering</option>
                </select>
              </td>
            </tr>-->
            <tr>
              <td>
                Semester
              </td>
              <td>
                <select name = "semester">
                  <option value="<%=sem %>" selected><%out.print(sem);%></option>
                  <option value = "Sem 1">Sem 1</option>
                  <option value = "Sem 2">Sem 2</option>
                  <option value = "Sem 3">Sem 3</option>
                  <option value = "Sem 4">Sem 4</option>
                  <option value = "Sem 5 ">Sem 5</option>
                  <option value = "sem 6">Sem 6</option>
                  <option value = "Sem 7">Sem 7</option>
                  <option value = "Sem 8">Sem 8</option>
                </select>
              </td>
            </tr>
          </table>
          <br /><br />
          <table class = "subject" border="0">
            <thead>
            <tr>
              <th  class="center">Department Name</th>
               <th  class="center">Department Code</th>
              <th>
               Pass(In %)
              </th>
              <th>
                Fail(In %)
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                Computer Engineering
              </td>
             
              <td>
                <input type = "text" id = "c1" name = "c1" required value = "<%=cc %>" />
              </td>
              <td>
                <input type = "text" class= "box" id = "p1" name = "p1"  required value = "<%=cp %>"/>
              </td>
              <td>
                <input type = "text" id = "f1" name = "f1" required value = "<%=cf %>"/>
              </td>
            </tr>
            <tr>
              <td>
                It Engineering
              </td>
              
             
              <td>
                <input type = "text" id = "c2" name = "c2"  required value = "<%=ic %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p2" name = "p2"  required value = "<%=ip %>"/>
              </td>
              <td>
                <input type = "text" id = "f2" name = "f2"  required value = "<%=itf %>"/>
              </td>
            </tr>
            <tr>
              <td>
               Electrical Engineering
              </td>
              
              
              <td>
                <input type = "text" id = "c3" name = "c3" required value = "<%=ec %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p3" name = "p3" required value = "<%=ep %>"/>
              </td>
              <td>
                <input type = "text" id = "f3" name = "f3" required value = "<%=ef %>"/>
              </td>
            </tr>
            <tr>
              <td>
                E & C Engineering
              </td>
              
              
              <td>
                <input type = "text" id = "c4" name = "c4"  required value = "<%=ecc %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p4" name = "p4" required value = "<%=ecp %>"/>
              </td>
              <td>
                <input type = "text" id = "f4" name = "f4" required value = "<%=ecf %>"/>
              </td>
            </tr>
            <tr>
              <td>
                Civil Engineering
              </td>
              
             
              <td>
                <input type = "text" id = "c5" name = "c5" required value = "<%=cic %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p5" name = "p5" required value = "<%=cip %>"/>
              </td>
              <td>
                <input type = "text" id = "f5" name = "f5" required value = "<%=cif %>"/>
              </td>
            </tr>
            <tr>
              <td>
                Mechnical Engineering
              </td>
              
              
              <td>
                <input type = "text" id = "c6" name = "c6" required value = "<%=mc %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p6" name = "p6" required value = "<%=mp %>"/>
              </td>
              <td>
                <input type = "text" id = "f6" name = "f6" required value = "<%=mf %>"/>
              </td>
            </tr>
            <tr>
              <td>
               Aeronautical Engineering
              </td>
              
                            <td>
                <input type = "text" id = "c7" name = "c7" required value = "<%=ac %>"/>
              </td>
              <td>
                <input type = "text" class= "box" id = "p7" name = "p7" required value = "<%=ap %>"/>
              </td>
              <td>
                <input type = "text" id = "f7" name = "f7" required value = "<%=af %>"/>
              </td>
            </tr>
            <tr class="border">
              <td colspan = "6" >
                <center><input type = "submit" value = "Submit" name = "submit" id = "submit" class= "subbtn"/></center>
              </td>
            </tr>

          </tbody>
          </table>
        </form>
        <br /><br />
      </div>
       <%       
                                    }
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
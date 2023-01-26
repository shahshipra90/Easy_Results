<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<title>Edit Result</title>
<link rel = "stylesheet" href = "addsubject.css">
    <style>
	.msg{
		color: black;
		font-size: 25px;
		margin-left: 300px;
		//font-style: bold;
	}
</style>
</head>
<%@page import="java.sql.*,java.util.*"%>
<body>
<%
   String enroll,sub1, sub2, sub3, sub4, sub5, sub6, sub7, c1,c2,c3,c4,c5,c6,c7,p1,p2,p3,p4,p5, p6,p7,t1,t2,t3,t4,t5,t6,t7,p01,p02,p03,p04,p05,p06,p07,t01,t02,t03,t04,t05,t06,t07 = "null";
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
                                	String dept = (String)session.getAttribute("dept");
                               		System.out.println(dept);
                               		String sem = (String)session.getAttribute("sem");
                              		 System.out.println(sem);
                              		 enroll = (String)session.getAttribute("enroll");
                              		 System.out.println(enroll);
                              		 rs = psmnt.executeQuery("SELECT * from subject where department='"+dept+"' and semester='"+sem+"'");
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
         %>
         <%
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
    			
    	   }
                // rs = psmnt.executeQuery("SELECT * from result_ce where enrollment='"+enroll+"'");
                 //rs = psmnt.executeQuery("SELECT * from subject where semester='"+sem+"'");
                 //		PreparedStatement preparedStatement = conn.prepareCall("SELECT * FROM subject WHERE department = ? AND semester = ? ");
                 if (rs.next())
                 {
                 	
                 	enroll = rs.getString("enrollment");
                 	p01=rs.getString("practical1");
                    p02=rs.getString("practical2");
                 	p03=rs.getString("practical3");
                  	p04=rs.getString("practical4");
                 	p05=rs.getString("practical5");
                 	p06=rs.getString("practical6");
                 	p07=rs.getString("practical7");
                 	t01 = rs.getString("theory1");
                 	t02 = rs.getString("theory2");
                 	t03=rs.getString("theory3");
                 	t04=rs.getString("theory4");
                 	t05=rs.getString("theory5");
                    t06=rs.getString("theory6");
                 	t07=rs.getString("theory7");
                 	//float subtotal = rs.getFloat("subtotal");
         %>
	<header>
      <pre name = "uname"><%=uname %>&nbsp;&nbsp;<span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
      <div class="title">
        Edit Result<hr>
      </div>
      <br /><br /><br />
      <div class="main-content">
        <form action="editres.jsp" method = "post">
        <table class = "dept">
            <tr>
              <td>
                Department
              </td>
              <td>
                <select name = "department" >
                  <option value = "<%=dept%>" selected ><%out.print(dept); %></option>
                  <option value = "Computer Enggineering"> Computer Enggineering</option>
                  <option value = "IT Enggineering">IT Enggineering</option>
                  <option value = "Electrical Enggineering">Electrical Enggineering</option>
                  <option value = "E & C Enggineering"> E & C Enggineering</option>
                  <option value = "Civil Enggineering"> Civil Enggineering</option>
                  <option value = "Mechnical Enggineering">Mechnical Enggineering</option>
                  <option value = "Aeronautical Enggineering">Aeronautical Enggineering</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>
                Semester
              </td>
              <td>
                <select name = "semester" >
                 <option value = "<%=sem%>" selected ><%out.print(sem); %></option>
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
            <tr>
            	<td>
            		Student Enrollment
            	</td>
            	<td>
            		<input type = "text" name = "enroll" id = "enroll" required minlength="12" maxlength="12" value="<%=enroll %>">
            	</td>
            </tr>
          </table>
          <br /><br />
          <table class = "subject" border="0">
            <thead>
            <tr>
              <th colspan ="2" class="center">Subject Name</th>
             
              <th>
                Practical(Out of )
              </th>
              <th>
                Theory(Out of )
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                Subject 1
              </td>
              <td>
                <input type = "text" id = "sub1" disabled name = "sub1" value = "<%=sub1 %>" required />
              </td>
             <td><input type = "text" id = "pm1"  class = "smallbox" name = "pm1" value = "<%=p01 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class= "smallbox" id = "pm1.0" disabled style="color: grey" name = "pm1.0" value = "/<%=p1 %>" required />
              </td>
              
              	<td><input type = "text" id = "tm1" class = "smallbox" name = "tm1" value = "<%=t01 %>" required />
              &nbsp; &nbsp;
                <input type = "text" id = "tm1.0" class = "smallbox" name = "tm1.0" class = "smallbox" disabled style="color: grey" required value = "/<%=t1 %>" />
              </td>
              
            </tr>
            <tr>
              <td>
                Subject 2
              </td>
              <td>
                <input type = "text" id = "sub2" disabled name = "sub2" required value = "<%=sub2 %>" />
              </td>
              <td><input type = "text" id = "pm2" class = "smallbox" name = "pm2" value = "<%=p02 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class = "smallbox" id = "pm2.0" disabled style="color: grey" name = "pm2.0" required value = "/<%=p2 %> "/>
              </td>
              <td><input type = "text" id = "tm2" class = "smallbox" name = "tm2" value = "<%=t02 %>" required />
              &nbsp; &nbsp;
                <input type = "text" id = "tm2.0" class = "smallbox" name = "tm2.0" style="color: grey" disabled required value = "/<%=t2 %>" />
              </td>
            </tr>
            <tr>
              <td>
                Subject 3
              </td>
              <td>
                <input type = "text" id = "sub3" disabled name = "sub3"  required value = "<%=sub3 %>" />
              </td>
              <td><input type = "text" id = "pm3" class = "smallbox" name = "pm3" value = "<%=p03 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class = "smallbox" id = "pm3.0" style="color: grey" disabled name = "pm3.0" required value = "/<%=p3 %>" />
              </td>
              <td><input type = "text" id = "tm3" class = "smallbox" name = "tm3" value = "<%=t03 %>" required />
              &nbsp; &nbsp;
                <input type = "text" id = "tm3.0" class = "smallbox" name = "tm3.0" disabled style="color: grey" required value = "/<%=t3 %>" />
              </td>
            </tr>
            <tr>
              <td>
                Subject 4
              </td>
              <td>
                <input type = "text" id = "sub4" name = "sub4" disabled required value = "<%=sub4 %>" />
              </td>
              <td><input type = "text" id = "pm4" class = "smallbox" name = "pm4" value = "<%=p04 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class = "smallbox" id = "pm4.0" disabled name = "pm4.0" style="color: grey" required value = "/<%=p4 %>" />
              </td>
              <td><input type = "text" id = "tm4" class = "smallbox" name = "tm4" value = "<%=t04 %>" required />
              &nbsp; &nbsp;
                <input type = "text" id = "tm4.0" class = "smallbox" disabled name = "tm4.0"  required style="color: grey" value = "/<%=t4 %>" />
              </td>
            </tr>
            <tr>
              <td>
                Subject 5
              </td>
              <td>
                <input type = "text" id = "sub5" disabled name = "sub5" required value = "<%=sub5 %>" />
              </td>
              <td><input type = "text" id = "pm5" class = "smallbox" name = "pm5" value = "<%=p05 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class = "smallbox" id = "pm5.0" disabled name = "pm5.0" style="color: grey"  required value = "/<%=p5 %>" />
              </td>
              <td><input type = "text" id = "tm5" class = "smallbox" name = "tm5" value = "<%=t05 %>" required />
              &nbsp; &nbsp;
                <input type = "text"  class = "smallbox" id = "tm5.0" disabled name = "tm5.0" style="color: grey" required value = "/<%=t5 %>" />
              </td>
            </tr>
            <tr>
              <td>
                Subject 6
              </td>
              <td>
                <input type = "text" id = "sub6" disabled name = "sub6" required value = "<%=sub6 %>" />
              </td>
              <td><input type = "text" id = "pm6" class = "smallbox"  name = "pm6" value = "<%=p06 %>" required />
              &nbsp; &nbsp;
                <input type = "text" class = "smallbox" style="color: grey" disabled id = "pm6.0" name = "pm6.0"  required value = "/<%=p6 %>" />
              </td>
              <td><input type = "text" id = "tm6" class = "smallbox"  name = "tm6" value = "<%=t06 %>" required />
              &nbsp; &nbsp;
                <input type = "text" id = "tm6.0" style="color: grey" disabled class = "smallbox" name = "tm6.0" required value = "/<%=t6 %>" />
              </td>
            </tr>
            <tr>
              <td>
                Subject 7
              </td>
              <td>
                <input type = "text" id = "sub7" disabled name = "sub7" required value = "<%=sub7 %>"/>
              </td>
              <td><input type = "text" id = "pm7" class = "smallbox" name = "pm7" value = "<%=p07 %>" required />
              &nbsp; &nbsp;
                <input type = "text" style="color: grey" class = "smallbox" disabled id = "pm7.0" name = "pm7.0"  required  value = "/<%=p7 %>"/>
              </td>
              <td><input type = "text" id = "tm7" class = "smallbox" name = "tm7" value = "<%=t07 %>" required />
              &nbsp; &nbsp;
                <input type = "text"  class = "smallbox" id ="tm7.0" style="color: grey" disabled name = "tm7.0" required value = "/<%=t7 %>"/>
              </td>
            </tr>
            <tr class="border">
              <td colspan = "6" >
                <center><input type = "submit" value = "Upload" name = "submit" id = "submit" class= "subbtn"/></center>
              </td>
            </tr>

          </tbody>
          </table>
        </form>
        <br /><br />
      </div>
        <span class = "msg"><marquee height= "20%" width = "40%" direction = "left"> <b><%
	try{
  		String data = session.getAttribute("msg").toString();
  		out.print(data);
  		session.removeAttribute("msg");
	}
	catch(Exception e){
	}
%></b></marquee></span>
          <%       
		  
                 }   }
                    } }           
                    catch(Exception e)
                    {
System.out.println(e);
                    }
	}
                        %>
</body>
</html>
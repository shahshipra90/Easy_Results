<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Subject Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel = "stylesheet" href = "addsubject.css">
</head>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*,java.lang.*" %>
<body>
<%
   String dept,sem, sub1, sub2, sub3, sub4, sub5, sub6, sub7, c1,c2,c3,c4,c5,c6,c7,p1,p2,p3,p4,p5, p6,p7,t1,t2,t3,t4,t5,t6,t7,subtotal = "null";
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
                   	      dept = (String)session.getAttribute("dept");
                   		 System.out.println(dept);
                   		sem = (String)session.getAttribute("sem");
                  		 System.out.println(sem);
                   			 ResultSet rs;
                   			rs = psmnt.executeQuery("SELECT * from subject where department='"+dept+"' and semester='"+sem+"'");
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
                                	subtotal = rs.getString("subtotal");
                                	%>
                                	<%
   	 String uname = (String)session.getAttribute("uname");
   			 System.out.println(uname);
   			 //ResultSet rs;
                rs = psmnt.executeQuery("SELECT * from admin_login where username='"+uname+"'");
                if (rs.next())
                {
                	uname = rs.getString("username");                  	
                	%> 
<header>
      <pre name = "uname">&nbsp;&nbsp;<%=uname %><span class = "fa fa-user-circle" style="font-size:24px;" ></span></pre>
</header>
<jsp:include page="navigation.jsp"/>
<form action = "editsub.jsp" method = "post">
      <div class="title">
        Edit Subject Details
      </div>
      <br /><br /><br />
      <div class="main-content">
        <table class = "dept">
            <tr>
              <td>
                Department
              </td>
              <td>
                <select name = "department">
                <option value = "<%=dept%>" selected><%out.print(dept); %></option>
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
                <select name = "semester">
                 <option value = "<%=sem%>" selected><%out.print(sem); %></option>
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
              <th colspan ="2" class="center">Subject Name</th>
              <th colspan= "2" class="center">Subject Code</th>
              <th>
                Practical(Out of)
              </th>
              <th>
                Theory(Out of)
              </th>
              <th>
               	Total
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                Subject 1
              </td>
              <td>
                <input type = "text" id = "sub1" name = "sub1"  value = "<%=sub1%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c1" name = "c1"  value = "<%=c1%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm1" name = "pm1" value = "<%=p1%>" required oninput="add_number1()"/>
              </td>
              <td>
                <input type = "text" id = "tm1" name = "tm1"  value = "<%=t1%>" required oninput="add_number1()"/>
              </td>
              <td><input type = "text" id = "st1" class = "smallbox" name = "st1" value = "" onclick="subtotal()" /></td>
				<script>
						var text1 = document.getElementById("pm1");
						var text2 = document.getElementById("tm1");
						
						function add_number1() {
						   var first_number = parseFloat(pm1.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm1.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st1").value = result;
						}
				</script>
            </tr>
            <tr>
              <td>
                Subject 2
              </td>
              <td>
                <input type = "text" id = "sub2" name = "sub2"  value = "<%=sub2%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c2" name = "c2"  value = "<%=c2%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm2" name = "pm2" value = "<%=p2%>" required oninput="add_number2()"/>
              </td>
              <td>
                <input type = "text" id = "tm2" name = "tm2" value = "<%=t2%>" required oninput="add_number2()"/>
              </td>
              <td><input type = "text" id = "st2" class = "smallbox" name = "st2" value = ""  onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm2");
						var text2 = document.getElementById("tm2");
						
						function add_number2() {
						   var first_number = parseFloat(pm2.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm2.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st2").value = result;
						}
				</script>
			
            </tr>
            <tr>
              <td>
                Subject 3
              </td>
              <td>
                <input type = "text" id = "sub3" name = "sub3"  value = "<%=sub3%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c3" name = "c3"  value = "<%=c3%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm3" name = "pm3" value = "<%=p3%>" required oninput="add_number3()"/>
              </td>
              <td>
                <input type = "text" id = "tm3" name = "tm3" value = "<%=t3%>" required oninput="add_number3()"/>
              </td>
               <td><input type = "text" id = "st3" class = "smallbox" name = "st3" value = ""  onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm1");
						var text2 = document.getElementById("tm1");
						
						function add_number3() {
						   var first_number = parseFloat(pm3.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm3.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st3").value = result;
						}
				</script>
            </tr>
            <tr>
              <td>
                Subject 4
              </td>
              <td>
                <input type = "text" id = "sub4" name = "sub4"  value = "<%=sub4%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c4" name = "c4"  value = "<%=c4%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm4" name = "pm4" value = "<%=p4%>" required oninput="add_number4()"/>
              </td>
              <td>
                <input type = "text" id = "tm4" name = "tm4"  value = "<%=t4%>" required oninput="add_number4()"/>
              </td>
              <td><input type = "text" id = "st4" class = "smallbox" name = "st4" value = ""  onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm4");
						var text2 = document.getElementById("tm4");
						
						function add_number4() {
						   var first_number = parseFloat(pm4.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm4.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st4").value = result;
						}
				</script>
            </tr>
            <tr>
              <td>
                Subject 5
              </td>
              <td>
                <input type = "text" id = "sub5" name = "sub5"  value = "<%=sub5%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c5" name = "c5"  value = "<%=c5%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm5" name = "pm5" value = "<%=p5%>" required oninput="add_number5()"/>
              </td>
              <td>
                <input type = "text" id = "tm5" name = "tm5"  value = "<%=t5%>" required oninput="add_number5()"/>
              </td>
               <td><input type = "text" id = "st5" class = "smallbox" name = "st5" value = ""  onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm5");
						var text2 = document.getElementById("tm5");
						
						function add_number5() {
						   var first_number = parseFloat(pm5.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm5.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st5").value = result;
						}
				</script>
            </tr>
            <tr>
              <td>
                Subject 6
              </td>
              <td>
                <input type = "text" id = "sub6" name = "sub6"  value = "<%=sub6%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c6" name = "c6"  value = "<%=c6%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm6" name = "pm6" value = "<%=p6%>" required oninput="add_number6()"/>
              </td>
              <td>
                <input type = "text" id = "tm6" name = "tm6" value = "<%=t6%>" required oninput="add_number6()"/>
              </td>
              <td><input type = "text" id = "st6" class = "smallbox" name = "st6" value = ""   onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm6");
						var text2 = document.getElementById("tm6");
						
						function add_number6() {
						   var first_number = parseFloat(pm6.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm6.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st6").value = result;
						}
				</script>
            </tr>
            <tr>
              <td>
                Subject 7
              </td>
              <td>
                <input type = "text" id = "sub7" name = "sub7" value = "<%=sub7%>" required/>
              </td>
              <td>
                Code
              </td>
              <td>
                <input type = "text" id = "c7" name = "c7"  value = "<%=c7%>" required/>
              </td>
              <td>
                <input type = "text" class= "box" id = "pm7" name = "pm7" value = "<%=p7%>" required oninput="add_number7()"/>
              </td>
              <td>
                <input type = "text" id = "tm7" name = "tm7"  value = "<%=t7%>" required oninput="add_number7()"/>
              </td>
               <td><input type = "text" id = "st7" class = "smallbox" name = "st7" value = ""  onclick="subtotal()"/></td>
				<script>
						var text1 = document.getElementById("pm7");
						var text2 = document.getElementById("tm7");
						
						function add_number7() {
						   var first_number = parseFloat(pm7.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(tm7.value);
						   if (isNaN(second_number)) second_number = 0;
						   var result = first_number + second_number;
						   document.getElementById("st7").value = result;
						}
				</script>
            </tr>
             <tr>
            	<td colspan="7" >
							<input type = "text" name = "total" id = "total" value = "<%=subtotal %>" required style="margin-left:820px;"  placeholder = "Click here to get Total" value= "" onclick="subtotal()">
				</td>
		    </tr>		     
		     <script>
						var st1 = document.getElementById("st1");
						var st2 = document.getElementById("st2");
						var st3 = document.getElementById("st3");
						var st4 = document.getElementById("st4");
						var st5 = document.getElementById("st5");
						var st6 = document.getElementById("st6");
						var st7 = document.getElementById("st7");
												
						function subtotal() {
						   var first_number = parseFloat(st1.value);
						   if (isNaN(first_number)) first_number = 0;
						   var second_number = parseFloat(st2.value);
						   if (isNaN(second_number)) second_number = 0;
						   var third_number = parseFloat(st3.value);
						   if (isNaN(third_number)) third_number = 0;
						   var fourth_number = parseFloat(st4.value);
						   if (isNaN(fourth_number)) fourth_number = 0;
						   var fifth_number = parseFloat(st5.value);
						   if (isNaN(fifth_number)) fifth_number = 0;
						   var sixth_number = parseFloat(st6.value);
						   if (isNaN(sixth_number)) sixth_number = 0;
						   var seventh_number = parseFloat(st7.value);
						   if (isNaN(seventh_number)) seventh_number = 0;
						   var result = first_number + second_number + third_number + fourth_number + fifth_number + sixth_number + seventh_number ;						  
						   document.getElementById("total").value = result;
						}
			</script>
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
      <%       }
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
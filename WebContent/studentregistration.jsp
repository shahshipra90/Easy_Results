<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
<link rel = "stylesheet" href = "studentregistration.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
</head>
<body background = "background.jpg">
  <form action = "studentreg.jsp" method = "post" name = "form" onsubmit="return validate()"><br><br><br><br><hr>
    <table>
      <tr><th colspan = "4"><b>Student Registration</th></tr>
      <tr></tr>
      <tr></tr>
      <tr></tr>
      <tr></tr>
      <tr><td><span class = "required">&nbsp;Note :  * Indicates mandatory fields</td></tr>
      <tr></tr>
      <tr></tr>
      <tr><td><span class = "required">*</span>First Name</td><td><input type = "text" name = "fname" id = "fname" required></td></tr>
      <tr><td>&nbsp;&nbsp;Last Name</td><td><input type = "text" name = "lname"></td></tr>
      <tr><td><span class = "required">*</span>E-mail</td><td><input type = "email" name = "mail" id = "mail" required ></td></tr>
        <span id="confirm-message1" class="confirm-message1"></span>
      <tr><td><span class = "required">*</span>Confirm E-mail</td><td><input type = "email" name = "conmail" id = "conmail" required></td></tr>
      <span id="confirm-message2" class="confirm-message1"></span>
      <tr><td><span class = "required">*</span>Alternate E-mail</td><td><input type = "email" name = "altmail" id = "altmail" requried></td></tr>
      <tr><td><span class = "required">*</span>Set Password</td><td><input type = "password" name = "pass" id = "pass" required></td></tr>
      <tr><td><span class = "required">*</span>Re-Enter Password</td><td><input type = "password" name = "cpass" id ="cpass" required></td></tr>
      <span id="confirm-message3" class="confirm-message2"></span>
      <tr><td>&nbsp;&nbsp;Gender</td><td><input type = "radio" name = "radio1" class = "radio1" value = "Male">Male<input type = "radio" name = "radio1" class = "radio2" value = "Female">Female</td></tr>
      <tr><td><span class = "required">*</span>Phone No.</td><td><input type = "text" maxlength = "10" name = "phno" id ="phno" required></td></tr>
      <tr><td><span class = "required">*</span>Enrollment</td><td><input type = "text" maxlength = "12" name = "enroll" id = "enroll" required></td></tr>
      <tr><td><span class = "required">*</span>Course Type</td><td><input type = "text" maxlength = "12" name = "course" id = "course" required>  <!--<select name = "course" required>
       <option value = "None">None</option>
        <option value = "Diploma">Diploma</option>
        <option value = "BE">BE</option>
        <option value = "MCA">MCA</option>
        <option value = "MBA">MBA</option>
      </select> --></td></tr>
      <tr><td><span class = "required">*</span>College</td><td><input type = "text" name = "clg" id = "clg" required>
      <tr><td><span class = "required">*</span>Semester</td><td><select required name = "sem" value = "">
        <option value = "None">None</option>
        <option value = "Sem 1">Sem 1</option>
        <option value = "Sem 2">Sem 2</option>
        <option value = "Sem 3">Sem 3</option>
        <option value = "Sem 4">Sem 4</option>
        <option value = "Sem 5">Sem 5</option>
        <option value = "Sem 6">Sem 6</option>
        <option value = "Sem 7">Sem 7</option>
        <option value = "Sem 8">Sem 8</option>
      </select></td></tr>
      <tr><td><span class = "required">*</span>Department</td><td><select name = "dept" required>
        <option value = "None">None</option>
        <option value = "Computer Enggineering"> Computer Enggineering</option>
        <option value = "IT Enggineering">IT Enggineering</option>
        <option value = "Electrical Enggineering">Electrical Enggineering</option>
        <option value = "E & C Enggineering"> E & C Enggineering</option>
        <option value = "Civil Enggineering"> Civil Enggineering</option>
        <option value = "Mechnical Enggineering">Mechnical Enggineering</option>
        <option value = "Aeronautical Enggineering">Aeronautical Enggineering</option>
      </select></td></tr>
      <tr><td><span class = "required">*</span>Exam</td><td><input type = "month" name = "xam" id = "xam">
      <tr><td></td><td><button id = "refresh" onclick = "reload();"><img src = "refresh.png" width="30" height="30"></button>&nbsp; &nbsp; &nbsp;<canvas id="canvas" name = "canvas" width="120" height="30" style="background-image:url('captchabg.jpg');"></td></tr>
      <tr><td><span class = "required">*</span>Enter Captcha Code</td><td><input type = "text" id ="capid"  name="captcha" placeholder="Enter captcha" required></td><tr>
      <tr></tr>
      <tr></tr>
      <tr><td colspan = "4" align = "center"><input type = "submit" value = "Register" class = "button" id = "btn"></td></tr>
      <tr><td colspan = "4" align = "center"><a href = "studentlogin.jsp">Already Registerd?</a></td></tr>
  </table>
</form>
<script type="text/javascript">
  function onPageloadFunc()
  {
    captcha();
  }
  window.onload = onPageloadFunc();
function captcha()
{
  //creating random number 0-9
  var num1 = Math.floor(Math.random()*10);
  var num2 = Math.floor(Math.random()*10);

  var LC = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
  var UC = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

//generating random number 0-25(a-z)
  var i = Math.floor(Math.random()*26);
  var j = Math.floor(Math.random()*26);

  var alpha1 = LC[i];
  var alpha2 = UC[j];

  var combine=[num1,num2,LC[i],UC[j]];

  var index1 = Math.floor(Math.random()*3);
  var index2 = Math.floor(Math.random()*3);
  var index3 = Math.floor(Math.random()*3);
  var index4 = Math.floor(Math.random()*3);

  var ch1 = combine[index1];
  var ch2 = combine[index2];
  var ch3 = combine[index3];
  var ch4 = combine[index4];


  var canvas = document.getElementById("canvas");
  var context = canvas.getContext("2d");
  context.font = "30px monospace";
  context.fillStyle = "green";

  context.clearRect(0, 0, canvas.width, canvas.height);

  context.fillText(ch1, 9,20);
  context.fillText(ch2, 24,26);
  context.fillText(ch3, 36,20);
  context.fillText(ch4, 50,22);

  mycaptcha = ch1+""+ch2+""+ch3+""+ch4;
}
function validate(){
	  var pwd = document.getElementById("pass").value;
	  var cpwd = document.getElementById("cpass").value;
	  
	  var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,30}$/;
	  	if(!pwd.match(pattern)){
	  		alert("Enter atleast one lowercase, one uppercase, one numeric digit, and one special character");
	  		return false;
	  	}
	  	return true;
	  	/*if (pwd!=cpwd)
	  		{
	  			alert("Password and confirm password doesn't match!");
	  			window.location = "studentregistration.jsp";
	  			return false;
	  		}
	  	return true;*/
	  	
}
</script>
</body>
</html>
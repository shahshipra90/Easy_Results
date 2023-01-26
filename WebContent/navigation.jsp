<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href = "navigation1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>        
    <div class = "btn">
      <span class ="fa fa-bars"></span>
    </div>
     <nav class = "sidebar" id="sidebar">
        <ul>
          <li><a href = "dashboard.jsp"><i class="fa fa-home">&nbsp; &nbsp;</i> Dashboard</a></li>
          <li><a href = "#" class ="sub-btn"><i class="fa fa-bookmark">&nbsp; &nbsp; </i>Subject<span class = " fa fa-caret-down first"></span></a>
            <ul class = "sub-show">
              <li><a href = "addsubject.jsp"><i class="fa fa-plus">&nbsp; &nbsp;</i> Add Subject</a></li>
              <li><a href = "dept_sem.jsp"><i class="fa fa-edit">&nbsp; &nbsp;</i> Manage Subject</a></li>
           </ul>
        </li>
         <li><a href = "dept_sem1.jsp"><i class="fa fa-paperclip">&nbsp; &nbsp;</i> Registered Students</a></li>
         <li><a href = "#" class = "res-btn"><i class="fa fa-graduation-cap">&nbsp; &nbsp; </i>Result<span class = "fa fa-caret-down second"></span></a>
           <ul class = "res-show">
             <li><a href = "res_dept_sem.jsp"><i class="fa fa-plus">&nbsp; &nbsp; </i>Add Results</a></li>
             <li><a href = "res_dept_sem1.jsp"><i class="fa fa-edit">&nbsp; &nbsp;</i> Manage Results</a></li>
           </ul>
         </li>
          <li><a href = "#" class = "ores-btn"><i class="fa fa-graduation-cap">&nbsp; &nbsp; </i>Overall Result<span class = "fa fa-caret-down third"></span></a>
           <ul class = "ores-show">
             <li><a href = "overallresult.jsp"><i class="fa fa-plus">&nbsp; &nbsp; </i>Overall Department Results</a></li>
             <li><a href = "overallsem.jsp"><i class="fa fa-edit">&nbsp; &nbsp;</i> Check Overall Department Result</a></li>
           </ul>
         </li>
         <li><a href = "declared_updated.jsp"><i class = "fa fa-plus">&nbsp;&nbsp;</i>Declared & Updated</a></li>
        <li><a href = "admchangepassword.jsp"><i class="fa fa-pencil">&nbsp; &nbsp; </i>Change Password</a></li>
        <li><a href = "admlogout.jsp"><i class="fa fa-sign-out">&nbsp; &nbsp;</i> Logout</a></li>
       </ul>
     </nav>
     <script>
       $('.btn').click(function(){
         $(this).toggleClass("click");
         $('.sidebar').toggleClass("show");
       });
       $('.sub-btn').click(function(){
         $('nav ul .sub-show').toggleClass("show");
          $('nav ul .first').toggleClass("rotate");
       });
       $('.res-btn').click(function(){
         $('nav ul .res-show').toggleClass("show1");
            $('nav ul .second').toggleClass("rotate");
       });
       $('.ores-btn').click(function(){
           $('nav ul .ores-show').toggleClass("show2");
              $('nav ul .third').toggleClass("rotate");
         });
     </script>
      
</body>
</html>
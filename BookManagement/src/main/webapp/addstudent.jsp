<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
if(session.getAttribute("lid")==null)
{
	%>
  <h1>Failure</h1>
  <%
  return ;
}
   
  %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Student </title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="style/style3.css">
 
	<style>
		input[type=email], select {
			width: 150%;
			padding: 12px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
			margin-top: 6px;
			margin-bottom: 16px;
			resize: vertical;
		}
		input[type=tel], select {
			width: 150%;
			padding: 12px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
			margin-top: 6px;
			margin-bottom: 16px;
			resize: vertical;
		}
		form {
		    
			max-width: 500px;
			margin: 100px auto auto auto;
			padding: 20px;
			border: 1px solid #ccc;
			border-radius: 5px;
			background-color: #f2f2f2;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}
		input[type=text], select {
			width: 150%;
			padding: 12px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
			margin-top: 6px;
			margin-bottom: 16px;
			resize: vertical;
		}

		input[type=submit] {
			
			background-color: #4CAF50;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		input[type=submit]:hover {
			background-color: #45a049;
		}
		a[type=submit]{
			
			background-color: #4CAF50;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			text-decoration: none;
		}
		a[type=submit]:hover{
			background-color: #45a049;
		}
		nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}
	</style>
	<script>
            function validateForm(form){
            //var name = document.getElementById("name").value
            var name = $("#name").val()
            var phoneno = $("#phoneno").val()
            if(name.length < 3){
               // document.getElementById("name_err").innerHTML = "Name must have 5 chars"
               $("#name-err").html("Name Must Have 3 Character")
                return false
            }else if(phoneno.length<10){
            	$("#phoneno-err").html("Number must have 10 digit")
                return false
            }else if(phoneno.length>10){
            	$("#phoneno-err").html("Number must have 10 digit")
                return false
            }
            else{
                $("#name-err").html("")
                $("#phoneno-err").html("")
                return form
            }
        }
       </script>
</head>
<body>
<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#my">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-center"
					id="my">
					<div class="nav-item lh-1">
						<h3>Student Section</h3>
					</div>
					<div
						class="navbar-nav col-9 justify-content-end align-items-center">
						<div class="nav-item">
							<a href="libMain.jsp" class="px-3 py-10"><i class="bi bi-house-door-fill"></i> Home</a>
						</div>
						<div class="nav-item">
							<a href="delstudent.jsp" class="px-3 py-10"><i class="bi bi-person-x"></i> Delete</a>
						</div>
						<div class="nav-item">
							<a href="checkdue.jsp" class="px-3 py-10"><i class="bi bi-box-fill"></i> Dues</a>
						</div>
						<div class="nav-item">
							<a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
</nav> 
<div class="container-fluid">
<form action="AddStudent" onSubmit="return validateForm(this)" >
<table align="center">
<tr>
<th colspan="2"><h3>Add Student</h3></th>
</tr>
<%
		String str1= (String)session.getAttribute("stdstatus");
		System.out.println(str1);
		if(str1=="success")
		{
			%>
			<h3 style="color:green"> Record Inserted Successfully !! </h3>
			
			<% 
			session.setAttribute("stdstatus", null);
		}
		if(str1=="failure")
		{
			%>
			<h3 style="color:red">Some Error Occur !</h3>
			<% 
		}
		%>
<tr>
<td> Name</td>
<td>
<input type="text" id="name" name="name" placeholder="Enter student's name">
<br>
<span class="text-danger fst-italic" id="name-err"></span>
</td>
</tr>
<tr>
<td>Email</td>
<td><input type="email" id="email" name="email" placeholder="Enter student's email"></td>
</tr>
<tr> 
<td>Course</td>
<td><input type="text" id="course" name="course" placeholder="Enter student's Course"></td>
</tr>
<tr>
<td>Phone No</td>
<td><input type="tel" id="phoneno" name="phoneno" pattern="[0-9]{10}" placeholder="Enter student's phone no">
<br>
<span class="text-danger fst-italic" id="phoneno-err"></span>
</td>
</tr>
<tr>
<td>Student Id </td>
<td><input type="text" id="sid" name="sid" placeholder="Enter enrollment no.">
</td>
</tr>
<tr>
<td class="text-center"><input type="submit" value="Add Student"></td>
<td class="text-center"><a type="submit" href="allstudent.jsp">All Student</a></td>
<tr>
</table>
	</form>
	</div>
	<br>
	<footer class="site-footer pb-3">
		<div class="container">
			<p>&copy; 2023 Book Management. All rights reserved. | Design By
				Tech Chasers</p>
				</div>
	</footer>
</body>
</html>

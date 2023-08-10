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
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Book Information Form</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="style/style3.css">
  <style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		h1 {
			text-align: center;
			margin-top: 80px;
			color: #333;
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
		label {
			display: block;
			font-size: 18px;
			font-weight: bold;
			margin-bottom: 10px;
			color: #555;
		}
		input[type=text] {
			width: 150%;
			padding: 10px;
			font-size: 16px;
			border: none;
			border-radius: 5px;
			box-shadow: 0px 0px 5px #ccc;
			margin-bottom: 20px;
			box-sizing: border-box;
		}
		input[type=submit] {
			background-color: #333;
			color: #fff;
			padding: 10px 20px;
			font-size: 16px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.2s ease;
		}
		input[type=submit]:hover {
			background-color: #555;
		}
		a[type=submit]{
			
			background-color: #333;
			color: #fff;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			text-decoration: none;
		}
		a[type=submit]:hover{
			background-color: #555;
		}
		nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}
	</style>
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
						<h3>Book Section</h3>
					</div>
					<div
						class="navbar-nav col-9 justify-content-end align-items-center">
						<div class="nav-item">
							<a href="libMain.jsp" class="px-3 py-10"><i class="bi bi-house-door-fill"></i> Home</a>
						</div>
						<div class="nav-item">
							<a href="delbook.jsp" class="px-3 py-10"><i class="bi bi-person-x"></i> Delete</a>
						</div>
						<div class="nav-item">
							<a href="issuebook.jsp" class="px-3 py-10"><i class="bi bi-box-fill"></i> IssueBook</a>
						</div>
						<div class="nav-item">
							<a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
</nav> 
  <form action="AddBook">
	<table align="center" >
	<tr>
<th colspan="2"><h5>ADD BOOKS</h5></th>
</tr>
<%
	String str1= (String)session.getAttribute("baddstatus");
	System.out.println(str1);
	if(str1=="success")
	{
		%>
		<h3 style="color:green"> Record Inserted Successfully !! </h3>
		
		<% 
		session.setAttribute("baddstatus", null);
	}
	if(str1=="failure")
	{
		%>
		<h3 style="color:red">Some Error Occur !</h3>
		<% 
	}
	%>
	<tr>
<td>Book Name</td>
<td>
<input type="text" id="bname" name="bname" placeholder="Enter Book's name">
</td>
</tr>
<tr>
<td>Book ID</td>
<td><input type="text" id="bid" name="bid" placeholder="Enter Book ID"></td>
</tr>
<tr> 
<td>Book Author</td>
<td><input type="text" id="bauthor" name="bauthor" placeholder="Enter Book author's Name"></td>
</tr>
<tr>
<td>Book Subject</td>
<td><input type="text" id="bsubject" name="bsubject" placeholder="Enter Book Subject">
</td>
</tr>
<td class="text-center"><input type="submit" value="Add Book">
</td>
<td class="text-center"><a type="submit" href="allbook.jsp">All Book</a>
</td>
<tr>
</table>
	</form>
	<br>
	<footer class="site-footer pb-3">
		<div class="container">
			<p>&copy; 2023 Book Management. All rights reserved. | Design By
				Tech Chasers</p>
				</div>
	</footer>
</body>
</html>

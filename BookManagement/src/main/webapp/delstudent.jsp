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
<html lang="en">
<head>
<title>Delete Student</title>
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
        .form-container {
  max-width: 500px;
  margin: 100px auto;
}
nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}
form {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding: 30px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

h2 {
  text-align: center;
  margin-bottom: 30px;
}

label {
  font-size: 16px;
  font-weight: 700;
  margin-bottom: 10px;
}

input[type="text"] {
  width: 100%;
  padding: 12px 15px;
  border-radius: 4px;
  border: 1px solid #ccc;
  font-size: 16px;
  margin-bottom: 20px;
}

input[type="submit"] {
  background-color: #4caf50;
  color: #fff;
  border: none;
  border-radius: 4px;
  padding: 12px 15px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
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
    <div class="form-container">
        <h2>Delete Student by ID</h2>
        <form action="DelStudent">
        <%
        String status = (String)session.getAttribute("delstatus");
        if(status=="success")
        {
        	%>
			<h3 style="color:green"> Record Deleted Successfully !! </h3>
			
			<% 
			session.setAttribute("delstatus", null);
        }
        else if(status=="failure")
        {
        	%>
			<h3 style="color:red">Some Error Occur !</h3>
			<% 
        }
        else
        {
        	%>
			<h3 style="color:red">Data Not Found !</h3>
			<% 
        }
        %>
          <label for="student-id">Student ID:</label>
          <input type="text" id="student-id" name="student-id" required>
          <input type="submit" value="Delete">
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
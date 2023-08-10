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
    <title>Issue Book</title>
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
      /* Style for the form container */
      .form-container {
        max-width: 600px;
        margin: 70px auto;
        padding: 20px;
        background-color: #f2f2f2;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      }
nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}
      /* Style for the form fields */
      label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
      }

      input[type="text"], input[type="date"] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
      }

      /* Style for the form button */
      input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
      }

      input[type="submit"]:hover {
        background-color: #45a049;
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
							<a href="addBook.jsp" class="px-3 py-10"><i class="bi bi-box-fill"></i> AddBook</a>
						</div>
						<div class="nav-item">
							<a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
</nav>
    <div class="form-container">
      <form action="IssueBook">
      <%
        String status = (String)session.getAttribute("issuestatus");
        if(status=="success")
        {
        	%>
			<h3 style="color:green"> Book Issue Successfully !! </h3>
			
			<% 
			session.setAttribute("issuestatus", null);
        }
        else if(status=="failure")
        {
        	%>
			<h3 style="color:red">Some Error Occur !</h3>
			<% 
			session.setAttribute("issuestatus", null);
        }
        else if(status=="error")
        {
        	%>
			<h3 style="color:red">Wrong Book-Id / Student-ID !!</h3>
			<% 	
			session.setAttribute("issuestatus", null);
        }
      
        %>
        <label for="bid">Book ID:</label>
        <input type="text" id="bid" name="bid" placeholder="Enter your bid number">

        <label for="sid">Student ID:</label>
        <input type="text" id="sid" name="sid" placeholder="Enter your sid number">

        <label for="issuedate">Issuedate:</label>
        <input type="date" id="issuedate" name="issuedate">

        <label for="duedate">Duedate:</label>
        <input type="date" id="duedate" name="duedate">

        <input type="submit" value="Submit">
      </form>
    </div>
    <footer class="site-footer pb-3">
		<div class="container">
			<p>&copy; 2023 Book Management. All rights reserved. | Design By
				Tech Chasers</p>
				</div>
	</footer>
  </body>
</html>

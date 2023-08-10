<%@page import="com.lib.dao.LibrarianDAOImp"%>
<%@page import="com.lib.dao.LibrarianDAO"%>
<%
if(session.getAttribute("lid")==null)
{
	%>
  <h1>Failure</h1>
  <%
  return ;
}
  %>
  <% 
int id =(Integer)session.getAttribute("lid");
LibrarianDAO find = new LibrarianDAOImp();
String name = find.findById(id);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book Management System</title>
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
  <link rel="stylesheet" href="style/style1.css">
  <style type="text/css">
  main{
  background-image : url('img/Homepage1.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  
  }
  .marq{
  font-family:Segoe Script;
  }
  #hashi{
			background-color:#0080c0;
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
						<h3><%="Welcome"+" <i>"+name+"</i> !" %></h3>
					</div>
					<div
						class="navbar-nav col-9 justify-content-end align-items-center">
						<script src="js/util.js"></script>
						<div class="nav-item" id="clock">
						</div>
						<div class="nav-item">
							<a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
</nav>
  <header>
    <h1>
    <marquee class="marq" bgcolor = "" direction = "left" loop="" >
    Welcome to Book Management System
    </marquee>
    </h1>
   
  </header>
  <main>
  	<div class="slider-container">
		<img src="img/img2.jpg" class="active">
		<img src="img/img3.jpg">
		<img src="img/img4.jpg">
		<img src="img/img5.jpg">
		<div class="prev">&#10094;</div>
		<div class="next">&#10095;</div>
	</div>

	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByTagName("img");
			for (i = 0; i < slides.length; i++) {
				slides[i].classList.remove("active");
			}
			slideIndex++;
			if (slideIndex > slides.length) {slideIndex = 1}
			slides[slideIndex-1].classList.add("active");
			setTimeout(showSlides, 5000); // Change image every 5 seconds
		}

		document.querySelector(".prev").addEventListener("click", function() {
			slideIndex--;
			if (slideIndex < 1) {slideIndex = document.getElementsByTagName("img").length}
			showSlides();
		});

		document.querySelector(".next").addEventListener("click", function() {
			slideIndex++;
			if (slideIndex > document.getElementsByTagName("img").length) {slideIndex = 1}
			showSlides();
		});
	</script>
	<div class="row mt-4">
			<div class="col-6 border border-dark-subtle">
						<div class="row justify-content-center px-5 ">
							<p class="fs-3 fw-bold text-center ">Student Section</p>
							<div class="col-6 ">
								<a href="addstudent.jsp" class="button"><h5>Add Student</h5></a>
							</div>
							<div class="col-6 lh-sm">
								<a href="delstudent.jsp" class="button"><h5>Del Student</h5></a>
								
							</div>
							
						</div>
						<div class="row mt-2 justify-content-center px-5 ">
							<div class="col-6 lh-sm">
								<a href="allstudent.jsp" class="button"><h5>All Student</h5></a>
							</div>
							<div class="col-6 lh-sm">
								<a href="checkdue.jsp" class="button"><h5>Due Student</h5></a>
							</div>
						</div>
					</div>
   
	<div class="col-6 border border-dark-subtle">
						<div class="row justify-content-center px-5">
							<p class="fs-3 fw-bold text-center">Book Section</p>
							<div class="col-6 lh-sm">
								<a href="addBook.jsp" id="hashi" class="button"><h5>Add Book</h5></a>
							</div>
							<div class="col-6 lh-sm">
								<a href="delbook.jsp" id="hashi" class="button"><h5>Del Book</h5></a>
							</div>
							
						</div>
						<div class="row mt-2 justify-content-center px-5">
							<div class="col-6 lh-sm">
								<a href="allbook.jsp" id="hashi" class="button"><h5>All Books</h5></a>
							</div>
							<div class="col-6 lh-sm">
							<a href="issuebook.jsp" id="hashi" class="button"><h5>Issue Book</h5></a>
								
							</div>
						</div>
					</div>
					</div>
  </main>
  <footer class="site-footer pb-0">
		<div class="container">
			<div class="row">
				<div id="AboutUs" class="col-lg-4 col-md-4 col-sm-8 col-8">
					<h5>
						<img src="img/book.png" width="50" height="40">Book
						Management System
					</h5>
					<p>Manage & track the daily work of the library such as issuing
						books, return books, due calculations, etc.</p>
				</div>
				<div class="col-lg-7 col-md-7 col-sm-14 col-14">
					<div class="justify-content-right">
						<ul class="list-unstyled">

							<li id="ContactUs"><h5>Contact Us</h5></li>
							<a>Email:-techchasers@gmail.com</a>
							<br>
							<a>phone:-9898989898</a>

						</ul>

					</div>
				</div>
			</div>
			<p>&copy; 2023 Book Management. All rights reserved. | Design By
				Tech Chasers</p>
				</div>
	</footer>

</body>
</html>
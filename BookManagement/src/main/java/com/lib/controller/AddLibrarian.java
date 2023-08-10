package com.lib.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lib.dao.LibrarianDAO;
import com.lib.dao.LibrarianDAOImp;
import com.lib.dao.StudentDAO;
import com.lib.dao.StudentDAOImp;
import com.lib.dto.Librarian;
import com.lib.dto.Student;
import com.lib.dto.ValidateLibrarian;

// lname  lid  lage  lemail  username  password    
@WebServlet("/AddLibrarian")

public class AddLibrarian extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		LibrarianDAO librarian = null;
		LibrarianDAO vLibrarian = null;
	 String lname = request.getParameter("name");
     String semail = request.getParameter("email");
     String lusername = request.getParameter("username");
     String lpassword = request.getParameter("password");
     int lid =Integer.parseInt(request.getParameter("lid"));
     int sage =Integer.parseInt(request.getParameter("lage"));
     
     Librarian lib = new Librarian();
     
     lib.setLname(lname);
     lib.setSemail(semail);
     lib.setSage(sage);
     lib.setLid(lid);
     
     ValidateLibrarian vlib = new ValidateLibrarian();
     vlib.setLusername(lusername);
     vlib.setLpassword(lpassword);
     vlib.setLid(lid);
          
     librarian = new LibrarianDAOImp();
     String status = librarian.save(lib);
     
     vLibrarian = new LibrarianDAOImp();
     String status2 = vLibrarian.save_login(vlib);
     
     HttpSession session = request.getSession();     
     session.setAttribute("libstatus", status);
     session.setAttribute("vlibstatus", status2);
     response.sendRedirect("AdminMain.jsp");
     System.out.println(status+"---");
     System.out.println(status2+"---");
     
      

	}

	

}

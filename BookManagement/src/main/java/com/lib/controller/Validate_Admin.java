package com.lib.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lib.dao.AdminDAO;
import com.lib.dao.AdminDAOImp;
import com.lib.dao.LibrarianDAO;
import com.lib.dao.LibrarianDAOImp;
import com.lib.dto.ValidateLibrarian;
import com.lib.dto.Validate_AdminLogin;


 
@WebServlet("/Validate_Admin")
public class Validate_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO admindao =null;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	  Validate_AdminLogin Val = new Validate_AdminLogin();
	  Val.setApassword(password);
	  Val.setAusername(username);
	  admindao = new AdminDAOImp();
	   int aid = admindao.adminValidate(Val);
	   HttpSession session = request.getSession();     
       session.setAttribute("aid", aid);
	   System.out.print(aid);
		if(aid==-1)
		{
			 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		       rd.forward(request, response);
		} 
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("AdminMain.jsp");
		       rd.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

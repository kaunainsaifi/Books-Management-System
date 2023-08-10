package com.lib.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lib.dto.Librarian;
import com.lib.dto.ValidateLibrarian;
import com.lib.util.JDBCUtil;

public class LibrarianDAOImp implements LibrarianDAO {
	Connection connection = null;

	public String save(Librarian librarian) {
		PreparedStatement ps = null;
		String status = null;
		String query = "insert into librarian(lname,lid,lage,lemail) values(?,?,?,?)";
		
		try {
		connection = JDBCUtil.physicalConnection();
		if(connection!=null)
		{
			ps =connection.prepareStatement(query);
			if(ps!=null)
			{
				ps.setString(1, librarian.getLname());
				ps.setInt(2, librarian.getLid());
				ps.setInt(3, librarian.getSage());
				ps.setString(4, librarian.getSemail());
			}
			System.out.println(ps);
			if (ps != null) {
				int rowAffected = ps.executeUpdate();
				if (rowAffected == 1) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		
		}
		}catch(Exception e) {
			status="failure";
		}
		return  status;
	}

	public String deleteById(int lid) {
		// TODO Auto-generated method stub
		return null;
	}

	public String findById(int lid) {
		String query = "select lname from librarian where lid=?";
		PreparedStatement pstmt =null;
		try {
			connection = JDBCUtil.physicalConnection(); 
			if(connection!=null)
		    {
				pstmt = connection.prepareStatement(query);
				if (pstmt != null) {
					pstmt.setInt(1, lid);
				}
				if (pstmt != null) {
				  ResultSet rs = pstmt.executeQuery();
				  System.out.println(pstmt);
				  rs.next();
					if(rs!=null)
					{
					   return rs.getString("lname");
					}
					
				}
		    }
		}catch(Exception e) {}
				
		return null;
	}

	public int librarianValidate(ValidateLibrarian validateLib) {
String sqlInsertQuery = "Select lid from logindetails where username=? and password=?";
		
		PreparedStatement pstmt = null;
		
	    try {
			connection = JDBCUtil.physicalConnection();
			if(connection!=null)
		    {
				pstmt = connection.prepareStatement(sqlInsertQuery);
				if (pstmt != null) {
					pstmt.setString(1, validateLib.getLusername());
					pstmt.setString(2, validateLib.getLpassword());
				}
				if (pstmt != null) {
				  ResultSet rs = pstmt.executeQuery();
				  System.out.println(pstmt);
				  rs.next();
					if(rs!=null)
					{
					   return rs.getInt(1);
					}
					
				}
		    }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public String save_login(ValidateLibrarian vlibrarian) {
		PreparedStatement ps = null;
		String status = null;
		String query = "insert into logindetails(lid,username,password) values(?,?,?)";
		
		try {
		connection = JDBCUtil.physicalConnection();
		if(connection!=null)
		{
			ps =connection.prepareStatement(query);
			if(ps!=null)
			{
				ps.setInt(1, vlibrarian.getLid());
				ps.setString(2, vlibrarian.getLusername());
				ps.setString(3, vlibrarian.getLpassword());
			}
			System.out.println(ps);
			if (ps != null) {
				int rowAffected = ps.executeUpdate();
				if (rowAffected == 1) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		
		}
		}catch(Exception e) {
			status="failure";
		}
		return  status;
		
	}
	public String updatePassword(String username, String newPassword) {
		PreparedStatement ps = null;
		String status = null;
		String query = "update logindetails set password =? where username=?";
		
		try {
		connection = JDBCUtil.physicalConnection();
		if(connection!=null)
		{
			ps =connection.prepareStatement(query);
			if (ps != null) {
				ps.setString(2, username);
				ps.setString(1, newPassword);
				int rowAffected = ps.executeUpdate();
				if (rowAffected == 1) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		
		}
		}catch(Exception e) {
			status="failure";
		}
		return  status;
	}
	
}

package com.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.DataCon;

public class UserRegistrationServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	{
		res.setContentType("text/html");
		String username=req.getParameter("uname");
		String password=req.getParameter("password");
		Connection con=DataCon.getCon();
		try {
			Statement st=con.createStatement();
			String query="insert into UserDetails values('"+username+"','"+password+"')";
			try {
				st.executeUpdate(query);
				System.out.println("Registration Successful!!");
				RequestDispatcher rd=req.getRequestDispatcher("/index.html");
				rd.include(req,res);
			} catch(Exception e) {
				try {
					PrintWriter out=res.getWriter();
					out.println("<html>");
					out.println("<body>");
					out.println("<script>");
					out.println("alert('UserName already exists')");
					out.println("</script>");
					out.println("</body>");
					out.println("</html>");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				System.out.println("UserName already exists");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

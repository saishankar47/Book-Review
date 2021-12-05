package com.servlets;
import javax.servlet.*;
import javax.servlet.http.*;

import com.model.DataCon;

import java.io.*;
import java.sql.*;

public class UserServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException , IOException
	{
		res.setContentType("text/html");
		String username=req.getParameter("uname");
		String password=req.getParameter("password");
		System.out.println(username+" "+password);
		Connection con=DataCon.getCon();
		try {
			Statement st=con.createStatement();
			String query="select * from UserDetails where username='"+username+"'";
			ResultSet rs=st.executeQuery(query);
			if(!rs.next())
			{
				System.out.println("Not Existing");
				RequestDispatcher rd=req.getRequestDispatcher("/registration.html");
				rd.forward(req, res);
			}
			else
			{
				if(rs.getString(2).compareTo(password)==0)
				{
					
					System.out.println("Logged in");
					ServletContext sc = getServletContext();
					sc.setAttribute("useratt",username);
					RequestDispatcher rd=req.getRequestDispatcher("UI.jsp");
					rd.forward(req, res);
				}
				else
				{
					System.out.println("Wrong Password");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}

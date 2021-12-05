package com.servlets;
import java.sql.*;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;

import com.model.DataCon;

public class UserComment extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException , IOException
	{
		try {
			Connection con=DataCon.getCon();
			Statement st=con.createStatement();
			String comment = req.getParameter("textareA");
			int post_id = Integer.parseInt(req.getParameter("pid"));
			String query="insert into Comments values("+post_id+",'"+comment+"')";
			int rows=st.executeUpdate(query);
			if(rows==1)
			{
				System.out.println("comment inserted successfully");
				RequestDispatcher rd = req.getRequestDispatcher("readPosts.jsp");
				rd.forward(req, res);
			}
			else
			{
				System.out.println("Couldn't insert");
			}
					
		}
		catch(Exception e)
		{
			
		}
	}

}

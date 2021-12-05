package com.servlets;

import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;

import com.model.DataCon;

import java.io.*;
public class UserPost extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException ,IOException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		try
		{
			Connection con = DataCon.getCon();
			
			ServletContext sc= getServletContext();
			String userName=(String)sc.getAttribute("useratt");
			Statement st = con.createStatement();
			String query ="insert into Posts values('"+userName+"','"+req.getParameter("maintext")+"',ID_INCR.nextval,'"+req.getParameter("title")+"')";
			if(st.executeUpdate(query)==1)
			{
				out.print("<h1>successfully inserted</h1>");
				req.setAttribute("uname",userName);
				RequestDispatcher reqdis = req.getRequestDispatcher("UI.jsp");
				reqdis.forward(req, res);
				
			}
			
		}catch(Exception e)
		{
			System.out.println(e);
			
		}
		
		
		
		
		
	}

}

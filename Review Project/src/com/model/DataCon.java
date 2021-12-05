package com.model;
import java.sql.*;

public class DataCon {
	
	private static Connection con=null;
	public static Connection getCon()
	{	  
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin"); 
			System.out.println("Connection established successfully...");
		}
		catch(Exception e)
		{
			
		}
		
		return con;	
	}

}

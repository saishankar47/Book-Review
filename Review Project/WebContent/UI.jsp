<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
String username = request.getParameter("uname");
if(username==null)
{
	username = (String)request.getAttribute("uname");
	
}
String query= "select * from Posts where username='"+username+"'"+"order by post_id desc";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);



%>

<%@include file="Navbar.jsp" %>

<a href="post.jsp">
<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
</a>

<div class="container" style="border:2px solid red">
 
 <h3>Posts you have made</h3>
 
 <%while(rs.next()) {%>
 <br/><br/>
 <div class="card">
 <div class="card-body">
 
 <h5 class="card-title"><%= rs.getString(4) %></h5>
<%=  rs.getString(2) %>
 </div>
 </div>
 <%} %>
 
 </div>

</body>
</html>
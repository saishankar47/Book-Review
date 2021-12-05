<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="Navbar.jsp" %>
<%
ArrayList<Integer> all = new ArrayList<>();
ArrayList<String> titlearr = new ArrayList<>();
ArrayList<String> postarr = new ArrayList<>();
ArrayList<String> userarr=new ArrayList<>();

ServletContext sc= getServletContext();
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
String username = (String)sc.getAttribute("useratt");
System.out.println(username);
String query= "select * from Posts where username!='"+username+"'";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<div class="container" style="border:2px solid red">
<br/>
 
 <%while(rs.next()) {%>
 <% all.add(rs.getInt(3));
    titlearr.add(rs.getString(4));
    postarr.add(rs.getString(2));
	userarr.add(rs.getString(1)); 
 %>
 
 
 <%} %>
 
 <%for(int i=0;i<all.size();i++) { %>
	<div class="panel-group" id="accordion">
    	<div class="panel panel-default">
      		<div class="panel-heading">
        		<h4 class="panel-title">
          		<a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>"><%=titlearr.get(i) %>------<i>author:<%=userarr.get(i) %></i></a>
        		</h4>
      		</div>
      	</div>
      	<div id="collapse<%=i %>" class="panel-collapse collapse in">
        	<div class="panel-body">
        		<div class="card">
 					<div class="card-body">
 						<p style="font-size:25px;"><%= postarr.get(i) %></p>
 						<form action="commentServlet" method="Post">
							<textarea rows="2" cols="70" name="textareA">

							</textarea>
						<br>
						<input type="hidden" name="pid" value="<%= all.get(i) %>">
						<input type="submit" value="comment" style="font-size:15px;">
						</form>
						<br/>
						<h5 style="border-bottom:1px solid black;">Other Comments</h5>
						<%String query2="select * from Comments where post_id='"+all.get(i)+"'"; %>
 						<%ResultSet rs2=st.executeQuery(query2); %>
 						<%while(rs2.next()) {%>
 						<div class="comments">
 							<h5	class="ml-4"><%=rs2.getString(2) %></h5>
 						</div>
 						<%} %>
        			</div>
      			</div>
    		</div>
    	</div>
    </div>
    
 <%} %>
 
 </div>
</body>
</html>



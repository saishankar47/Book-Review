<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ include file="Navbar.jsp" %>

<div class="container">
<div class="card">

<div class="card-body">
<div class="card-title">New Post</div>
<hr>
<form method="post" action="newPost" >
<input type="text" name="title" placeholder="Title">
<br>
<br>
<textarea name="maintext" cols="70" rows="10"></textarea>
<br>
<input type="submit" value="Post" >
</form>
</div>



</div>


</div>



</body>
</html>
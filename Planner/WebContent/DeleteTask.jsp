<%@page import="com.jabid.UtilCls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Task</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
<%!
UtilCls ul = new UtilCls();
%>
<form class="navbar-form navbar-left">
  Enter ID:<div class="form-group">
    <input type="text" class="form-control" name="id" required>
  </div><br>
  <button type="submit" class="btn btn-primary">Delete</button>
</form>

<%
if(request.getParameter("id")!=null){
	int id = Integer.valueOf(request.getParameter("id"));
	boolean status=ul.delTask(id);
	if(status){
		out.println("<mark>Task Deleted</mark>");
	}
	else{
		out.println("<mark>Task Not Deleted</mark>");
	}
	
}
%>
<br>
<br>
<a class="btn btn-primary" href="index.jsp">Task List</a>
</body>
</html>
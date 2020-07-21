<%@page import="com.jabid.UtilCls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>
<body>
<%!
UtilCls ul = new UtilCls();
%>
	<form name="reg">
	<table class="table tabe-bordered">
		<tr><td>Enter Task Title</td><td><input type="text" name="title" required></td></tr>
		<tr><td>Enter Task Message</td><td><input type="text" name="message" required></td></tr>
		<tr><td>Enter Task Importance Rating [Not Important, Important and Urgent]</td><td><input type="text" name="status" required></td></tr>
		<tr><td><input class="btn btn-primary" type="submit" name="Create"></td><td><input class="btn btn-danger" type="reset" name="Cancel"></td></tr>
	</table>
	</form>
	<%
	if(request.getParameter("title")!=null){
		String title=request.getParameter("title");
		String msg=request.getParameter("message");
		String status=request.getParameter("status");
		boolean sta=ul.insTask(title, msg, status);
		if(sta){
			out.println("<mark>Task Created</mark>");
		}
		else{
			out.println("<mark>Task Not Created</mark>");
		}
	}
	%>
	<br>
<br>
	 <a class="btn btn-primary" href="index.jsp">Task List</a>
</body>
</html>
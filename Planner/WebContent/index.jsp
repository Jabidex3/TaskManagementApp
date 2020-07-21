<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Planner</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>

<body>
	<h5 class="p-3 mb-2 bg-primary text-white">Task List</h5>
  	<div class="container-fluid">
    	
		<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planner", "root", "root");
			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery("select * from tasks");
			int col = 0;
			while (rs.next()){
				col+=1;
			}
			rs = st.executeQuery("select * from tasks");
			boolean addDivTag = false;
			if(col%3!=0){
				addDivTag = true;
			}
			int ctr =0;
			String color ="";
			while (rs.next()) {
				if(rs.getString(4).equals("Not Important")){
					color="text-black bg-success mb-3";
				}
				else if(rs.getString(4).equals("Important")){
					color="text-black bg-warning mb-3";
				}
				else{
					color="text-black bg-danger mb-3";
				}
				
				if (ctr==0 && col!=0){
					ctr+=1;
					col-=1;
					out.println(
					"<div class=\"row\"><div class=\"col\"><div class=\"card "+color +"\" style=\"width: 18rem\"><div class=\"card-header\">"
					+ rs.getInt(1) +
					"</div> <ul class=\"list-group list-group-flush\"><li class=\"list-group-item\">Title: "+rs.getString(2)+"</li>"+
					"<li class=\"list-group-item\">Message: "+rs.getString(3)+"</li><li class=\"list-group-item\">Importance Scale: "+rs.getString(4)+"</li></ul></div></div>");
				}
				else if(ctr>0 && ctr<3 && col!=0 ){
					ctr+=1;
					col-=1;
					out.println(
							"<div class=\"col\"><div class=\"card "+color +"\" style=\"width: 18rem\"><div class=\"card-header\">"
							+ rs.getInt(1) +
							"</div> <ul class=\"list-group list-group-flush\"><li class=\"list-group-item\">Title: "+rs.getString(2)+"</li>"+
							"<li class=\"list-group-item\">Message: "+rs.getString(3)+"</li><li class=\"list-group-item\">Importance Scale: "+rs.getString(4)+"</li></ul></div></div>");
				}
				else{
					if(col!=0 && ctr==3){
						ctr=1;
						col-=1;
						out.println("</div><br>");
						out.println(
								"<div class=\"row\"><div class=\"col-4\"><div class=\"card "+color +"\" style=\"width: 18rem\"><div class=\"card-header\">"
								+ rs.getInt(1) +
								"</div> <ul class=\"list-group list-group-flush\"><li class=\"list-group-item\">Title: "+rs.getString(2)+"</li>"+
								"<li class=\"list-group-item\">Message: "+rs.getString(3)+"</li><li class=\"list-group-item\">Importance Scale: "+rs.getString(4)+"</li></ul></div></div>");
					}
					else{
						col=0;
						ctr=0;
						out.println("</div><br>");
					}
					
				}
				
			}
		%>
		</div>
		
		 <a class="btn btn-primary" href="AddTask.jsp">Add a New Task</a>
		 <a class="btn btn-primary" href="DeleteTask.jsp">Delete An Existing Task</a>
</body>
</html>
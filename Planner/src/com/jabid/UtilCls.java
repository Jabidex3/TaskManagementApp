package com.jabid;

import java.sql.*;

public class UtilCls {
	private static Connection conn = null;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/planner","root","root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public boolean insTask(String a, String b, String c) {//insert task
		boolean response=false;
		String query="insert into tasks values(null,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.execute();
			response=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;
	}
	
	public boolean delTask(int id) { //delete task
		boolean status=false;
		String query="delete from tasks where task_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1,id);
			ps.executeUpdate();
			status=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
}

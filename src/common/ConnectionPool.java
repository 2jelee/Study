package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionPool {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public ConnectionPool() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mariadb://127.0.0.1:3306/kosmo_db";
			String id = "MariaUser";
			String pass = "MariaPass";
			//전역변수 con
			con = DriverManager.getConnection(url,id,pass);
			
			System.out.println("MariaDB 연결성공");
		}
		catch(Exception e) {
			System.out.println("MariaDB 연결 시 예외발생");
			e.printStackTrace();
		}
	
	}
	
	//사용했던 connection객체 반납 (자원반납)
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch (Exception e) {
			System.out.println("DB ConnectionPool 자원반납 시 예외발생");
		}
	}
	
	
}

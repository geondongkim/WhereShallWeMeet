package Project04;

import java.sql.*;
import java.util.*;

public class userDAO {
	Connection conn;
	Statement stmt;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String id = "scott";
	String pwd = "happyday";
	String sql, sql2;
	ResultSet rs;
	int su, num;
	userDTO dto;
	ArrayList<userDTO> dtoL;
	public String userText() {
		return "User DAO 체크 확인!!";		
	}
	public int planner(userDTO dto) {
		sql="select max(user_no) as num from UserInfo01";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				num = rs.getInt("num")+1;
			}
			
			sql2="insert into UserInfo01 values("+num+",'"+
					dto.getUser_name()+"','"+dto.getUser_pwd()+"','"+
					dto.getUser_date()+"','"+dto.getUser_title()+"','"+
					dto.getUser_memo()+"','"+dto.getUser_location()+"','"+dto.getUser_lat()+"','"+ 
					dto.getUser_lng()+"', sysdate)";
			
			su = stmt.executeUpdate(sql2);
			
		}  catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return su;
	}
	public ArrayList<userDTO> planList(){
		dtoL = new ArrayList<userDTO> ();
		sql = "select * from UserInfo01 order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new userDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_title(rs.getString("user_title"));
				dto.setUser_memo(rs.getString("user_memo"));
				dto.setUser_location(rs.getString("user_location"));
				dto.setUser_lat(rs.getString("user_lat"));
				dto.setUser_lng(rs.getString("user_lng"));
				dto.setUser_logtime(rs.getString("user_logtime"));
				dtoL.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return dtoL;
	}
	public ArrayList<userDTO> list04(String user_title){
		dtoL = new ArrayList<userDTO> ();
		sql = "select * from UserInfo01 where user_title = '"+ user_title +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new userDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_title(rs.getString("user_title"));
				dto.setUser_memo(rs.getString("user_memo"));
				dto.setUser_location(rs.getString("user_location"));
				dto.setUser_lat(rs.getString("user_lat"));
				dto.setUser_lng(rs.getString("user_lng"));
				dto.setUser_logtime(rs.getString("user_logtime"));
				dtoL.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return dtoL;
	}
	public ArrayList<userDTO> list01(String user_name){
		dtoL = new ArrayList<userDTO> ();
		sql = "select * from UserInfo01 where user_name = '"+ user_name +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new userDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_title(rs.getString("user_title"));
				dto.setUser_memo(rs.getString("user_memo"));
				dto.setUser_location(rs.getString("user_location"));
				dto.setUser_lat(rs.getString("user_lat"));
				dto.setUser_lng(rs.getString("user_lng"));
				dto.setUser_logtime(rs.getString("user_logtime"));
				dtoL.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return dtoL;
	}
	public ArrayList<userDTO> list02(String user_date){
		dtoL = new ArrayList<userDTO> ();
		sql = "select * from UserInfo01 where user_date = '"+ user_date +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new userDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_title(rs.getString("user_title"));
				dto.setUser_memo(rs.getString("user_memo"));
				dto.setUser_location(rs.getString("user_location"));
				dto.setUser_lat(rs.getString("user_lat"));
				dto.setUser_lng(rs.getString("user_lng"));
				dto.setUser_logtime(rs.getString("user_logtime"));
				dtoL.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return dtoL;
	}
	public ArrayList<userDTO> list03(String user_location){
		dtoL = new ArrayList<userDTO> ();
		sql = "select * from UserInfo01 where user_location = '"+ user_location +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new userDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_title(rs.getString("user_title"));
				dto.setUser_memo(rs.getString("user_memo"));
				dto.setUser_location(rs.getString("user_location"));
				dto.setUser_lat(rs.getString("user_lat"));
				dto.setUser_lng(rs.getString("user_lng"));
				dto.setUser_logtime(rs.getString("user_logtime"));
				dtoL.add(dto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return dtoL;
	}
	
	/*
	public int uDelete(String user_name, String user_date, String user_title) {
		sql = "delete from UserInfo01 where user_name = '"+ user_name +"' and user_date = '"+ user_date +"'"
				+"' and user_title = '"+ user_title +"'";
	*/
	public int uDelete(String user_title) {
		sql = "delete from UserInfo01 where user_title = '"+ user_title +"'";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			su = stmt.executeUpdate(sql);
			return su;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return -1;
	}
}

package Project04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class planDAO {
	Connection conn;
	Statement stmt;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String id = "scott";
	String pwd = "happyday";
	String sql, sql2;
	ResultSet rs;
	int su, num;
	planDTO pto;
	ArrayList<planDTO> ptoL;
	public int schedule(planDTO pto) {
		sql="select max(user_no) as num from Plans";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				num = rs.getInt("num")+1;
			}
			
			sql2="insert into Plans values("+num+",'"+
					pto.getUser_name1()+"','"+pto.getUser_name2()+"','"+pto.getUser_pwd()+"','"+
					pto.getUser_date()+"','"+pto.getUser_title()+"','"+ pto.getUser_lat()+"','"+ 
					pto.getUser_lng()+"', sysdate)";
			
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
	public ArrayList<planDTO> scheduleList(){
		ptoL = new ArrayList<planDTO> ();
		sql = "select * from Plans order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				pto = new planDTO();
				pto.setUser_no(rs.getInt("user_no"));
				pto.setUser_name1(rs.getString("user_name1"));
				pto.setUser_name2(rs.getString("user_name2"));
				pto.setUser_pwd(rs.getString("user_pwd"));
				pto.setUser_date(rs.getString("user_date"));
				pto.setUser_title(rs.getString("user_title"));
				pto.setUser_lat(rs.getString("user_lat"));
				pto.setUser_lng(rs.getString("user_lng"));
				pto.setUser_logtime(rs.getString("user_logtime"));
				ptoL.add(pto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return ptoL;
	}
	public ArrayList<planDTO> scheduleList(String user_title){
		ptoL = new ArrayList<planDTO> ();
		sql = "select * from Plans where user_title = '"+ user_title +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				pto = new planDTO();
				pto.setUser_no(rs.getInt("user_no"));
				pto.setUser_name1(rs.getString("user_name1"));
				pto.setUser_name2(rs.getString("user_name2"));
				pto.setUser_pwd(rs.getString("user_pwd"));
				pto.setUser_date(rs.getString("user_date"));
				pto.setUser_title(rs.getString("user_title"));
				pto.setUser_lat(rs.getString("user_lat"));
				pto.setUser_lng(rs.getString("user_lng"));
				pto.setUser_logtime(rs.getString("user_logtime"));
				ptoL.add(pto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return ptoL;
	}
	public ArrayList<planDTO> scheduleList(String user_name2, String user_pwd){
		ptoL = new ArrayList<planDTO> ();
		sql = "select * from Plans where user_name = '"+ user_name2 +"' and user_pwd = '"+ user_pwd +"' order by USER_LOGTIME desc";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				pto = new planDTO();
				pto.setUser_no(rs.getInt("user_no"));
				pto.setUser_name1(rs.getString("user_name1"));
				pto.setUser_name2(rs.getString("user_name2"));
				pto.setUser_pwd(rs.getString("user_pwd"));
				pto.setUser_date(rs.getString("user_date"));
				pto.setUser_title(rs.getString("user_title"));
				pto.setUser_lat(rs.getString("user_lat"));
				pto.setUser_lng(rs.getString("user_lng"));
				pto.setUser_logtime(rs.getString("user_logtime"));
				ptoL.add(pto);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return ptoL;
	}
	public int pDelete(String user_title) {
		sql = "delete from Plans where user_title = '"+ user_title +"'";
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

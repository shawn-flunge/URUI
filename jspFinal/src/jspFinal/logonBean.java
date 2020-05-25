package jspFinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.mysql.cj.protocol.Resultset;

public class logonBean {

	private static logonBean instance = new logonBean();
	
	public static logonBean getInstance() {
		return instance;
	}
	
	
	public Connection getConnection() {
		
		Connection conn=null;

		try{
			String jdbcUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
			String dbID="jspid2";
			String dbPass="jsp2019";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbID,dbPass);	
				
				
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return conn;
	}
	
	
	public void insertUser(userBean user) {
		Connection conn= null;
		PreparedStatement pstmt=null;
		
		try 
		{
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into user values(?,?,?,?)");
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getCp());
			
			pstmt.executeUpdate();
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}		
	}
	
	
	public int userCheck(String email, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = null;
		
		int count = -1;
		
		try
		{
			conn = getConnection();
			
			query = "SELECT pwd FROM user WHERE email=? and pwd=?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				String result = rs.getString("pwd");
				if(result.equals(pwd))
				{
					count = 1;
				}
				else
				{
					count = 0;
				}
			}
			else
				count=-1;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs != null) {
				try {rs.close();}catch(SQLException e){}
			}
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}
		
		return count;
	}
	
	
	
	public int confirmEmail(String email) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try
		{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select email from user where email=?");
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) 
				x=1;
			else
				x=-1;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs != null) {
				try {rs.close();}catch(SQLException e){}
			}
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}
		
		
		return x;
	}
	
	
	
	public userBean getUser(String email) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		userBean user = null;
		
		try
		{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from user where email=?");
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
			{
			
				user = new userBean();
				user.setEmail(rs.getString("email"));
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setCp(rs.getString("cp"));
				
			}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs != null) {
				try {rs.close();}catch(SQLException e){}
			}
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}
		
		return user;
		
	}
	
	
	public void updateUser(userBean user) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try
		{
			conn=getConnection();
			pstmt = conn.prepareStatement("update user set pwd=?, name=?, cp=? where email=?");
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getCp());
			pstmt.setString(4, user.getEmail());
			pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs != null) {
				try {rs.close();}catch(SQLException e){}
			}
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}
		
	}
	
	
	public int deleteUser(String email, String pwd) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try
		{
			conn=getConnection();
			String orgPwd = pwd;
			pstmt = conn.prepareStatement("select pwd from user where email = ? ");
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				String dbPwd=rs.getString("pwd");
				if(orgPwd==dbPwd)
				{
					pstmt=conn.prepareStatement("delete from user where email = ? ");
					pstmt.setString(1, email);
					pstmt.executeQuery();
					x=1;
				}
				else
					x=0;
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs != null) {
				try {rs.close();}catch(SQLException e){}
			}
			if(pstmt != null) {
				try {pstmt.close();}catch(SQLException e){}
			}
			if(conn != null) {
				try {conn.close();}catch(SQLException e){}
			}
		}
		
		
		return x;
	}
	
	
	
	
}

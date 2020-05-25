package jspFinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class boardDAO {

	private static boardDAO instance = new boardDAO();
	
	public static boardDAO getInstance() {
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
	
	
public void upload(boardBean bean, String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		String sql = null;
		
		if(type.equals("2"))
		{
			sql ="insert into style_board(title,email,content,writingdate) values(?,?,?,(select now()))";
		}
		else
		{
			sql ="insert into script_board(title,email,content,writingdate) values(?,?,?,(select now()))";
		}
		
		try
		{
			conn = getConnection();
			
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getContent());
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
	
	
public void update(boardBean bean, String type) {
	
	Connection conn =null;
	PreparedStatement pstmt=null;
	String sql = null;
	
	if(type.equals("2"))
	{
		sql ="update style_board set title=?, content=? where code=?";
	
	}
	else
	{
		sql ="update script_board set title=?, content=? where code=?";
	}
	
	try
	{
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getTitle());
		pstmt.setString(2, bean.getContent());
		pstmt.setInt(3, bean.getCode());
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


public void delete(int code, String type) {
	
	Connection conn =null;
	PreparedStatement pstmt=null;
	String sql = null;
	
	if(type.equals("2"))
	{
		sql ="delete from style_board where code=?";
	
	}
	else
	{
		sql ="delete from script_board where code=?";
	}
	
	try
	{
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, code);
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



	public void uploadFile(int code, String fileName,String fileRealName, String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		String sql = null;
		
		if(type.equals("2"))
		{
			sql ="insert into style_file values(?,?,?)";
		}
		else
		{
			sql ="insert into script_file values(?,?,?)";
		}
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setString(2, fileName);
			pstmt.setString(3, fileRealName);
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
	
	public int getCode(String title, String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int x=-1;
		
		String sql = null;
		if(type.equals("2"))
		{
			sql ="select code from style_board where title=?";
		}
		else
		{
			sql ="select code from script_board where title=?";
		}
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs=pstmt.executeQuery();
			if(rs.next())
				x= rs.getInt("code");
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
	
	
	
	
	public ArrayList<boardBean> getList(String type, String search) {
		
		ArrayList<boardBean> list = new ArrayList<boardBean>();
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String std =null;
		String search1 =null;
		
		String sql = null;
		if(type.equals("2"))
		{
			if(search.equals(""))
			{
				sql ="select code,title, email,content,writingdate from style_board order by code desc ";
			}
			else
			{
				std = search.substring(0,1);
				search1 = search.substring(1);
				
				if(std.equals("1"))
				{
					sql="select code,title, email,content,writingdate from style_board where email regexp '"+ search1 +"' order by code desc ";
				}
				else 
				{
					sql="select code,title, email,content,writingdate from style_board where title regexp '"+ search1 +"' order by code desc ";
				}
				
			}
			
		}
		else
		{
			if(search.equals(""))
			{
				sql ="select code,title, email,content,writingdate from script_board order by code desc ";
			}
			else
			{
				std = search.substring(0,1);
				search1 = search.substring(1);
				
				if(std.equals("1"))
				{
					sql="select code,title, email,content,writingdate from script_board where email regexp '"+ search1 +"' order by code desc ";
				}
				else 
				{
					sql="select code,title, email,content,writingdate from script_board where title regexp '"+ search1 +"' order by code desc ";
				}
				
			}
			
		}
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				boardBean bean =new boardBean();
				bean.setCode(rs.getInt("code"));
				bean.setTitle(rs.getString("title"));
				bean.setEmail(rs.getString("email"));
				bean.setContent(rs.getString("content"));
				bean.setWritingdate(rs.getString("writingdate"));
				list.add(bean);
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
		
		return list;
	}
	
	
	
	
	
	
	public boardBean getBean(String code, String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		boardBean bean = new boardBean();
		String sql = null;
		if(type.equals("2"))
		{
			sql ="select * from style_board where code=?";
		}
		else
		{
			sql ="select * from script_board where code=?";
		}
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setCode(rs.getInt("code"));
				bean.setTitle(rs.getString("title"));
				bean.setEmail(rs.getString("email"));
				bean.setContent(rs.getString("content"));
				bean.setWritingdate(rs.getString("writingdate"));
			}
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		}finally
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
		
		return bean;
	}
	
	
	
	
	
	
}

package jspFinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class replyDAO {

private static replyDAO instance = new replyDAO();
	
	public static replyDAO getInstance() {
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
	
	
public void upload(replyBean bean, String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		String sql = null;
		
		if(type.equals("2"))
		{
			sql ="insert into style_reply(bcode,email,comment,writingdate) values(?,?,?,(select now()))";
		}
		else
		{
			sql ="insert into script_reply(bcode,email,comment,writingdate) values(?,?,?,(select now()))";
		}
		
		try
		{
			conn = getConnection();
			
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBcode());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getComment());
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


public ArrayList<replyBean> getList(String bcode, String type) {
	
	ArrayList<replyBean> list = new ArrayList<replyBean>();
	Connection conn =null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	
	String sql = null;
	if(type.equals("2"))
	{
		sql ="select email,comment,writingdate from style_reply where bcode = ? order by code desc ";
	}
	else
	{
		sql ="select email,comment,writingdate from script_reply where bcode = ? order by code desc ";
	}
	
	try
	{
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bcode);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			replyBean Rbean =new replyBean();

			Rbean.setEmail(rs.getString("email"));
			Rbean.setComment(rs.getString("comment"));
			Rbean.setWritingdate(rs.getString("writingdate"));
			list.add(Rbean);
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


	
}

package jspFinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class fileDAO {

	
private static fileDAO instance = new fileDAO();
	
	public static fileDAO getInstance() {
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
	
	
public fileBean getBean(String code,String type) {
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		fileBean bean = new fileBean();
		
		String sql = null;
		if(type.equals("2"))
		{
			sql ="select * from style_file where code=?";
		}
		else
		{
			sql ="select * from script_file where code=?";
		}
		
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setCode(rs.getInt("code"));
				bean.setFileName(rs.getString("filename"));
				bean.setFileRealName(rs.getString("filerealname"));
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
	
	
public ArrayList<fileBean> getList(String code ,String type) {
	
	ArrayList<fileBean> list = new ArrayList<fileBean>();
	Connection conn =null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	String sql=null;
	if(type.equals("2"))
	{
		sql ="select code,filename,filerealname from style_file where code=?";
	}
	else
	{
		sql ="select code,filename,filerealname from script_file where code=?";
	}
	
	try
	{
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			fileBean bean =new fileBean();
			bean.setCode(rs.getInt("code"));
			bean.setFileName(rs.getString("filename"));
			bean.setFileRealName(rs.getString("filerealname"));
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
	
	
	
	
	
}

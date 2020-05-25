package jspFinal;

import java.io.Serializable;

public class replyBean implements Serializable{

	private int code;
	private String bcode;
	private String email;
	private String comment;
	private String writingdate;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getWritingdate() {
		return writingdate;
	}
	public void setWritingdate(String writingdate) {
		this.writingdate = writingdate;
	}
	
	
	
	
	
}

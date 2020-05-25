package jspFinal;

import java.io.Serializable;

public class boardBean implements Serializable {
	

	private String title;
	private String email;
	private String content;
	private int code;
	private String writingdate;
	

	public String getWritingdate() {
		return writingdate;
	}
	public void setWritingdate(String writingdate) {
		this.writingdate = writingdate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	

}

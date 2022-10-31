package com.ic.alang.vo;

import java.util.Date;

public class RequestBoardVo {
	private int request_no;
	private int member_no;
	private String request_name;
	private String request_content;
	private Date request_date;
	
	public RequestBoardVo() {
		super();
	}

	public RequestBoardVo(int request_no, int member_no, String request_name, String request_content,
			Date request_date) {
		super();
		this.request_no = request_no;
		this.member_no = member_no;
		this.request_name = request_name;
		this.request_content = request_content;
		this.request_date = request_date;
	}

	public int getRequest_no() {
		return request_no;
	}

	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getRequest_name() {
		return request_name;
	}

	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}

	public String getRequest_content() {
		return request_content;
	}

	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}

	public Date getRequest_date() {
		return request_date;
	}

	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	
	
}

package com.ic.alang.vo;

import java.util.Date;

public class RequestReplyVo {

	private int request_reply_no;
	private int request_no;
	private int member_no;
	private String request_reply_content;
	private Date request_reply_date;
	
	public RequestReplyVo() {
		super();
	}
	
	public RequestReplyVo(int request_reply_no, int request_no, int member_no, String request_reply_content,
			Date request_reply_date) {
		super();
		this.request_reply_no = request_reply_no;
		this.request_no = request_no;
		this.member_no = member_no;
		this.request_reply_content = request_reply_content;
		this.request_reply_date = request_reply_date;
	}

	public int getRequest_reply_no() {
		return request_reply_no;
	}

	public void setRequest_reply_no(int request_reply_no) {
		this.request_reply_no = request_reply_no;
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

	public String getRequest_reply_content() {
		return request_reply_content;
	}

	public void setRequest_reply_content(String request_reply_content) {
		this.request_reply_content = request_reply_content;
	}

	public Date getRequest_reply_date() {
		return request_reply_date;
	}

	public void setRequest_reply_date(Date request_reply_date) {
		this.request_reply_date = request_reply_date;
	}
	
}
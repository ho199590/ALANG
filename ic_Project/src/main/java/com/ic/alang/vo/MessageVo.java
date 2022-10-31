package com.ic.alang.vo;

import java.util.Date;

public class MessageVo {
	 private int message_no;
	   private int message_recv;
	   private int message_send;
	   private String message_title;
	   private String message_content;
	   private Date message_senddate;
	public MessageVo() {
		super();
	}
	public MessageVo(int message_no, int message_recv, int message_send, String message_title, String message_content,
			Date message_senddate) {
		super();
		this.message_no = message_no;
		this.message_recv = message_recv;
		this.message_send = message_send;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_senddate = message_senddate;
	}
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public int getMessage_recv() {
		return message_recv;
	}
	public void setMessage_recv(int message_recv) {
		this.message_recv = message_recv;
	}
	public int getMessage_send() {
		return message_send;
	}
	public void setMessage_send(int message_send) {
		this.message_send = message_send;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_senddate() {
		return message_senddate;
	}
	public void setMessage_senddate(Date message_senddate) {
		this.message_senddate = message_senddate;
	}
	
}

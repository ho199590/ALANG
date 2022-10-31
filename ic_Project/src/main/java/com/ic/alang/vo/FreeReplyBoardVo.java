package com.ic.alang.vo;

import java.util.Date;

public class FreeReplyBoardVo {
	
	private int free_reply_no;
	private int free_no;
	private int member_no;
	private String free_reply_content;
	private Date free_reply_date;
	public FreeReplyBoardVo() {
		super();
	}
	public FreeReplyBoardVo(int free_reply_no, int free_no, int member_no, String free_reply_content,
			Date free_reply_date) {
		super();
		this.free_reply_no = free_reply_no;
		this.free_no = free_no;
		this.member_no = member_no;
		this.free_reply_content = free_reply_content;
		this.free_reply_date = free_reply_date;
	}
	public int getFree_reply_no() {
		return free_reply_no;
	}
	public void setFree_reply_no(int free_reply_no) {
		this.free_reply_no = free_reply_no;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getFree_reply_content() {
		return free_reply_content;
	}
	public void setFree_reply_content(String free_reply_content) {
		this.free_reply_content = free_reply_content;
	}
	public Date getFree_reply_date() {
		return free_reply_date;
	}
	public void setFree_reply_date(Date free_reply_date) {
		this.free_reply_date = free_reply_date;
	}
	
	

}

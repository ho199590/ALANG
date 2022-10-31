package com.ic.alang.vo;

import java.util.Date;

public class FreeBoardVo {
	
	private int free_no;
	private int member_no;
	private String free_title;
	private String free_content;
	private int free_viewcount;
	private Date free_regdate;
	public FreeBoardVo() {
		super();
	}
	public FreeBoardVo(int free_no, int member_no, String free_title, String free_content, int free_viewcount,
			Date free_regdate) {
		super();
		this.free_no = free_no;
		this.member_no = member_no;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_viewcount = free_viewcount;
		this.free_regdate = free_regdate;
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
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public int getFree_viewcount() {
		return free_viewcount;
	}
	public void setFree_viewcount(int free_viewcount) {
		this.free_viewcount = free_viewcount;
	}
	public Date getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}
	
	

}

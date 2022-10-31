package com.ic.alang.vo;

public class FreeImageBoardVo {
	
	private int free_file_no;
	private int free_no;
	private int member_no;
	private String free_file_path;
	private String fraa_file_name;
	public FreeImageBoardVo() {
		super();
	}
	public FreeImageBoardVo(int free_file_no, int free_no, int member_no, String free_file_path,
			String fraa_file_name) {
		super();
		this.free_file_no = free_file_no;
		this.free_no = free_no;
		this.member_no = member_no;
		this.free_file_path = free_file_path;
		this.fraa_file_name = fraa_file_name;
	}
	public int getFree_file_no() {
		return free_file_no;
	}
	public void setFree_file_no(int free_file_no) {
		this.free_file_no = free_file_no;
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
	public String getFree_file_path() {
		return free_file_path;
	}
	public void setFree_file_path(String free_file_path) {
		this.free_file_path = free_file_path;
	}
	public String getFraa_file_name() {
		return fraa_file_name;
	}
	public void setFraa_file_name(String fraa_file_name) {
		this.fraa_file_name = fraa_file_name;
	}

	
}

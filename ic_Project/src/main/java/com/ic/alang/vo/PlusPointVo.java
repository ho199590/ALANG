package com.ic.alang.vo;

public class PlusPointVo {
	
	private int member_no;
	private int plus_point;
	
	public PlusPointVo() {
		
	}

	public PlusPointVo(int member_no, int plus_point) {
		this.member_no = member_no;
		this.plus_point = plus_point;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getPlus_point() {
		return plus_point;
	}

	public void setPlus_point(int plus_point) {
		this.plus_point = plus_point;
	}
	
}

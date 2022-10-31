package com.ic.alang.vo;

import java.util.Date;

public class ReportMemeberListVo {
	private int report_list_no;
	private int member_no;
	private int intrestrain_kind;
	private Date restrain_date;
	public ReportMemeberListVo(int report_list_no, int member_no, int intrestrain_kind, Date restrain_date) {
		super();
		this.report_list_no = report_list_no;
		this.member_no = member_no;
		this.intrestrain_kind = intrestrain_kind;
		this.restrain_date = restrain_date;
	}
	public ReportMemeberListVo() {
		super();
	}
	public int getReport_list_no() {
		return report_list_no;
	}
	public void setReport_list_no(int report_list_no) {
		this.report_list_no = report_list_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getIntrestrain_kind() {
		return intrestrain_kind;
	}
	public void setIntrestrain_kind(int intrestrain_kind) {
		this.intrestrain_kind = intrestrain_kind;
	}
	public Date getRestrain_date() {
		return restrain_date;
	}
	public void setRestrain_date(Date restrain_date) {
		this.restrain_date = restrain_date;
	}
		
}

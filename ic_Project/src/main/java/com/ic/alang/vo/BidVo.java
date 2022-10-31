package com.ic.alang.vo;

import java.util.Date;

public class BidVo {

	private int bid_no;
	private int member_no;
	private int game_no;
	private int bid_point;
	private Date bid_date;
	
	public BidVo() {
		super();
	}

	public BidVo(int bid_no, int member_no, int game_no, int bid_point, Date bid_date) {
		super();
		this.bid_no = bid_no;
		this.member_no = member_no;
		this.game_no = game_no;
		this.bid_point = bid_point;
		this.bid_date = bid_date;
	}

	public int getBid_no() {
		return bid_no;
	}

	public void setBid_no(int bid_no) {
		this.bid_no = bid_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public int getBid_point() {
		return bid_point;
	}

	public void setBid_point(int bid_point) {
		this.bid_point = bid_point;
	}

	public Date getBid_date() {
		return bid_date;
	}

	public void setBid_date(Date bid_date) {
		this.bid_date = bid_date;
	}
	
}

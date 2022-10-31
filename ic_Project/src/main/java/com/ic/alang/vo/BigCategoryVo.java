package com.ic.alang.vo;

public class BigCategoryVo {
	
	private int big_category_no;
	private String big_category_name;
	
	public BigCategoryVo() {
		super();
	}

	public BigCategoryVo(int big_category_no, String big_category_name) {
		super();
		this.big_category_no = big_category_no;
		this.big_category_name = big_category_name;
	}

	public int getBig_category_no() {
		return big_category_no;
	}

	public void setBig_category_no(int big_category_no) {
		this.big_category_no = big_category_no;
	}

	public String getBig_category_name() {
		return big_category_name;
	}

	public void setBig_category_name(String big_category_name) {
		this.big_category_name = big_category_name;
	}
		
}

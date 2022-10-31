package com.ic.alang.vo;

public class SmallCategoryVo {

	private int big_category_no;
	private int small_category_no;
	private String small_Category_Name;
		
	public SmallCategoryVo() {
		super();
	}

	public SmallCategoryVo(int big_category_no, int small_category_no, String small_Category_Name) {
		super();
		this.big_category_no = big_category_no;
		this.small_category_no = small_category_no;
		this.small_Category_Name = small_Category_Name;
	}

	public int getBig_category_no() {
		return big_category_no;
	}

	public void setBig_category_no(int big_category_no) {
		this.big_category_no = big_category_no;
	}

	public int getSmall_category_no() {
		return small_category_no;
	}

	public void setSmall_category_no(int small_category_no) {
		this.small_category_no = small_category_no;
	}

	public String getSmall_Category_Name() {
		return small_Category_Name;
	}

	public void setSmall_Category_Name(String small_Category_Name) {
		this.small_Category_Name = small_Category_Name;
	}
	
	
	
}

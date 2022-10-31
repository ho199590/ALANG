package com.ic.alang.vo;

public class CourseCategoryNameVo {
	
	private String BIG_CATEGORY_NAME;
	private String SMALL_CATEGORY_NAME;
	public CourseCategoryNameVo(String bIG_CATEGORY_NAME, String sMALL_CATEGORY_NAME) {
		super();
		BIG_CATEGORY_NAME = bIG_CATEGORY_NAME;
		SMALL_CATEGORY_NAME = sMALL_CATEGORY_NAME;
	}
	public String getBIG_CATEGORY_NAME() {
		return BIG_CATEGORY_NAME;
	}
	public void setBIG_CATEGORY_NAME(String bIG_CATEGORY_NAME) {
		BIG_CATEGORY_NAME = bIG_CATEGORY_NAME;
	}
	public String getSMALL_CATEGORY_NAME() {
		return SMALL_CATEGORY_NAME;
	}
	public void setSMALL_CATEGORY_NAME(String sMALL_CATEGORY_NAME) {
		SMALL_CATEGORY_NAME = sMALL_CATEGORY_NAME;
	} 
	
	
	public CourseCategoryNameVo() {}

}

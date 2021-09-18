package com.opera.survway.panel.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContext;
	private String faqStatus;
	private int faqCategoryNo;
	private PageInfo pi;
	
	public Faq() {}
	
	public Faq(int faqNo, String faqTitle, String faqContext, String faqStatus, int faqCategoryNo, PageInfo pi) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContext = faqContext;
		this.faqStatus = faqStatus;
		this.faqCategoryNo = faqCategoryNo;
		this.pi = pi;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContext() {
		return faqContext;
	}

	public void setFaqContext(String faqContext) {
		this.faqContext = faqContext;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	public int getFaqCategoryNo() {
		return faqCategoryNo;
	}

	public void setFaqCategoryNo(int faqCategoryNo) {
		this.faqCategoryNo = faqCategoryNo;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContext=" + faqContext + ", faqStatus="
				+ faqStatus + ", faqCategoryNo=" + faqCategoryNo + ", pi=" + pi + "]";
	}

	
	
	
}

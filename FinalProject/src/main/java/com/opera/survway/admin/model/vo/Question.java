package com.opera.survway.admin.model.vo;

public class Question {
	private int researchOrder;
	private int rquestionNo;
	private String rquestionContext;
	public Question() {
		super();
	}
	public Question(int researchOrder, int rquestionNo, String rquestionContext) {
		super();
		this.researchOrder = researchOrder;
		this.rquestionNo = rquestionNo;
		this.rquestionContext = rquestionContext;
	}
	public int getResearchOrder() {
		return researchOrder;
	}
	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}
	public int getRquestionNo() {
		return rquestionNo;
	}
	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}
	public String getRquestionContext() {
		return rquestionContext;
	}
	public void setRquestionContext(String rquestionContext) {
		this.rquestionContext = rquestionContext;
	}
	@Override
	public String toString() {
		return "Question [researchOrder=" + researchOrder + ", rquestionNo=" + rquestionNo + ", rquestionContext="
				+ rquestionContext + "]";
	}
	
	
}

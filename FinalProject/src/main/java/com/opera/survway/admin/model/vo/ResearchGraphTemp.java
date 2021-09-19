package com.opera.survway.admin.model.vo;

public class ResearchGraphTemp {
	private int researchNo;
	private int rquestionNo;
	private int rquestionResponse;
	private int count;
	public ResearchGraphTemp() {
		super();
	}
	public ResearchGraphTemp(int researchNo, int rquestionNo, int rquestionResponse, int count) {
		super();
		this.researchNo = researchNo;
		this.rquestionNo = rquestionNo;
		this.rquestionResponse = rquestionResponse;
		this.count = count;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	public int getRquestionNo() {
		return rquestionNo;
	}
	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}
	public int getRquestionResponse() {
		return rquestionResponse;
	}
	public void setRquestionResponse(int rquestionResponse) {
		this.rquestionResponse = rquestionResponse;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ResearchGraphTemp [researchNo=" + researchNo + ", rquestionNo=" + rquestionNo + ", rquestionResponse="
				+ rquestionResponse + ", count=" + count + "]";
	}
	
	
}

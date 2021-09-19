package com.opera.survway.admin.model.vo;

public class ResearchGraphTemp2 {
	private int rquestionResponse;
	private int count;
	public ResearchGraphTemp2() {
		super();
	}
	public ResearchGraphTemp2(int researchNo, int rquestionNo, int rquestionResponse, int count) {
		super();
		this.rquestionResponse = rquestionResponse;
		this.count = count;
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
		return "ResearchGraphTemp2 [ "+ "rquestionResponse="
				+ rquestionResponse + ", count=" + count + "]";
	}
	
	
}

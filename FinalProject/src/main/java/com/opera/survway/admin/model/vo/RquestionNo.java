package com.opera.survway.admin.model.vo;

public class RquestionNo {
	private int rquestionNo;
	private int researchOrder;
	public RquestionNo() {
		super();
	}
	public RquestionNo(int rquestionNo, int researchOrder) {
		super();
		this.rquestionNo = rquestionNo;
		this.researchOrder = researchOrder;
	}
	public int getRquestionNo() {
		return rquestionNo;
	}
	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}
	public int getResearchOrder() {
		return researchOrder;
	}
	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}
	@Override
	public String toString() {
		return "RquestionNo [rquestionNo=" + rquestionNo + ", researchOrder=" + researchOrder + "]\n";
	}
	
	
}

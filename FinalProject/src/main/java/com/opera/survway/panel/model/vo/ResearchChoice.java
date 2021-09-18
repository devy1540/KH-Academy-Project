/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 * 리서치 정보 불러오기위한 vo 클래스 (진행중인 설문조사)
 */
public class ResearchChoice {
	
	private int rquestionNo;
	private int rchoiceNo;
	private int rchoiceOrder;
	private String rchoiceContext;
	private String cchangeName;
	
	public ResearchChoice() {}

	public ResearchChoice(int rquestionNo, int rchoiceNo, int rchoiceOrder, String rchoiceContext, String cchangeName) {
		super();
		this.rquestionNo = rquestionNo;
		this.rchoiceNo = rchoiceNo;
		this.rchoiceOrder = rchoiceOrder;
		this.rchoiceContext = rchoiceContext;
		this.cchangeName = cchangeName;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	public int getRchoiceNo() {
		return rchoiceNo;
	}

	public void setRchoiceNo(int rchoiceNo) {
		this.rchoiceNo = rchoiceNo;
	}

	public int getRchoiceOrder() {
		return rchoiceOrder;
	}

	public void setRchoiceOrder(int rchoiceOrder) {
		this.rchoiceOrder = rchoiceOrder;
	}

	public String getRchoiceContext() {
		return rchoiceContext;
	}

	public void setRchoiceContext(String rchoiceContext) {
		this.rchoiceContext = rchoiceContext;
	}

	public String getCchangeName() {
		return cchangeName;
	}

	public void setCchangeName(String cchangeName) {
		this.cchangeName = cchangeName;
	}

	@Override
	public String toString() {
		return "ResearchChoice [rquestionNo=" + rquestionNo + ", rchoiceNo=" + rchoiceNo + ", rchoiceOrder="
				+ rchoiceOrder + ", rchoiceContext=" + rchoiceContext + ", cchangeName=" + cchangeName + "]";
	}
	
}

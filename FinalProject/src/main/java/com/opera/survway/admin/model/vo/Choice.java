package com.opera.survway.admin.model.vo;

public class Choice {
	private int rchoiceOrder;
	private String rchoiceContext;
	public Choice() {
		super();
	}
	public Choice(int rchoiceOrder, String rchoiceContext) {
		super();
		this.rchoiceOrder = rchoiceOrder;
		this.rchoiceContext = rchoiceContext;
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
	@Override
	public String toString() {
		return "Choice [rchoiceOrder=" + rchoiceOrder + ", rchoiceContext=" + rchoiceContext + "]";
	}
	
}

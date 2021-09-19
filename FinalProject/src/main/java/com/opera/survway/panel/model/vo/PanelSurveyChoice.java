package com.opera.survway.panel.model.vo;

public class PanelSurveyChoice {
	private int schoiceNo;
	private String schoiceContext;
	private int schoiceOrder;
	private int surveyNo;
	private String changeName;
	
	public PanelSurveyChoice() {}

	public PanelSurveyChoice(int schoiceNo, String schoiceContext, int schoiceOrder, int surveyNo, String changeName) {
		super();
		this.schoiceNo = schoiceNo;
		this.schoiceContext = schoiceContext;
		this.schoiceOrder = schoiceOrder;
		this.surveyNo = surveyNo;
		this.changeName = changeName;
	}

	public int getSchoiceNo() {
		return schoiceNo;
	}

	public void setSchoiceNo(int schoiceNo) {
		this.schoiceNo = schoiceNo;
	}

	public String getSchoiceContext() {
		return schoiceContext;
	}

	public void setSchoiceContext(String schoiceContext) {
		this.schoiceContext = schoiceContext;
	}

	public int getSchoiceOrder() {
		return schoiceOrder;
	}

	public void setSchoiceOrder(int schoiceOrder) {
		this.schoiceOrder = schoiceOrder;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "PanelSurveyChoice [schoiceNo=" + schoiceNo + ", schoiceContext=" + schoiceContext + ", schoiceOrder="
				+ schoiceOrder + ", surveyNo=" + surveyNo + ", changeName=" + changeName + "]";
	}

}

package com.opera.survway.panel.model.vo;

public class Vote {
	private int mno;
	private int surveyNo;
	private int choiceNo;
	private int surveyHistoryNo;
	public Vote() {}
	public Vote(int mno, int surveyNo, int choiceNo, int surveyHistoryNo) {
		super();
		this.mno = mno;
		this.surveyNo = surveyNo;
		this.choiceNo = choiceNo;
		this.surveyHistoryNo = surveyHistoryNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}
	public int getChoiceNo() {
		return choiceNo;
	}
	public void setChoiceNo(int choiceNo) {
		this.choiceNo = choiceNo;
	}
	public int getSurveyHistoryNo() {
		return surveyHistoryNo;
	}
	public void setSurveyHistoryNo(int surveyHistoryNo) {
		this.surveyHistoryNo = surveyHistoryNo;
	}
	@Override
	public String toString() {
		return "Vote [mno=" + mno + ", surveyNo=" + surveyNo + ", choiceNo=" + choiceNo + ", surveyHistoryNo="
				+ surveyHistoryNo + "]";
	}
	
}

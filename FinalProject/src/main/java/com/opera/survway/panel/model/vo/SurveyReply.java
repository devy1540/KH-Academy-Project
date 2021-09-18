package com.opera.survway.panel.model.vo;

public class SurveyReply {
	private int surveyReplyNo;
	private String surveyReplyContext;
	private String surveyReplyDate;
	private int surveyReplyRefRid;
	private int surveyNo;
	private int mno;
	public SurveyReply() {}
	public SurveyReply(int surveyReplyNo, String surveyReplyContext, String surveyReplyDate, int surveyReplyRefRid,
			int surveyNo, int mno) {
		super();
		this.surveyReplyNo = surveyReplyNo;
		this.surveyReplyContext = surveyReplyContext;
		this.surveyReplyDate = surveyReplyDate;
		this.surveyReplyRefRid = surveyReplyRefRid;
		this.surveyNo = surveyNo;
		this.mno = mno;
	}
	public int getSurveyReplyNo() {
		return surveyReplyNo;
	}
	public void setSurveyReplyNo(int surveyReplyNo) {
		this.surveyReplyNo = surveyReplyNo;
	}
	public String getSurveyReplyContext() {
		return surveyReplyContext;
	}
	public void setSurveyReplyContext(String surveyReplyContext) {
		this.surveyReplyContext = surveyReplyContext;
	}
	public String getSurveyReplyDate() {
		return surveyReplyDate;
	}
	public void setSurveyReplyDate(String surveyReplyDate) {
		this.surveyReplyDate = surveyReplyDate;
	}
	public int getSurveyReplyRefRid() {
		return surveyReplyRefRid;
	}
	public void setSurveyReplyRefRid(int surveyReplyRefRid) {
		this.surveyReplyRefRid = surveyReplyRefRid;
	}
	public int getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	@Override
	public String toString() {
		return "SurveyReply [surveyReplyNo=" + surveyReplyNo + ", surveyReplyContext=" + surveyReplyContext
				+ ", surveyReplyDate=" + surveyReplyDate + ", surveyReplyRefRid=" + surveyReplyRefRid + ", surveyNo="
				+ surveyNo + ", mno=" + mno + "]";
	}
	
}

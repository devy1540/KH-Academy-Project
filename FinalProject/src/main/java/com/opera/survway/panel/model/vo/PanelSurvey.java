package com.opera.survway.panel.model.vo;

import java.util.List;

public class PanelSurvey {
	private int surveyNo;
	private String surveyTitle;
	private String surveyDate;
	private int mno;
	private String userName;
	private int scategoryNo;
	private String scategoryName;
	private String surveyContext;
	private int replyCount;
	private int surveyLike;
	private List<PanelSurveyChoice> choiceList;
	
	public PanelSurvey() {}

	public PanelSurvey(int surveyNo, String surveyTitle, String surveyDate, int mno, String userName, int scategoryNo,
			String scategoryName, String surveyContext, int replyCount, int surveyLike,
			List<PanelSurveyChoice> choiceList) {
		super();
		this.surveyNo = surveyNo;
		this.surveyTitle = surveyTitle;
		this.surveyDate = surveyDate;
		this.mno = mno;
		this.userName = userName;
		this.scategoryNo = scategoryNo;
		this.scategoryName = scategoryName;
		this.surveyContext = surveyContext;
		this.replyCount = replyCount;
		this.surveyLike = surveyLike;
		this.choiceList = choiceList;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getSurveyTitle() {
		return surveyTitle;
	}

	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}

	public String getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(String surveyDate) {
		this.surveyDate = surveyDate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getScategoryNo() {
		return scategoryNo;
	}

	public void setScategoryNo(int scategoryNo) {
		this.scategoryNo = scategoryNo;
	}

	public String getScategoryName() {
		return scategoryName;
	}

	public void setScategoryName(String scategoryName) {
		this.scategoryName = scategoryName;
	}

	public String getSurveyContext() {
		return surveyContext;
	}

	public void setSurveyContext(String surveyContext) {
		this.surveyContext = surveyContext;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getSurveyLike() {
		return surveyLike;
	}

	public void setSurveyLike(int surveyLike) {
		this.surveyLike = surveyLike;
	}

	public List<PanelSurveyChoice> getChoiceList() {
		return choiceList;
	}

	public void setChoiceList(List<PanelSurveyChoice> choiceList) {
		this.choiceList = choiceList;
	}

	@Override
	public String toString() {
		return "PanelSurvey [surveyNo=" + surveyNo + ", surveyTitle=" + surveyTitle + ", surveyDate=" + surveyDate
				+ ", mno=" + mno + ", userName=" + userName + ", scategoryNo=" + scategoryNo + ", scategoryName="
				+ scategoryName + ", surveyContext=" + surveyContext + ", replyCount=" + replyCount + ", surveyLike="
				+ surveyLike + ", choiceList=" + choiceList + "]";
	}

}

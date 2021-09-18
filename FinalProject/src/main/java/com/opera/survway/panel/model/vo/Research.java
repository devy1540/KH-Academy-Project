package com.opera.survway.panel.model.vo;

import java.sql.Date;
import java.util.List;

public class Research {
	private int researchNo;
	private String researchName;
	private int researchEngagementGoals;
	private Date researchStartDate;
	private Date researchEndDate;
	private String researchPeriod;
	private int mno;
	private String researchPerpose;
	private int researchMinReward;
	private int researchMaxReward;
	private String researchReward;
	private String rquestionVideolink;
	private List<ResearchQuestion> researchQuestionList;
	
	public Research() {
		super();
	}

	public Research(int researchNo, String researchName, int researchEngagementGoals, Date researchStartDate,
			Date researchEndDate, String researchPeriod, int mno, String researchPerpose, int researchMinReward,
			int researchMaxReward, String researchReward, String rquestionVideolink,
			List<ResearchQuestion> researchQuestionList) {
		super();
		this.researchNo = researchNo;
		this.researchName = researchName;
		this.researchEngagementGoals = researchEngagementGoals;
		this.researchStartDate = researchStartDate;
		this.researchEndDate = researchEndDate;
		this.researchPeriod = researchPeriod;
		this.mno = mno;
		this.researchPerpose = researchPerpose;
		this.researchMinReward = researchMinReward;
		this.researchMaxReward = researchMaxReward;
		this.researchReward = researchReward;
		this.rquestionVideolink = rquestionVideolink;
		this.researchQuestionList = researchQuestionList;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public String getResearchName() {
		return researchName;
	}

	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}

	public int getResearchEngagementGoals() {
		return researchEngagementGoals;
	}

	public void setResearchEngagementGoals(int researchEngagementGoals) {
		this.researchEngagementGoals = researchEngagementGoals;
	}

	public Date getResearchStartDate() {
		return researchStartDate;
	}

	public void setResearchStartDate(Date researchStartDate) {
		this.researchStartDate = researchStartDate;
	}

	public Date getResearchEndDate() {
		return researchEndDate;
	}

	public void setResearchEndDate(Date researchEndDate) {
		this.researchEndDate = researchEndDate;
	}

	public String getResearchPeriod() {
		return researchPeriod;
	}

	public void setResearchPeriod(String researchPeriod) {
		this.researchPeriod = researchPeriod;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getResearchPerpose() {
		return researchPerpose;
	}

	public void setResearchPerpose(String researchPerpose) {
		this.researchPerpose = researchPerpose;
	}

	public int getResearchMinReward() {
		return researchMinReward;
	}

	public void setResearchMinReward(int researchMinReward) {
		this.researchMinReward = researchMinReward;
	}

	public int getResearchMaxReward() {
		return researchMaxReward;
	}

	public void setResearchMaxReward(int researchMaxReward) {
		this.researchMaxReward = researchMaxReward;
	}

	public String getResearchReward() {
		return researchReward;
	}

	public void setResearchReward(String researchReward) {
		this.researchReward = researchReward;
	}

	public String getRquestionVideolink() {
		return rquestionVideolink;
	}

	public void setRquestionVideolink(String rquestionVideolink) {
		this.rquestionVideolink = rquestionVideolink;
	}

	public List<ResearchQuestion> getResearchQuestionList() {
		return researchQuestionList;
	}

	public void setResearchQuestionList(List<ResearchQuestion> researchQuestionList) {
		this.researchQuestionList = researchQuestionList;
	}

	@Override
	public String toString() {
		return "Research [researchNo=" + researchNo + ", researchName=" + researchName + ", researchEngagementGoals="
				+ researchEngagementGoals + ", researchStartDate=" + researchStartDate + ", researchEndDate="
				+ researchEndDate + ", researchPeriod=" + researchPeriod + ", mno=" + mno + ", researchPerpose="
				+ researchPerpose + ", researchMinReward=" + researchMinReward + ", researchMaxReward="
				+ researchMaxReward + ", researchReward=" + researchReward + ", rquestionVideolink="
				+ rquestionVideolink + ", researchQuestionList=" + researchQuestionList + "]";
	}
	
}

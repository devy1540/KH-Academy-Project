package com.opera.survway.admin.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

public class MailingList {
	private int researchNo;						//리서치번호
	private String companyName;					//리서치기업명
	private String researchName;				//리서치제목
	private int researchCount;					//리서치응답인원수
	private int researchEngagementGoals;		//리서치목표인원수
	private String researchPeriod;				//리서치완료시간
	private String currentMailingDate;			//최근전송날짜
	private int researchStateNo;
	private String researchStatus;					//상태
	private PageInfo pi;
	public MailingList() {
		super();
	}
	public MailingList(int researchNo, String companyName, String researchName, int researchCount,
			int researchEngagementGoals, String researchPeriod, String currentMailingDate, int researchStateNo,
			String researchStatus, PageInfo pi) {
		super();
		this.researchNo = researchNo;
		this.companyName = companyName;
		this.researchName = researchName;
		this.researchCount = researchCount;
		this.researchEngagementGoals = researchEngagementGoals;
		this.researchPeriod = researchPeriod;
		this.currentMailingDate = currentMailingDate;
		this.researchStateNo = researchStateNo;
		this.researchStatus = researchStatus;
		this.pi = pi;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getResearchName() {
		return researchName;
	}
	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}
	public int getResearchCount() {
		return researchCount;
	}
	public void setResearchCount(int researchCount) {
		this.researchCount = researchCount;
	}
	public int getResearchEngagementGoals() {
		return researchEngagementGoals;
	}
	public void setResearchEngagementGoals(int researchEngagementGoals) {
		this.researchEngagementGoals = researchEngagementGoals;
	}
	public String getResearchPeriod() {
		return researchPeriod;
	}
	public void setResearchPeriod(String researchPeriod) {
		this.researchPeriod = researchPeriod;
	}
	public String getCurrentMailingDate() {
		return currentMailingDate;
	}
	public void setCurrentMailingDate(String currentMailingDate) {
		this.currentMailingDate = currentMailingDate;
	}
	public int getResearchStateNo() {
		return researchStateNo;
	}
	public void setResearchStateNo(int researchStateNo) {
		this.researchStateNo = researchStateNo;
	}
	public String getResearchStatus() {
		return researchStatus;
	}
	public void setResearchStatus(String researchStatus) {
		this.researchStatus = researchStatus;
	}
	public PageInfo getPi() {
		return pi;
	}
	public void setPi(PageInfo pi) {
		this.pi = pi;
	}
	@Override
	public String toString() {
		return "MailingList [researchNo=" + researchNo + ", companyName=" + companyName + ", researchName="
				+ researchName + ", researchCount=" + researchCount + ", researchEngagementGoals="
				+ researchEngagementGoals + ", researchPeriod=" + researchPeriod + ", currentMailingDate="
				+ currentMailingDate + ", researchStateNo=" + researchStateNo + ", researchStatus=" + researchStatus
				+ ", pi=" + pi + "]";
	}
	
	
	
}

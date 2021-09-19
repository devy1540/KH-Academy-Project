package com.opera.survway.admin.model.vo;


public class ResearchReport {
	private int researchNo; 					// 리서치번호
	private String companyName;
	private String researchName;
	private String startPeriod;
	private String endPeriod;
	public ResearchReport() {
		super();
	}
	public ResearchReport(int researchNo, String companyName, String researchName, String startPeriod,
			String endPeriod) {
		super();
		this.researchNo = researchNo;
		this.companyName = companyName;
		this.researchName = researchName;
		this.startPeriod = startPeriod;
		this.endPeriod = endPeriod;
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
	public String getStartPeriod() {
		return startPeriod;
	}
	public void setStartPeriod(String startPeriod) {
		this.startPeriod = startPeriod;
	}
	public String getEndPeriod() {
		return endPeriod;
	}
	public void setEndPeriod(String endPeriod) {
		this.endPeriod = endPeriod;
	}
	@Override
	public String toString() {
		return "ResearchReport [researchNo=" + researchNo + ", companyName=" + companyName + ", researchName="
				+ researchName + ", startPeriod=" + startPeriod + ", endPeriod=" + endPeriod + "]";
	}
	
	
}

package com.opera.survway.admin.model.vo;

public class ResearchOne {
	private int researchNo;
	private String researchName;
	private String researchEngagementGoals;
	private String researchPeriod;
	private int mno;
	private String researchPerpose;
	private String researchReward;
	private String researchPrice;
	private String researchNamePanel;
	private String targetGender;
	private String targetAgeRange;
	private String targetLocation;
	public ResearchOne() {
		super();
	}
	public ResearchOne(int researchNo, String researchName, String researchEngagementGoals, String researchPeriod, int mno,
			String researchPerpose, String researchReward, String researchPrice, String researchNamePanel,
			String targetGender, String targetAgeRange, String targetLocation) {
		super();
		this.researchNo = researchNo;
		this.researchName = researchName;
		this.researchEngagementGoals = researchEngagementGoals;
		this.researchPeriod = researchPeriod;
		this.mno = mno;
		this.researchPerpose = researchPerpose;
		this.researchReward = researchReward;
		this.researchPrice = researchPrice;
		this.researchNamePanel = researchNamePanel;
		this.targetGender = targetGender;
		this.targetAgeRange = targetAgeRange;
		this.targetLocation = targetLocation;
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
	public String getResearchEngagementGoals() {
		return researchEngagementGoals;
	}
	public void setResearchEngagementGoals(String researchEngagementGoals) {
		this.researchEngagementGoals = researchEngagementGoals;
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
	public String getResearchReward() {
		return researchReward;
	}
	public void setResearchReward(String researchReward) {
		this.researchReward = researchReward;
	}
	public String getResearchPrice() {
		return researchPrice;
	}
	public void setResearchPrice(String researchPrice) {
		this.researchPrice = researchPrice;
	}
	public String getResearchNamePanel() {
		return researchNamePanel;
	}
	public void setResearchNamePanel(String researchNamePanel) {
		this.researchNamePanel = researchNamePanel;
	}
	public String getTargetGender() {
		return targetGender;
	}
	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}
	public String getTargetAgeRange() {
		return targetAgeRange;
	}
	public void setTargetAgeRange(String targetAgeRange) {
		this.targetAgeRange = targetAgeRange;
	}
	public String getTargetLocation() {
		return targetLocation;
	}
	public void setTargetLocation(String targetLocation) {
		this.targetLocation = targetLocation;
	}
	@Override
	public String toString() {
		return "Research [researchNo=" + researchNo + ", researchName=" + researchName + ", researchEngagementGoals="
				+ researchEngagementGoals + ", researchPeriod=" + researchPeriod + ", mno=" + mno + ", researchPerpose="
				+ researchPerpose + ", researchReward=" + researchReward + ", researchPrice=" + researchPrice
				+ ", researchNamePanel=" + researchNamePanel + ", targetGender=" + targetGender + ", targetAgeRange="
				+ targetAgeRange + ", targetLocation=" + targetLocation + "]";
	}
	
	
	
}

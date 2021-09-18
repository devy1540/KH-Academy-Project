package com.opera.survway.panel.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

import java.sql.Date;

public class Reward {
	private int rewardHistoryNo;	//리워드 이력 번호
	private int afterChangePoint;	//리워드 변경시 포인트
	private String changeReason;		//리워드 변경 사유
	private String changeAmount;	//리워드 변경량
	private int mno;				//회원번호
	private Date rewardChangeDate;	//리워드 변경 날자
	private int researchHistoryNo;	//리서치 이력 번호
	private int cashoutHistoryNo;	//현금전환 이력 번호
	private int sHistoryNo;			//패널 서베이 이력 번호
	private int surveyNo;			//패널 서베이 번호
	private PageInfo pi;
	private String researchName;
	private String surveyTitle;
	private int cashoutNo;			//리워드 량
	private Date cashConfirmDate;
	
	public Reward() {}

	public Reward(int rewardHistoryNo, int afterChangePoint, String changeReason, String changeAmount, int mno,
			Date rewardChangeDate, int researchHistoryNo, int cashoutHistoryNo, int sHistoryNo, int surveyNo,
			PageInfo pi, String researchName, String surveyTitle, int cashoutNo, Date cashConfirmDate) {
		super();
		this.rewardHistoryNo = rewardHistoryNo;
		this.afterChangePoint = afterChangePoint;
		this.changeReason = changeReason;
		this.changeAmount = changeAmount;
		this.mno = mno;
		this.rewardChangeDate = rewardChangeDate;
		this.researchHistoryNo = researchHistoryNo;
		this.cashoutHistoryNo = cashoutHistoryNo;
		this.sHistoryNo = sHistoryNo;
		this.surveyNo = surveyNo;
		this.pi = pi;
		this.researchName = researchName;
		this.surveyTitle = surveyTitle;
		this.cashoutNo = cashoutNo;
		this.cashConfirmDate = cashConfirmDate;
	}

	public int getRewardHistoryNo() {
		return rewardHistoryNo;
	}

	public void setRewardHistoryNo(int rewardHistoryNo) {
		this.rewardHistoryNo = rewardHistoryNo;
	}

	public int getAfterChangePoint() {
		return afterChangePoint;
	}

	public void setAfterChangePoint(int afterChangePoint) {
		this.afterChangePoint = afterChangePoint;
	}

	public String getChangeReason() {
		return changeReason;
	}

	public void setChangeReason(String changeReason) {
		this.changeReason = changeReason;
	}

	public String getChangeAmount() {
		return changeAmount;
	}

	public void setChangeAmount(String changeAmount) {
		this.changeAmount = changeAmount;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Date getRewardChangeDate() {
		return rewardChangeDate;
	}

	public void setRewardChangeDate(Date rewardChangeDate) {
		this.rewardChangeDate = rewardChangeDate;
	}

	public int getResearchHistoryNo() {
		return researchHistoryNo;
	}

	public void setResearchHistoryNo(int researchHistoryNo) {
		this.researchHistoryNo = researchHistoryNo;
	}

	public int getCashoutHistoryNo() {
		return cashoutHistoryNo;
	}

	public void setCashoutHistoryNo(int cashoutHistoryNo) {
		this.cashoutHistoryNo = cashoutHistoryNo;
	}

	public int getsHistoryNo() {
		return sHistoryNo;
	}

	public void setsHistoryNo(int sHistoryNo) {
		this.sHistoryNo = sHistoryNo;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	public String getResearchName() {
		return researchName;
	}

	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}

	public String getSurveyTitle() {
		return surveyTitle;
	}

	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}

	public int getCashoutNo() {
		return cashoutNo;
	}

	public void setCashoutNo(int cashoutNo) {
		this.cashoutNo = cashoutNo;
	}

	public Date getCashConfirmDate() {
		return cashConfirmDate;
	}

	public void setCashConfirmDate(Date cashConfirmDate) {
		this.cashConfirmDate = cashConfirmDate;
	}

	@Override
	public String toString() {
		return "Reward [rewardHistoryNo=" + rewardHistoryNo + ", afterChangePoint=" + afterChangePoint
				+ ", changeReason=" + changeReason + ", changeAmount=" + changeAmount + ", mno=" + mno
				+ ", rewardChangeDate=" + rewardChangeDate + ", researchHistoryNo=" + researchHistoryNo
				+ ", cashoutHistoryNo=" + cashoutHistoryNo + ", sHistoryNo=" + sHistoryNo + ", surveyNo=" + surveyNo
				+ ", pi=" + pi + ", researchName=" + researchName + ", surveyTitle=" + surveyTitle + ", cashoutNo="
				+ cashoutNo + ", cashConfirmDate=" + cashConfirmDate + "]";
	}
	
	
	
	

	
	
}

package com.opera.survway.admin.model.vo;

public class PanelRewardHistory {
	private int cashoutHistoryNo; 	// 이력번호
	private int mno;
	private int cashoutAmount; 		// 캐시아웃 량
	private String account; 		// 신청 계좌
	private String applicantDate; 	// 신청일
	private String confrimDate; 	// 승인일
	public PanelRewardHistory() {}
	public PanelRewardHistory(int cashoutHistoryNo, int mno, int cashoutAmount, String account, String applicantDate,
			String confrimDate) {
		super();
		this.cashoutHistoryNo = cashoutHistoryNo;
		this.mno = mno;
		this.cashoutAmount = cashoutAmount;
		this.account = account;
		this.applicantDate = applicantDate;
		this.confrimDate = confrimDate;
	}
	public int getCashoutHistoryNo() {
		return cashoutHistoryNo;
	}
	public void setCashoutHistoryNo(int cashoutHistoryNo) {
		this.cashoutHistoryNo = cashoutHistoryNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCashoutAmount() {
		return cashoutAmount;
	}
	public void setCashoutAmount(int cashoutAmount) {
		this.cashoutAmount = cashoutAmount;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getApplicantDate() {
		return applicantDate;
	}
	public void setApplicantDate(String applicantDate) {
		this.applicantDate = applicantDate;
	}
	public String getConfrimDate() {
		return confrimDate;
	}
	public void setConfrimDate(String confrimDate) {
		this.confrimDate = confrimDate;
	}
	@Override
	public String toString() {
		return "PanelRewardHistory [cashoutHistoryNo=" + cashoutHistoryNo + ", mno=" + mno + ", cashoutAmount="
				+ cashoutAmount + ", account=" + account + ", applicantDate=" + applicantDate + ", confrimDate="
				+ confrimDate + "]";
	}
	
}

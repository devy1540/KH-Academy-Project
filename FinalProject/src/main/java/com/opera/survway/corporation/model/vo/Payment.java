package com.opera.survway.corporation.model.vo;

import java.sql.Date;

public class Payment {
	private String paymentReason;
	private int paymentAmount;
	private Date paymentDate; 
	private int mno;
	private int researchNo;
	public Payment() {}
	public Payment(String paymentReason, int paymentAmount, Date paymentDate, int mno, int researchNo) {
		super();
		this.paymentReason = paymentReason;
		this.paymentAmount = paymentAmount;
		this.paymentDate = paymentDate;
		this.mno = mno;
		this.researchNo = researchNo;
	}
	public String getPaymentReason() {
		return paymentReason;
	}
	public void setPaymentReason(String paymentReason) {
		this.paymentReason = paymentReason;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	@Override
	public String toString() {
		return "Payment [paymentReason=" + paymentReason + ", paymentAmount=" + paymentAmount + ", paymentDate="
				+ paymentDate + ", mno=" + mno + ", researchNo=" + researchNo + "]";
	}
	
}

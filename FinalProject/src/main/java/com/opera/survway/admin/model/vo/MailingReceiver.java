package com.opera.survway.admin.model.vo;

public class MailingReceiver {
	private int receiverHistoryNo;
	private int mailingHistoryNo;
	private int mno;
	
	public MailingReceiver() {
		super();
	}
	public MailingReceiver(int receiverHistoryNo, int mailingHistoryNo, int mno) {
		super();
		this.receiverHistoryNo = receiverHistoryNo;
		this.mailingHistoryNo = mailingHistoryNo;
		this.mno = mno;
	}
	public int getReceiverHistoryNo() {
		return receiverHistoryNo;
	}
	public void setReceiverHistoryNo(int receiverHistoryNo) {
		this.receiverHistoryNo = receiverHistoryNo;
	}
	public int getMailingHistoryNo() {
		return mailingHistoryNo;
	}
	public void setMailingHistoryNo(int mailingHistoryNo) {
		this.mailingHistoryNo = mailingHistoryNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	@Override
	public String toString() {
		return "MailingReceiver [receiverHistoryNo=" + receiverHistoryNo + ", mailingHistoryNo=" + mailingHistoryNo
				+ ", mno=" + mno + "]";
	}
	
	
}

package com.opera.survway.panel.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContext;
	private Date noticeDate;
	private String noticeDateStr;
	private int noticeViewCount;
	private int mno;
	private String noticeStatus;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContext, Date noticeDate, String noticeDateStr,
			int noticeViewCount, int mno, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContext = noticeContext;
		this.noticeDate = noticeDate;
		this.noticeDateStr = noticeDateStr;
		this.noticeViewCount = noticeViewCount;
		this.mno = mno;
		this.noticeStatus = noticeStatus;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContext() {
		return noticeContext;
	}

	public void setNoticeContext(String noticeContext) {
		this.noticeContext = noticeContext;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeDateStr() {
		return noticeDateStr;
	}

	public void setNoticeDateStr(String noticeDateStr) {
		this.noticeDateStr = noticeDateStr;
	}

	public int getNoticeViewCount() {
		return noticeViewCount;
	}

	public void setNoticeViewCount(int noticeViewCount) {
		this.noticeViewCount = noticeViewCount;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContext=" + noticeContext
				+ ", noticeDate=" + noticeDate + ", noticeDateStr=" + noticeDateStr + ", noticeViewCount="
				+ noticeViewCount + ", mno=" + mno + ", noticeStatus=" + noticeStatus + "]";
	}

}

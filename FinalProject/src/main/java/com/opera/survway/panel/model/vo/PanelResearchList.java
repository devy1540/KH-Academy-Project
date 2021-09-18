package com.opera.survway.panel.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

import java.sql.Date;

public class PanelResearchList {
	//참여 한 조사 목록
	private int researchNo;
	private Date researchResponseDate;
	private Date attemptDate;
	private String researchName;
	private int mno;
	private PageInfo pi;
	
	public PanelResearchList() {}

	public PanelResearchList(int researchNo, Date researchResponseDate, Date attemptDate, String researchName, int mno,
			PageInfo pi) {
		super();
		this.researchNo = researchNo;
		this.researchResponseDate = researchResponseDate;
		this.attemptDate = attemptDate;
		this.researchName = researchName;
		this.mno = mno;
		this.pi = pi;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public Date getResearchResponseDate() {
		return researchResponseDate;
	}

	public void setResearchResponseDate(Date researchResponseDate) {
		this.researchResponseDate = researchResponseDate;
	}

	public Date getAttemptDate() {
		return attemptDate;
	}

	public void setAttemptDate(Date attemptDate) {
		this.attemptDate = attemptDate;
	}

	public String getResearchName() {
		return researchName;
	}

	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	@Override
	public String toString() {
		return "PanelResearchList [researchNo=" + researchNo + ", researchResponseDate=" + researchResponseDate
				+ ", attemptDate=" + attemptDate + ", researchName=" + researchName + ", mno=" + mno + ", pi=" + pi
				+ "]";
	}

	
	
	
	
	
}

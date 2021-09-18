package com.opera.survway.corporation.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

import java.util.Arrays;

public class SearchResearch {
	private String[] researchState;
	private String researchName;
	private PageInfo pi;
	private int mno;
	
	public SearchResearch() {}

	public SearchResearch(String[] researchState, String researchName, PageInfo pi, int mno) {
		super();
		this.researchState = researchState;
		this.researchName = researchName;
		this.pi = pi;
		this.mno = mno;
	}

	public String[] getResearchState() {
		return researchState;
	}

	public void setResearchState(String[] researchState) {
		this.researchState = researchState;
	}

	public String getResearchName() {
		return researchName;
	}

	public void setResearchName(String researchName) {
		this.researchName = researchName;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "SearchResearch [researchState=" + Arrays.toString(researchState) + ", researchName=" + researchName
				+ ", pi=" + pi + ", mno=" + mno + "]";
	}

}

package com.opera.survway.admin.model.vo;

public class ResearchHistory {
	private int researchHistoryNo; 				// 리서치이력번호
	private int researchNo; 					// 리서치번호
	private int mno; 							// 리서치참여(패널)
	private String researchDisposal; 			// 리서치응답폐기여부
	private String researchTime; 				// 리서치응답시간
	private int rquestionNo; 					// 문제번호
	private String researchResponseDate; 		// 리서치응답날짜
	private String rquestionResponse; 			// 리서치응답내용
	private int offset;
	public ResearchHistory() {
		super();
	}
	public ResearchHistory(int researchHistoryNo, int researchNo, int mno, String researchDisposal, String researchTime,
			int rquestionNo, String researchResponseDate, String rquestionResponse, int offset) {
		super();
		this.researchHistoryNo = researchHistoryNo;
		this.researchNo = researchNo;
		this.mno = mno;
		this.researchDisposal = researchDisposal;
		this.researchTime = researchTime;
		this.rquestionNo = rquestionNo;
		this.researchResponseDate = researchResponseDate;
		this.rquestionResponse = rquestionResponse;
		this.offset = offset;
	}
	public int getResearchHistoryNo() {
		return researchHistoryNo;
	}
	public void setResearchHistoryNo(int researchHistoryNo) {
		this.researchHistoryNo = researchHistoryNo;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getResearchDisposal() {
		return researchDisposal;
	}
	public void setResearchDisposal(String researchDisposal) {
		this.researchDisposal = researchDisposal;
	}
	public String getResearchTime() {
		return researchTime;
	}
	public void setResearchTime(String researchTime) {
		this.researchTime = researchTime;
	}
	public int getRquestionNo() {
		return rquestionNo;
	}
	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}
	public String getResearchResponseDate() {
		return researchResponseDate;
	}
	public void setResearchResponseDate(String researchResponseDate) {
		this.researchResponseDate = researchResponseDate;
	}
	public String getRquestionResponse() {
		return rquestionResponse;
	}
	public void setRquestionResponse(String rquestionResponse) {
		this.rquestionResponse = rquestionResponse;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	@Override
	public String toString() {
		return "ResearchHistory [researchHistoryNo=" + researchHistoryNo + ", researchNo=" + researchNo + ", mno=" + mno
				+ ", researchDisposal=" + researchDisposal + ", researchTime=" + researchTime + ", rquestionNo="
				+ rquestionNo + ", researchResponseDate=" + researchResponseDate + ", rquestionResponse="
				+ rquestionResponse + ", offset=" + offset + "]\n";
	}

	

}

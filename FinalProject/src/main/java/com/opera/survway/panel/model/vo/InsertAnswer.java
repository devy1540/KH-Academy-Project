/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class InsertAnswer {
	
	private int mno;
	private int researchNo;
	private String totalAnswer;
	private String researchTime;
	private String researchDisposal;
	private int rquestionNo;
	private String rquestionResponse;
	private int pcCount;
	private String pcAnswer;
	private int targetCount;
	private String targetAnswer;
	private int researchOrder;
	private String disposalReason;
	private int researchhistoryNo;
	private int ternaryCount;
	private String ternaryReason;
	
	public InsertAnswer() {}

	public InsertAnswer(int mno, int researchNo, String totalAnswer, String researchTime, String researchDisposal,
			int rquestionNo, String rquestionResponse, int pcCount, String pcAnswer, int targetCount,
			String targetAnswer, int researchOrder, String disposalReason, int researchhistoryNo, int ternaryCount,
			String ternaryReason) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
		this.totalAnswer = totalAnswer;
		this.researchTime = researchTime;
		this.researchDisposal = researchDisposal;
		this.rquestionNo = rquestionNo;
		this.rquestionResponse = rquestionResponse;
		this.pcCount = pcCount;
		this.pcAnswer = pcAnswer;
		this.targetCount = targetCount;
		this.targetAnswer = targetAnswer;
		this.researchOrder = researchOrder;
		this.disposalReason = disposalReason;
		this.researchhistoryNo = researchhistoryNo;
		this.ternaryCount = ternaryCount;
		this.ternaryReason = ternaryReason;
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

	public String getTotalAnswer() {
		return totalAnswer;
	}

	public void setTotalAnswer(String totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	public String getResearchTime() {
		return researchTime;
	}

	public void setResearchTime(String researchTime) {
		this.researchTime = researchTime;
	}

	public String getResearchDisposal() {
		return researchDisposal;
	}

	public void setResearchDisposal(String researchDisposal) {
		this.researchDisposal = researchDisposal;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	public String getRquestionResponse() {
		return rquestionResponse;
	}

	public void setRquestionResponse(String rquestionResponse) {
		this.rquestionResponse = rquestionResponse;
	}

	public int getPcCount() {
		return pcCount;
	}

	public void setPcCount(int pcCount) {
		this.pcCount = pcCount;
	}

	public String getPcAnswer() {
		return pcAnswer;
	}

	public void setPcAnswer(String pcAnswer) {
		this.pcAnswer = pcAnswer;
	}

	public int getTargetCount() {
		return targetCount;
	}

	public void setTargetCount(int targetCount) {
		this.targetCount = targetCount;
	}

	public String getTargetAnswer() {
		return targetAnswer;
	}

	public void setTargetAnswer(String targetAnswer) {
		this.targetAnswer = targetAnswer;
	}

	public int getResearchOrder() {
		return researchOrder;
	}

	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}

	public String getDisposalReason() {
		return disposalReason;
	}

	public void setDisposalReason(String disposalReason) {
		this.disposalReason = disposalReason;
	}

	public int getResearchhistoryNo() {
		return researchhistoryNo;
	}

	public void setResearchhistoryNo(int researchhistoryNo) {
		this.researchhistoryNo = researchhistoryNo;
	}

	public int getTernaryCount() {
		return ternaryCount;
	}

	public void setTernaryCount(int ternaryCount) {
		this.ternaryCount = ternaryCount;
	}

	public String getTernaryReason() {
		return ternaryReason;
	}

	public void setTernaryReason(String ternaryReason) {
		this.ternaryReason = ternaryReason;
	}

	@Override
	public String toString() {
		return "InsertAnswer [mno=" + mno + ", researchNo=" + researchNo + ", totalAnswer=" + totalAnswer
				+ ", researchTime=" + researchTime + ", researchDisposal=" + researchDisposal + ", rquestionNo="
				+ rquestionNo + ", rquestionResponse=" + rquestionResponse + ", pcCount=" + pcCount + ", pcAnswer="
				+ pcAnswer + ", targetCount=" + targetCount + ", targetAnswer=" + targetAnswer + ", researchOrder="
				+ researchOrder + ", disposalReason=" + disposalReason + ", researchhistoryNo=" + researchhistoryNo
				+ ", ternaryCount=" + ternaryCount + ", ternaryReason=" + ternaryReason + "]";
	}
	
}




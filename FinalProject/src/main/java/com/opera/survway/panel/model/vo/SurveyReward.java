/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class SurveyReward {
	
	private int mno;
	private int afterchangePoint;
	private int researchNo;
	private int surveyReward;
	
	public SurveyReward() {}

	public SurveyReward(int mno, int afterchangePoint, int researchNo, int surveyReward) {
		super();
		this.mno = mno;
		this.afterchangePoint = afterchangePoint;
		this.researchNo = researchNo;
		this.surveyReward = surveyReward;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAfterchangePoint() {
		return afterchangePoint;
	}

	public void setAfterchangePoint(int afterchangePoint) {
		this.afterchangePoint = afterchangePoint;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public int getSurveyReward() {
		return surveyReward;
	}

	public void setSurveyReward(int surveyReward) {
		this.surveyReward = surveyReward;
	}

	@Override
	public String toString() {
		return "SurveyReward [mno=" + mno + ", afterchangePoint=" + afterchangePoint + ", researchNo=" + researchNo
				+ ", surveyReward=" + surveyReward + "]";
	}
	
}

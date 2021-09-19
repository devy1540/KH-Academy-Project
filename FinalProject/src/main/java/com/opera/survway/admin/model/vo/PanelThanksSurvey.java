package com.opera.survway.admin.model.vo;

import com.opera.survway.corporation.model.vo.ResearchChoice;

import java.util.ArrayList;

public class PanelThanksSurvey {
	private int mno;	//해당 패널의 번호
	private int researchNo;		//리서치 번호 예) researchNo =1 이면 thanks서베이
	private int rquestionNo; 	//문제 번호 리서치 문항 보기 번호 예)thanksSurvey의 문항 번호들 66~79
	private String rquestionResponse;	//패널이 응답한 번호
	private int researchOrder;		//문제 번호
	private String rquestionContext;//문제
	
	ArrayList<ResearchChoice> choiceList;
	
	public PanelThanksSurvey() {}

	public PanelThanksSurvey(int mno, int researchNo, int rquestionNo, String rquestionResponse, int researchOrder,
			String rquestionContext, ArrayList<ResearchChoice> choiceList) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
		this.rquestionNo = rquestionNo;
		this.rquestionResponse = rquestionResponse;
		this.researchOrder = researchOrder;
		this.rquestionContext = rquestionContext;
		this.choiceList = choiceList;
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

	public int getResearchOrder() {
		return researchOrder;
	}

	public void setResearchOrder(int researchOrder) {
		this.researchOrder = researchOrder;
	}

	public String getRquestionContext() {
		return rquestionContext;
	}

	public void setRquestionContext(String rquestionContext) {
		this.rquestionContext = rquestionContext;
	}

	public ArrayList<ResearchChoice> getChoiceList() {
		return choiceList;
	}

	public void setChoiceList(ArrayList<ResearchChoice> choiceList) {
		this.choiceList = choiceList;
	}

	@Override
	public String toString() {
		return "PanelThanksSurvey [mno=" + mno + ", researchNo=" + researchNo + ", rquestionNo=" + rquestionNo
				+ ", rquestionResponse=" + rquestionResponse + ", researchOrder=" + researchOrder
				+ ", rquestionContext=" + rquestionContext + ", choiceList=" + choiceList + "]";
	}

}

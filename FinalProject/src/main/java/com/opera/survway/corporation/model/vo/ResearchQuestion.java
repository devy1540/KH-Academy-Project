package com.opera.survway.corporation.model.vo;

import com.opera.survway.common.model.vo.UploadFile;

import java.util.ArrayList;

public class ResearchQuestion {
	private int questionNo;
	private int questionFormNo;
	private String rquestionContext;
	private int researchNo;
	private String mediaExist;
	private String questionVideoLink;
	private String mediaExplain;
	private int questionOrder;
	private int correctAnswer;
	
	private UploadFile image;
	private ArrayList<ResearchChoice> requestChoiceList;

	public ResearchQuestion() {}

	public ResearchQuestion(int questionNo, int questionFormNo, String rquestionContext, int researchNo,
			String mediaExist, String questionVideoLink, String mediaExplain, int questionOrder, int correctAnswer,
			UploadFile image, ArrayList<ResearchChoice> requestChoiceList) {
		super();
		this.questionNo = questionNo;
		this.questionFormNo = questionFormNo;
		this.rquestionContext = rquestionContext;
		this.researchNo = researchNo;
		this.mediaExist = mediaExist;
		this.questionVideoLink = questionVideoLink;
		this.mediaExplain = mediaExplain;
		this.questionOrder = questionOrder;
		this.correctAnswer = correctAnswer;
		this.image = image;
		this.requestChoiceList = requestChoiceList;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getQuestionFormNo() {
		return questionFormNo;
	}

	public void setQuestionFormNo(int questionFormNo) {
		this.questionFormNo = questionFormNo;
	}

	public String getRquestionContext() {
		return rquestionContext;
	}

	public void setRquestionContext(String rquestionContext) {
		this.rquestionContext = rquestionContext;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	public String getMediaExist() {
		return mediaExist;
	}

	public void setMediaExist(String mediaExist) {
		this.mediaExist = mediaExist;
	}

	public String getQuestionVideoLink() {
		return questionVideoLink;
	}

	public void setQuestionVideoLink(String questionVideoLink) {
		this.questionVideoLink = questionVideoLink;
	}

	public String getMediaExplain() {
		return mediaExplain;
	}

	public void setMediaExplain(String mediaExplain) {
		this.mediaExplain = mediaExplain;
	}

	public int getQuestionOrder() {
		return questionOrder;
	}

	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}

	public int getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public UploadFile getImage() {
		return image;
	}

	public void setImage(UploadFile image) {
		this.image = image;
	}

	public ArrayList<ResearchChoice> getRequestChoiceList() {
		return requestChoiceList;
	}

	public void setRequestChoiceList(ArrayList<ResearchChoice> requestChoiceList) {
		this.requestChoiceList = requestChoiceList;
	}

	@Override
	public String toString() {
		return "ResearchQuestion [questionNo=" + questionNo + ", questionFormNo=" + questionFormNo
				+ ", rquestionContext=" + rquestionContext + ", researchNo=" + researchNo + ", mediaExist=" + mediaExist
				+ ", questionVideoLink=" + questionVideoLink + ", mediaExplain=" + mediaExplain + ", questionOrder="
				+ questionOrder + ", correctAnswer=" + correctAnswer + ", image=" + image + ", requestChoiceList="
				+ requestChoiceList + "]";
	}


}

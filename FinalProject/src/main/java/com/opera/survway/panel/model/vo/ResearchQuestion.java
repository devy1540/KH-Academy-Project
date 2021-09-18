/**
 * 
 */
package com.opera.survway.panel.model.vo;

import java.util.List;

/**
 * @author Sooo
 * 리서치 정보 불러오기위한 vo 클래스 (진행중인 설문조사)
 */
public class ResearchQuestion {
	
	//필수정보
	private String questionType;
	private int questionFormNo;
	private int rquestionNo;
	private int researchNo;
	private int researchOrder;
	private String rquestionContext;
	private List<ResearchChoice> choiceList;
	private int progressDataPercent;
	private int totalOrder;
	//첨부파일 있을경우
	private String rquestionVideolink;
	private String mediaExplain;
	private int fileNo;
	private String fileType;
	private String originName;
	private String qchangeName;
	private String filePath;
	private int correctAnswer;
	
	public ResearchQuestion() {}

	public ResearchQuestion(String questionType, int questionFormNo, int rquestionNo, int researchNo, int researchOrder,
			String rquestionContext, List<ResearchChoice> choiceList, int progressDataPercent, int totalOrder,
			String rquestionVideolink, String mediaExplain, int fileNo, String fileType, String originName,
			String qchangeName, String filePath, int correctAnswer) {
		super();
		this.questionType = questionType;
		this.questionFormNo = questionFormNo;
		this.rquestionNo = rquestionNo;
		this.researchNo = researchNo;
		this.researchOrder = researchOrder;
		this.rquestionContext = rquestionContext;
		this.choiceList = choiceList;
		this.progressDataPercent = progressDataPercent;
		this.totalOrder = totalOrder;
		this.rquestionVideolink = rquestionVideolink;
		this.mediaExplain = mediaExplain;
		this.fileNo = fileNo;
		this.fileType = fileType;
		this.originName = originName;
		this.qchangeName = qchangeName;
		this.filePath = filePath;
		this.correctAnswer = correctAnswer;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getQuestionFormNo() {
		return questionFormNo;
	}

	public void setQuestionFormNo(int questionFormNo) {
		this.questionFormNo = questionFormNo;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
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

	public List<ResearchChoice> getChoiceList() {
		return choiceList;
	}

	public void setChoiceList(List<ResearchChoice> choiceList) {
		this.choiceList = choiceList;
	}

	public int getProgressDataPercent() {
		return progressDataPercent;
	}

	public void setProgressDataPercent(int progressDataPercent) {
		this.progressDataPercent = progressDataPercent;
	}

	public int getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(int totalOrder) {
		this.totalOrder = totalOrder;
	}

	public String getRquestionVideolink() {
		return rquestionVideolink;
	}

	public void setRquestionVideolink(String rquestionVideolink) {
		this.rquestionVideolink = rquestionVideolink;
	}

	public String getMediaExplain() {
		return mediaExplain;
	}

	public void setMediaExplain(String mediaExplain) {
		this.mediaExplain = mediaExplain;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getQchangeName() {
		return qchangeName;
	}

	public void setQchangeName(String qchangeName) {
		this.qchangeName = qchangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	@Override
	public String toString() {
		return "ResearchQuestion [questionType=" + questionType + ", progressDataPercent=" + progressDataPercent + 
				", questionFormNo=" + questionFormNo
				+ ", rquestionNo=" + rquestionNo + ", researchNo=" + researchNo + ", researchOrder=" + researchOrder
				+ ", rquestionContext=" + rquestionContext  + ", totalOrder=" + totalOrder + ", rquestionVideolink=" + rquestionVideolink
				+ ", mediaExplain=" + mediaExplain + ", fileNo=" + fileNo + ", fileType=" + fileType + ", originName="
				+ originName + ", qchangeName=" + qchangeName + ", filePath=" + filePath + ", correctAnswer="
				+ correctAnswer + "]" + ",\n choiceList=" + choiceList + "\n" ;
	}

}

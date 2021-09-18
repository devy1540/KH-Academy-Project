package com.opera.survway.common.model.vo;

import java.sql.Date;

public class UploadFile {
	private int fileNo;
	private String fileType;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String fileStatus;
	private int mno;
	private int schoiceNo;
	private int noticeNo;
	private int rquestionNo;
	private int rchoiceNo;
	private int researchNo;
	public UploadFile() {}
	
	public UploadFile(int fileNo, String fileType, String originName, String changeName, String filePath,
			Date uploadDate, String fileStatus, int mno, int schoiceNo, int noticeNo, int rquestionNo, int rchoiceNo,
			int researchNo) {
		super();
		this.fileNo = fileNo;
		this.fileType = fileType;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileStatus = fileStatus;
		this.mno = mno;
		this.schoiceNo = schoiceNo;
		this.noticeNo = noticeNo;
		this.rquestionNo = rquestionNo;
		this.rchoiceNo = rchoiceNo;
		this.researchNo = researchNo;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getSchoiceNo() {
		return schoiceNo;
	}

	public void setSchoiceNo(int schoiceNo) {
		this.schoiceNo = schoiceNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getRquestionNo() {
		return rquestionNo;
	}

	public void setRquestionNo(int rquestionNo) {
		this.rquestionNo = rquestionNo;
	}

	public int getRchoiceNo() {
		return rchoiceNo;
	}

	public void setRchoiceNo(int rchoiceNo) {
		this.rchoiceNo = rchoiceNo;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	@Override
	public String toString() {
		return "UploadFile [fileNo=" + fileNo + ", fileType=" + fileType + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileStatus=" + fileStatus + ", mno=" + mno + ", schoiceNo=" + schoiceNo + ", noticeNo=" + noticeNo
				+ ", rquestionNo=" + rquestionNo + ", rchoiceNo=" + rchoiceNo + ", researchNo=" + researchNo + "]";
	}
	
}

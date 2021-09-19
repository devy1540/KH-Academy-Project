package com.opera.survway.corporation.model.vo;

import java.sql.Date;

public class CorpMember {
	
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	private String userType;
	private Date leaveDate;
	private Date entDate;
	private Date modifyDate;
	private String companyName;
	private String cRegistrationNumber;
	
	public CorpMember() {}

	public CorpMember(int mno, String userId, String userPwd, String userName, String userAddress, String userPhone,
			String userEmail, String userType, Date leaveDate, Date entDate, Date modifyDate, String companyName,
			String cRegistrationNumber) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userType = userType;
		this.leaveDate = leaveDate;
		this.entDate = entDate;
		this.modifyDate = modifyDate;
		this.companyName = companyName;
		this.cRegistrationNumber = cRegistrationNumber;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getcRegistrationNumber() {
		return cRegistrationNumber;
	}

	public void setcRegistrationNumber(String cRegistrationNumber) {
		this.cRegistrationNumber = cRegistrationNumber;
	}

	@Override
	public String toString() {
		return "CorpMember [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userAddress=" + userAddress + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", userType=" + userType + ", leaveDate=" + leaveDate + ", entDate=" + entDate + ", modifyDate="
				+ modifyDate + ", companyName=" + companyName + ", cRegistrationNumber=" + cRegistrationNumber + "]";
	}
	
	
}

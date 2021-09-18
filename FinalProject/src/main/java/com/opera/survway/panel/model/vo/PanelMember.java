package com.opera.survway.panel.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class PanelMember {
	
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String post;
	private String address;
	private String detailAddress;
	private String userAddress;
	private String phone1;
	private String phone2;
	private String phone3;
	private String userPhone;
	private String userEmail;
	private String userType;
	private Date leaveDate;
	private Date entDate;
	private Date modifyDate;
	private String panelBirthday;
	private int panelAge;
	private String panelGender;
	private String panelArea;
	private String referPanelCode;
	private String nominee;
	private int panellevelNo;
	private String occupationNo;
	private String withdrawAccount;
	private String leaveReason;
	private ArrayList<Integer> indexArr;
	
	public PanelMember() {}

	public PanelMember(int mno, String userId, String userPwd, String userName, String post, String address,
			String detailAddress, String userAddress, String phone1, String phone2, String phone3, String userPhone,
			String userEmail, String userType, Date leaveDate, Date entDate, Date modifyDate, String panelBirthday,
			int panelAge, String panelGender, String panelArea, String referPanelCode, String nominee, int panellevelNo,
			String occupationNo, String withdrawAccount, String leaveReason, ArrayList<Integer> indexArr) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.post = post;
		this.address = address;
		this.detailAddress = detailAddress;
		this.userAddress = userAddress;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userType = userType;
		this.leaveDate = leaveDate;
		this.entDate = entDate;
		this.modifyDate = modifyDate;
		this.panelBirthday = panelBirthday;
		this.panelAge = panelAge;
		this.panelGender = panelGender;
		this.panelArea = panelArea;
		this.referPanelCode = referPanelCode;
		this.nominee = nominee;
		this.panellevelNo = panellevelNo;
		this.occupationNo = occupationNo;
		this.withdrawAccount = withdrawAccount;
		this.leaveReason = leaveReason;
		this.indexArr = indexArr;
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

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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

	public String getPanelBirthday() {
		return panelBirthday;
	}

	public void setPanelBirthday(String panelBirthday) {
		this.panelBirthday = panelBirthday;
	}

	public int getPanelAge() {
		return panelAge;
	}

	public void setPanelAge(int panelAge) {
		this.panelAge = panelAge;
	}

	public String getPanelGender() {
		return panelGender;
	}

	public void setPanelGender(String panelGender) {
		this.panelGender = panelGender;
	}

	public String getPanelArea() {
		return panelArea;
	}

	public void setPanelArea(String panelArea) {
		this.panelArea = panelArea;
	}

	public String getReferPanelCode() {
		return referPanelCode;
	}

	public void setReferPanelCode(String referPanelCode) {
		this.referPanelCode = referPanelCode;
	}

	public String getNominee() {
		return nominee;
	}

	public void setNominee(String nominee) {
		this.nominee = nominee;
	}

	public int getPanellevelNo() {
		return panellevelNo;
	}

	public void setPanellevelNo(int panellevelNo) {
		this.panellevelNo = panellevelNo;
	}

	public String getOccupationNo() {
		return occupationNo;
	}

	public void setOccupationNo(String occupationNo) {
		this.occupationNo = occupationNo;
	}

	public String getWithdrawAccount() {
		return withdrawAccount;
	}

	public void setWithdrawAccount(String withdrawAccount) {
		this.withdrawAccount = withdrawAccount;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public ArrayList<Integer> getIndexArr() {
		return indexArr;
	}

	public void setIndexArr(ArrayList<Integer> indexArr) {
		this.indexArr = indexArr;
	}

	@Override
	public String toString() {
		return "PanelMember [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", post=" + post + ", address=" + address + ", detailAddress=" + detailAddress + ", userAddress="
				+ userAddress + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", userType=" + userType + ", leaveDate=" + leaveDate
				+ ", entDate=" + entDate + ", modifyDate=" + modifyDate + ", panelBirthday=" + panelBirthday
				+ ", panelAge=" + panelAge + ", panelGender=" + panelGender + ", panelArea=" + panelArea
				+ ", referPanelCode=" + referPanelCode + ", nominee=" + nominee + ", panellevelNo=" + panellevelNo
				+ ", occupationNo=" + occupationNo + ", withdrawAccount=" + withdrawAccount + ", leaveReason="
				+ leaveReason + ", indexArr=" + indexArr + "]";
	}

	
}


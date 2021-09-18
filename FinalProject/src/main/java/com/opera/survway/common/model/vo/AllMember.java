package com.opera.survway.common.model.vo;

import java.io.Serializable;

public class AllMember implements Serializable {
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	private String userType;
	private String leaveDate;
	private String entDate;
	private String modifyDate;
	
	private String panelBirthday;
	private String panelGender;
	private String referPanelCode;
	private String nominee;
	private String panelLevel;
	private String occupationNo;
	private String withdrawAccount;
	
	private String companyName;
	private String cRegistrationNumber;
	
	private int panelRewordPoint;
	private String researchResponseDate;
	private int cashoutAmount;
	private int ternaryCount;
	
	private String changeName;
	public AllMember() {}
	public AllMember(int mno, String userId, String userPwd, String userName, String userAddress, String userPhone,
			String userEmail, String userType, String leaveDate, String entDate, String modifyDate,
			String panelBirthday, String panelGender, String referPanelCode, String nominee, String panelLevel,
			String occupationNo, String withdrawAccount, String companyName, String cRegistrationNumber,
			int panelRewordPoint, String researchResponseDate, int cashoutAmount, int ternaryCount, String changeName) {
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
		this.panelBirthday = panelBirthday;
		this.panelGender = panelGender;
		this.referPanelCode = referPanelCode;
		this.nominee = nominee;
		this.panelLevel = panelLevel;
		this.occupationNo = occupationNo;
		this.withdrawAccount = withdrawAccount;
		this.companyName = companyName;
		this.cRegistrationNumber = cRegistrationNumber;
		this.panelRewordPoint = panelRewordPoint;
		this.researchResponseDate = researchResponseDate;
		this.cashoutAmount = cashoutAmount;
		this.ternaryCount = ternaryCount;
		this.changeName = changeName;
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
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getEntDate() {
		return entDate;
	}
	public void setEntDate(String entDate) {
		this.entDate = entDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getPanelBirthday() {
		return panelBirthday;
	}
	public void setPanelBirthday(String panelBirthday) {
		this.panelBirthday = panelBirthday;
	}
	public String getPanelGender() {
		return panelGender;
	}
	public void setPanelGender(String panelGender) {
		this.panelGender = panelGender;
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
	public String getPanelLevel() {
		return panelLevel;
	}
	public void setPanelLevel(String panelLevel) {
		this.panelLevel = panelLevel;
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
	public int getPanelRewordPoint() {
		return panelRewordPoint;
	}
	public void setPanelRewordPoint(int panelRewordPoint) {
		this.panelRewordPoint = panelRewordPoint;
	}
	public String getResearchResponseDate() {
		return researchResponseDate;
	}
	public void setResearchResponseDate(String researchResponseDate) {
		this.researchResponseDate = researchResponseDate;
	}
	public int getCashoutAmount() {
		return cashoutAmount;
	}
	public void setCashoutAmount(int cashoutAmount) {
		this.cashoutAmount = cashoutAmount;
	}
	public int getTernaryCount() {
		return ternaryCount;
	}
	public void setTernaryCount(int ternaryCount) {
		this.ternaryCount = ternaryCount;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	@Override
	public String toString() {
		return "AllMember [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userAddress=" + userAddress + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", userType=" + userType + ", leaveDate=" + leaveDate + ", entDate=" + entDate + ", modifyDate="
				+ modifyDate + ", panelBirthday=" + panelBirthday + ", panelGender=" + panelGender + ", referPanelCode="
				+ referPanelCode + ", nominee=" + nominee + ", panelLevel=" + panelLevel + ", occupationNo="
				+ occupationNo + ", withdrawAccount=" + withdrawAccount + ", companyName=" + companyName
				+ ", cRegistrationNumber=" + cRegistrationNumber + ", panelRewordPoint=" + panelRewordPoint
				+ ", researchResponseDate=" + researchResponseDate + ", cashoutAmount=" + cashoutAmount
				+ ", ternaryCount=" + ternaryCount + ", changeName=" + changeName + "]";
	}

}

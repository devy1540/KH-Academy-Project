package com.kh.client.model.vo;

public class ClientUser {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private int coin;
	private String imgName;
	private boolean profile;
	private boolean musicSet;
	private int victory;
	private int ownItem1;
	private int ownItem2;

	private boolean tempPwd = false;

	private boolean acceptQuest1 = false;
	private boolean acceptQuest2 = false;
	private boolean acceptQuest3 = false;
	private boolean questClear1 = false;
	private boolean questClear2 = false;
	private boolean questClear3 = false;
	
	
	


	public ClientUser(String userId, String userPwd, String userName, String email, int coin,
			boolean profile, boolean musicSet, int victory,
			boolean acceptQuest1, boolean acceptQuest2, boolean acceptQuest3, boolean questClear1, boolean questClear2,
			boolean questClear3, int ownItem1, int ownItem2) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.coin = coin;
		
		this.imgName = null;
		
		this.profile = profile;
		this.musicSet = musicSet;
		this.victory = victory;
		this.ownItem1 = ownItem1;
		this.ownItem2 = ownItem2;
		
		this.tempPwd = false;
		
		this.acceptQuest1 = acceptQuest1;
		this.acceptQuest2 = acceptQuest2;
		this.acceptQuest3 = acceptQuest3;
		this.questClear1 = questClear1;
		this.questClear2 = questClear2;
		this.questClear3 = questClear3;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getCoin() {
		return coin;
	}


	public void setCoin(int coin) {
		this.coin = coin;
	}


	public String getImgName() {
		return imgName;
	}


	public void setImgName(String imgName) {
		this.imgName = imgName;
	}


	public boolean isProfile() {
		return profile;
	}


	public void setProfile(boolean profile) {
		this.profile = profile;
	}


	public boolean isMusicSet() {
		return musicSet;
	}


	public void setMusicSet(boolean musicSet) {
		this.musicSet = musicSet;
	}


	public int getVictory() {
		return victory;
	}


	public void setVictory(int victory) {
		this.victory = victory;
	}


	public int getOwnItem1() {
		return ownItem1;
	}


	public void setOwnItem1(int ownItem1) {
		this.ownItem1 = ownItem1;
	}


	public int getOwnItem2() {
		return ownItem2;
	}


	public void setOwnItem2(int ownItem2) {
		this.ownItem2 = ownItem2;
	}


	public boolean isTempPwd() {
		return tempPwd;
	}


	public void setTempPwd(boolean tempPwd) {
		this.tempPwd = tempPwd;
	}


	public boolean isAcceptQuest1() {
		return acceptQuest1;
	}


	public void setAcceptQuest1(boolean acceptQuest1) {
		this.acceptQuest1 = acceptQuest1;
	}


	public boolean isAcceptQuest2() {
		return acceptQuest2;
	}


	public void setAcceptQuest2(boolean acceptQuest2) {
		this.acceptQuest2 = acceptQuest2;
	}


	public boolean isAcceptQuest3() {
		return acceptQuest3;
	}


	public void setAcceptQuest3(boolean acceptQuest3) {
		this.acceptQuest3 = acceptQuest3;
	}


	public boolean isQuestClear1() {
		return questClear1;
	}


	public void setQuestClear1(boolean questClear1) {
		this.questClear1 = questClear1;
	}


	public boolean isQuestClear2() {
		return questClear2;
	}


	public void setQuestClear2(boolean questClear2) {
		this.questClear2 = questClear2;
	}


	public boolean isQuestClear3() {
		return questClear3;
	}


	public void setQuestClear3(boolean questClear3) {
		this.questClear3 = questClear3;
	}
	
	
	
//	String userId, String userPwd, String userCoin, String userItem2, String userItem1, boolean userMusicSet
	
	
}

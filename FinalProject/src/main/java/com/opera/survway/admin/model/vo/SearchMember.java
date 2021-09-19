package com.opera.survway.admin.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

public class SearchMember {
	private String userType;
	private String panelLevel;
	private String searchInput;
	private PageInfo pi;
	
	public SearchMember() {}

	public SearchMember(String userType, String panelLevel, String searchInput, PageInfo pi) {
		super();
		this.userType = userType;
		this.panelLevel = panelLevel;
		this.searchInput = searchInput;
		this.pi = pi;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPanelLevel() {
		return panelLevel;
	}

	public void setPanelLevel(String panelLevel) {
		this.panelLevel = panelLevel;
	}

	public String getSearchInput() {
		return searchInput;
	}

	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}

	public PageInfo getPi() {
		return pi;
	}

	public void setPi(PageInfo pi) {
		this.pi = pi;
	}

	@Override
	public String toString() {
		return "SearchMember [userType=" + userType + ", panelLevel=" + panelLevel + ", searchInput=" + searchInput
				+ ", pi=" + pi + "]";
	}
	
}

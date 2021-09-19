package com.opera.survway.panel.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

public class SearchSurvey {
	private String frequency;
	private int interests;
	private String searchValue;
	private PageInfo pi;
	public SearchSurvey() {}
	public SearchSurvey(String frequency, int interests, String searchValue, PageInfo pi) {
		super();
		this.frequency = frequency;
		this.interests = interests;
		this.searchValue = searchValue;
		this.pi = pi;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public int getInterests() {
		return interests;
	}
	public void setInterests(int interests) {
		this.interests = interests;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public PageInfo getPi() {
		return pi;
	}
	public void setPi(PageInfo pi) {
		this.pi = pi;
	}
	@Override
	public String toString() {
		return "SearchSurvey [frequency=" + frequency + ", interests=" + interests + ", searchValue=" + searchValue
				+ ", pi=" + pi + "]";
	}
	
	
}

package com.opera.survway.panel.model.vo;

import com.opera.survway.common.model.vo.PageInfo;

public class SearchNotice {
	
	private String searchValue;
	private PageInfo pi;
	
	
	public SearchNotice() {}


	public SearchNotice(String searchValue, PageInfo pi) {
		super();
		this.searchValue = searchValue;
		this.pi = pi;
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
		return "SearchNotice [searchValue=" + searchValue + ", pi=" + pi + "]";
	}
	
	
	
}

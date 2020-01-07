package com.care.board_searchdto;

public class BoardSearchDTO {
	private String page;
	private String searchData;
	private String sel;
	
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
}

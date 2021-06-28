package com.webook.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	// 페이지 정보, 페이지 크기 정보를 저장하는 객체 
	
	private int page;
	private int pageSize;
	
	private String searchType;
	private String keyword;
	
	
	public Criteria() {
		this.page = 1;
		this.pageSize = 6;
		this.searchType = null;
		this.keyword = null;
	}
	
	public int getPageStart() {
		return (this.page - 1)*pageSize;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}	

	public int getPageSize() {
		return pageSize;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <=0 || pageSize > 100) {
			this.pageSize = 10;
		} else {
			this.pageSize = pageSize;
		}
	}	

	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("pageSize", this.pageSize);
		
		if(searchType!=null) {
			uriComponentsBuilder
						.queryParam("searchType", this.searchType)
						.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
			
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}

}

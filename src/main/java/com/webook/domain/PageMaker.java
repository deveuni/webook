package com.webook.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	//*************************************************************************************************************************
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	// page, pageSize
	private Criteria cri;
	
	// 화면에 보여지는 페이지의 번호 수(페이지 블럭)
	private int displayPageNum = 5;
	
	
	//*************************************************************************************************************************
	
	
	public PageMaker(Criteria cri) {
		this.cri = cri;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void calcData() {
		int page = this.cri.getPage();
		int pageSize = this.cri.getPageSize();
		
		this.endPage = (int)(Math.ceil(page/(double)displayPageNum)*displayPageNum);
		this.startPage = (this.endPage-displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)pageSize));
		
		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = (startPage != 1);
		this.next = (endPage * pageSize < totalCount);
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public Criteria getCri() {
		return cri;
	}


	public void setCri(Criteria cri) {
		this.cri = cri;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}


	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public String makeQuery(int page) {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("pageSize", this.cri.getPageSize());
		//검색 한 경우		
		if (this.cri.getSearchType() != null) {
			uriComponentsBuilder
				.queryParam("searchType", this.cri.getSearchType())
				.queryParam("keyword", this.cri.getKeyword());
		}
		return uriComponentsBuilder.build().encode().toString();
	}
	

}

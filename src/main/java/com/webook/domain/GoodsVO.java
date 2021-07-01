package com.webook.domain;

import java.sql.Timestamp;

public class GoodsVO {
	
	private int gdsNum;
	private String gdsName;
	private String gdsAuthor;
	private String gdsCompany;
	private String category;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Timestamp gdsDate;
	
	// 생성자 
	public GoodsVO() {}
	public GoodsVO(int gdsNum, String gdsName, String gdsAuthor,String gdsCompany, String category, int gdsPrice, int gdsStock,
			String gdsDes, String gdsImg, Timestamp gdsDate) {
		super();
		this.gdsNum = gdsNum;
		this.gdsName = gdsName;
		this.gdsAuthor = gdsAuthor;
		this.gdsCompany = gdsCompany;
		this.category = category;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsDate = gdsDate;
	}

	
	// set / get 메서드
	public int getGdsNum() {
		return gdsNum;
	}
	
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getGdsAuthor() {
		return gdsAuthor;
	}

	public void setGdsAuthor(String gdsAuthor) {
		this.gdsAuthor = gdsAuthor;
	}
	
	public String getGdsCompany() {
		return gdsCompany;
	}

	public void setGdsCompany(String gdsCompany) {
		this.gdsCompany = gdsCompany;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public int getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}

	public String getGdsDes() {
		return gdsDes;
	}

	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}

	public String getGdsImg() {
		return gdsImg;
	}

	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}

	public Timestamp getGdsDate() {
		return gdsDate;
	}

	public void setGdsDate(Timestamp gdsDate) {
		this.gdsDate = gdsDate;
	}
	
	
	@Override
	public String toString() {
		return "GoodsVO [gdsNum=" + gdsNum + ", gdsName=" + gdsName + ", gdsAuthor=" + gdsAuthor + ", gdsCompany="
				+ gdsCompany + ", category=" + category + ", gdsPrice=" + gdsPrice + ", gdsStock=" + gdsStock
				+ ", gdsDes=" + gdsDes + ", gdsImg=" + gdsImg + ", gdsDate=" + gdsDate + "]";
	}
	
	
	
	
	

	
	
	
	
	
	

}

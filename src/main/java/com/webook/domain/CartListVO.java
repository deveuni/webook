package com.webook.domain;

import java.sql.Timestamp;

public class CartListVO {

	private int CartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Timestamp addDate;
	
	private int num;
	private String gdsName;
	private int gdsPrice;
	private String gdsImg;
	
	public CartListVO() {}
	public CartListVO(int cartNum, String userId, int gdsNum, int cartStock, Timestamp addDate, int num, String gdsName,
			int gdsPrice, String gdsImg) {
		super();
		CartNum = cartNum;
		this.userId = userId;
		this.gdsNum = gdsNum;
		this.cartStock = cartStock;
		this.addDate = addDate;
		this.num = num;
		this.gdsName = gdsName;
		this.gdsPrice = gdsPrice;
		this.gdsImg = gdsImg;
	}
	
	

	public int getCartNum() {
		return CartNum;
	}
	public void setCartNum(int cartNum) {
		CartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Timestamp getAddDate() {
		return addDate;
	}
	public void setAddDate(Timestamp addDate) {
		this.addDate = addDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	
	
	@Override
	public String toString() {
		return "CartListVO [CartNum=" + CartNum + ", userId=" + userId + ", gdsNum=" + gdsNum + ", cartStock="
				+ cartStock + ", addDate=" + addDate + ", num=" + num + ", gdsName=" + gdsName + ", gdsPrice="
				+ gdsPrice + ", gdsImg=" + gdsImg + "]";
	}
	
	
	
	
	
	
	
}

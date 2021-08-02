package com.webook.domain;

import java.sql.Timestamp;

public class CartVO {
	
	private int CartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Timestamp addDate;
	
	
	public CartVO() {}
	public CartVO(int cartNum, String userId, int gdsNum, int cartStock, Timestamp addDate) {
		super();
		CartNum = cartNum;
		this.userId = userId;
		this.gdsNum = gdsNum;
		this.cartStock = cartStock;
		this.addDate = addDate;
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
	
	
	@Override
	public String toString() {
		return "CartVO [CartNum=" + CartNum + ", userId=" + userId + ", gdsNum=" + gdsNum + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
	}
	
	
	
	
	

}

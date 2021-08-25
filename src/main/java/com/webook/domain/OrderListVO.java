package com.webook.domain;

import java.sql.Timestamp;

public class OrderListVO {

	private String orderId;
	private String userId;
	private String orderRec;
	private String postcode;
	private String userAddr1;
	private String userAddr2;
	private String orderPhon;
	private int amount;
	private Timestamp orderDate;
	
	private int orderDetailsNum;
	private int gdsNum;
	private int cartStock;
	
	private String gdsName;
	private String gdsImg;
	private int gdsPrice;
	
	public OrderListVO() {}
	public OrderListVO(String orderId, String userId, String orderRec, String postcode, String userAddr1,
			String userAddr2, String orderPhon, int amount, Timestamp orderDate, int orderDetailsNum, int gdsNum,
			int cartStock, String gdsName, String gdsImg, int gdsPrice) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderRec = orderRec;
		this.postcode = postcode;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.orderPhon = orderPhon;
		this.amount = amount;
		this.orderDate = orderDate;
		this.orderDetailsNum = orderDetailsNum;
		this.gdsNum = gdsNum;
		this.cartStock = cartStock;
		this.gdsName = gdsName;
		this.gdsImg = gdsImg;
		this.gdsPrice = gdsPrice;
	}
	
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
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
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [orderId=" + orderId + ", userId=" + userId + ", orderRec=" + orderRec + ", postcode="
				+ postcode + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", orderPhon=" + orderPhon
				+ ", amount=" + amount + ", orderDate=" + orderDate + ", orderDetailsNum=" + orderDetailsNum
				+ ", gdsNum=" + gdsNum + ", cartStock=" + cartStock + ", gdsName=" + gdsName + ", gdsImg=" + gdsImg
				+ ", gdsPrice=" + gdsPrice + "]";
	}
	
	
	
	
}

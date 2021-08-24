package com.webook.domain;

import java.sql.Timestamp;

public class OrderVO {
	
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String postcode;
	private String orderPhon;
	private int amount;
	private Timestamp orderDate;
	
	public OrderVO() {}
	public OrderVO(String orderId, String userId, String orderRec, String userAddr1, String userAddr2, String postcode,
			String orderPhon, int amount, Timestamp orderDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderRec = orderRec;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.postcode = postcode;
		this.orderPhon = orderPhon;
		this.amount = amount;
		this.orderDate = orderDate;
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
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	
	
	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", userId=" + userId + ", orderRec=" + orderRec + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", postcode=" + postcode + ", orderPhon=" + orderPhon
				+ ", amount=" + amount + ", orderDate=" + orderDate + "]";
	}
	
	
	
	
	
	
	
	
	

}

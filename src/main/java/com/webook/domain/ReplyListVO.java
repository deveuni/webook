package com.webook.domain;

import java.sql.Timestamp;

public class ReplyListVO {
	
	private int gdsNum;
	private int repNum;
	private String userId;
	private String repCon;
	private Timestamp repDate;
	private String userName;
	
	public ReplyListVO() {}
	public ReplyListVO(int gdsNum, int repNum, String userId, String repCon, Timestamp repDate, String userName) {
		super();
		this.gdsNum = gdsNum;
		this.repNum = repNum;
		this.userId = userId;
		this.repCon = repCon;
		this.repDate = repDate;
		this.userName = userName;
	}
	
	
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Timestamp getRepDate() {
		return repDate;
	}
	public void setRepDate(Timestamp repDate) {
		this.repDate = repDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	@Override
	public String toString() {
		return "ReplyListVO [gdsNum=" + gdsNum + ", repNum=" + repNum + ", userId=" + userId + ", repCon=" + repCon
				+ ", repDate=" + repDate + ", userName=" + userName + "]";
	}
	
	
	
	
	

}

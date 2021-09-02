package com.webook.domain;

import java.sql.Timestamp;

public class ReplyVO {
	
	private int repNum;
	private int gdsNum;
	private String userId;
	private String repCon;
	private Timestamp repDate;
	
	public ReplyVO() {}
	public ReplyVO(int repNum, int gdsNum, String userId, String repCon, Timestamp repDate) {
		super();
		this.repNum = repNum;
		this.gdsNum = gdsNum;
		this.userId = userId;
		this.repCon = repCon;
		this.repDate = repDate;
	}

	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
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
	
	@Override
	public String toString() {
		return "ReplyVO [repNum=" + repNum + ", gdsNum=" + gdsNum + ", userId=" + userId + ", repCon=" + repCon
				+ ", repDate=" + repDate + "]";
	}
	
	
	

}

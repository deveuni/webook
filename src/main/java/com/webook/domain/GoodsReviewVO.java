package com.webook.domain;

import java.sql.Timestamp;

public class GoodsReviewVO {
	
	private int reNum;
	private int reGdsNum;
	private String reUserId;
	private Timestamp reRegdate;
	private String reDes;
	private int re_ref;
	private int re_seq;
	private int re_lev;
	private int isDeleted;
	
	public GoodsReviewVO() {}
	public GoodsReviewVO(int reNum, int reGdsNum, String reUserId, Timestamp reRegdate, String reDes, int re_ref,
			int re_seq, int re_lev, int isDeleted) {
		super();
		this.reNum = reNum;
		this.reGdsNum = reGdsNum;
		this.reUserId = reUserId;
		this.reRegdate = reRegdate;
		this.reDes = reDes;
		this.re_ref = re_ref;
		this.re_seq = re_seq;
		this.re_lev = re_lev;
		this.isDeleted = isDeleted;
	}
	
	
	public int getReNum() {
		return reNum;
	}
	
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	
	public int getReGdsNum() {
		return reGdsNum;
	}
	
	public void setReGdsNum(int reGdsNum) {
		this.reGdsNum = reGdsNum;
	}
	
	public String getReUserId() {
		return reUserId;
	}
	
	public void setReUserId(String reUserId) {
		this.reUserId = reUserId;
	}
	
	public Timestamp getReRegdate() {
		return reRegdate;
	}
	
	public void setReRegdate(Timestamp reRegdate) {
		this.reRegdate = reRegdate;
	}
	
	public String getReDes() {
		return reDes;
	}
	
	public void setReDes(String reDes) {
		this.reDes = reDes;
	}
	
	public int getRe_ref() {
		return re_ref;
	}
	
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	
	public int getRe_seq() {
		return re_seq;
	}
	
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	
	public int getRe_lev() {
		return re_lev;
	}
	
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	
	public int getIsDeleted() {
		return isDeleted;
	}
	
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	
	@Override
	public String toString() {
		return "GoodsReviewVO [reNum=" + reNum + ", reGdsNum=" + reGdsNum + ", reUserId=" + reUserId + ", reRegdate="
				+ reRegdate + ", reDes=" + reDes + ", re_ref=" + re_ref + ", re_seq=" + re_seq + ", re_lev=" + re_lev
				+ ", isDeleted=" + isDeleted + "]";
	}
	
	
	
	

}

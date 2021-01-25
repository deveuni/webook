package com.webook.domain;

import java.sql.Timestamp;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userName;
	private String userBirth;
	private String userPhon;
	private String userEmail;
	private String userAddr1;
	private String userAddr2;
	private String postcode;
	private Timestamp reg_date;
	private String userKey;
	
	// 생성자
	public MemberVO() {}
	public MemberVO(String userId, String userPass, String userName, String userBirth, String userPhon,
			String userEmail, String userAddr1, String userAddr2, String postcode, Timestamp reg_date, String userKey) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userPhon = userPhon;
		this.userEmail = userEmail;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.postcode = postcode;
		this.reg_date = reg_date;
		this.userKey = userKey;
	}


	// set(), get() 메소드
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPhon() {
		return userPhon;
	}
	public void setUserPhon(String userPhon) {
		this.userPhon = userPhon;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getUserKey() {
		return userKey;
	}
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userBirth="
				+ userBirth + ", userPhon=" + userPhon + ", userEmail=" + userEmail + ", userAddr1=" + userAddr1
				+ ", userAddr2=" + userAddr2 + ", postcode=" + postcode + ", reg_date=" + reg_date + ", userKey="
				+ userKey + "]";
	}
	
	
	

	
	
	

}

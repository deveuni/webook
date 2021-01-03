package com.webook.service;

import com.webook.domain.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void signup(MemberVO vo) throws Exception;
	
	// 아이디 중복 확인
	public MemberVO userIdCheck(String userId) throws Exception;
	
	
	
	
}

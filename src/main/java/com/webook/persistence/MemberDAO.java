package com.webook.persistence;

import com.webook.domain.MemberVO;

public interface MemberDAO {
	
	/* 회원가입 */
	public void signup(MemberVO vo) throws Exception;
	
	/* 아이디 중복 확인 */
	public MemberVO userIdCheck(String userId) throws Exception;
	
	/* 로그인 */ 
	public MemberVO signin(MemberVO vo) throws Exception; 
	

}

package com.webook.persistence;

import com.webook.domain.MemberVO;

public interface MemberDAO {
	
	/* 회원가입 */
	public void signup(MemberVO vo) throws Exception;
	
	/* 아이디 중복 확인 */
	public MemberVO userIdCheck(String userId) throws Exception;
	
	/* 로그인 */ 
	public MemberVO signin(MemberVO vo) throws Exception; 
	
	/* 회원 인증키 생성 메소드 */
	public int GetKey(String userId, String userKey);
	
	/* 회원 인증키 Y로 바꿔주는 메소드 */
	public int alter_userKey(String userId, String key);

}

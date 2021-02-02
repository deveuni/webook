package com.webook.persistence;

import com.webook.domain.MemberVO;

public interface MemberDAO {
	
	/* 회원가입 */
	public void signup(MemberVO vo) throws Exception;
	
	/* 아이디 중복 확인 */
	public MemberVO userIdCheck(String userId) throws Exception;
	
	/* 로그인 */ 
	public MemberVO signin(MemberVO vo) throws Exception; 
	
	/* 아이디 찾기 */
	public String findId(String userEmail) throws Exception;

	/* 비밀번호 찾기(변경) */
	public int updatePw(MemberVO vo) throws Exception;
	
	/* 회원정보 조회 */
	public MemberVO readMember(String userId) throws Exception;
	
	/* 회원정보 수정 */
	public void updateMember(MemberVO vo) throws Exception;
	
	
	
	
	
	
	
}

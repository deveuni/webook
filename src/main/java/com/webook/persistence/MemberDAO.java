package com.webook.persistence;

import com.webook.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void signup(MemberVO vo) throws Exception;
	
	
	

}

package com.webook.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.controller.MemberController;
import com.webook.domain.MemberVO;
import com.webook.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	// DB를 처리하기 위한 객체 주입 
	@Inject
	private MemberDAO mdao;
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		
		if(vo == null) {
			return;
		}
		
		mdao.signup(vo);
		
	}
	
	// 아이디 중복 확인
	@Override
	public MemberVO userIdCheck(String userId) throws Exception {

		return mdao.userIdCheck(userId); 
		
	}
	
	
	
	
}

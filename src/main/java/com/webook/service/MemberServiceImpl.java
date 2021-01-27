package com.webook.service;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.controller.MemberController;
import com.webook.domain.MemberVO;
import com.webook.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private MemberDAO mdao;
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	/* 회원가입 */
	@Override
	public void signup(MemberVO vo) throws Exception {
		
		if(vo == null) {
			return;
		}
		mdao.signup(vo);
	}
	
	/* 아이디 중복 확인 */
	@Override
	public MemberVO userIdCheck(String userId) throws Exception {

		return mdao.userIdCheck(userId); 
	}
	
	/* 로그인 */
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		
		return mdao.signin(vo);
	}
	
	/* 네이버 회원가입 */
	@Override
	public void signupNaver(MemberVO vo) throws Exception {
		mdao.signup(vo);
		
	}
	
	/* 네이버 로그인 */
	@Override
	public MemberVO signinNaver(MemberVO vo) throws Exception {
		MemberVO returnVO = null;
		
		try {
			returnVO = mdao.signin(vo);
			log.info("S : 네이버 아이디 로그인 정보 => " + vo);
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null;
		}
		return returnVO;
	}
	
	/* 구글 회원가입 */
	@Override
	public void signupGoogle(MemberVO vo) throws Exception {
		mdao.signup(vo);
		
	}
	
	/* 구글 로그인 */
	@Override
	public MemberVO signinGoogle(MemberVO vo) throws Exception {
		MemberVO returnVO = null;
		
		try {
			returnVO = mdao.signin(vo);
			log.info("S : 구글 아이디 로그인 정보 => " + vo);
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null;
		}
		return returnVO;
	}
	
	
	/* 로그아웃 */
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	
	
	
}

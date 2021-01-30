package com.webook.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webook.domain.MemberVO;

public interface MemberService {
	
	/* 회원가입 */
	public void signup(MemberVO vo) throws Exception;
	
	/* 아이디 중복 확인 */
	public MemberVO userIdCheck(String userId) throws Exception;
	
	/* 로그인 */
	public MemberVO signin(MemberVO vo) throws Exception;
	
	/* 네이버 회원가입 */
	public void signupNaver(MemberVO vo) throws Exception;
	
	/* 네이버 로그인 */
	public MemberVO signinNaver(MemberVO vo) throws Exception;
	
	/* 구글 회원가입 */
	public void signupGoogle(MemberVO vo) throws Exception;
	
	/* 구글 로그인 */
	public MemberVO signinGoogle(MemberVO vo) throws Exception;
	
	/* 로그아웃 */
	public void signout(HttpSession session) throws Exception;
	
	/* 아이디 찾기 */
	public String findId(HttpServletResponse response, String userEmail) throws Exception;
	
	/* 비밀번호 찾기 이메일 발송 */
	public void sendEmail(MemberVO vo, String div) throws Exception;
	
	/* 비밀번호 찾기 */
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception;
	
}

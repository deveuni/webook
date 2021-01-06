package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webook.domain.MemberVO;
import com.webook.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	// 서비스 처리 객체 주입
	@Inject
	private MemberService service;
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberController.class);
	
	// http://localhost:8080/member/signup
	// 회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getSignup() throws Exception{
		
		log.info("C : 회원가입 get");
		
		return "/member/signup";
	}
	
	// 회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception{
		
		log.info("C : 회원가입 post");
		
		// 뷰페이지에서 전달되는 정보 vo
		log.info("C : 뷰페이지에서 전달되는 정보 vo => " + vo);
		
		// 비밀번호 암호화 - 할까? 찾아보고 정하기
		
		// 서비스에서 회원가입 동작 호출
		service.signup(vo);
		
		log.info("C : 회원가입 post동작 완료");
		
		// 로그인 페이지로 이동
		return "redirect:/member/signin";
		
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) throws Exception {
		
		MemberVO idCheck = service.userIdCheck(userId);
		
		if(idCheck != null) return 1;
		else return 0;
	}
	
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception{
		
		log.info("C : 로그인 get");
	}
	
	
	
	
	
}

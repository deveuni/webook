package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		// 서비스에서 회원가입 동작 호출
		service.signup(vo);
		
		log.info("C : 회원가입 post동작 완료");
		
		// 로그인 페이지로 이동
		return "redirect:/member/signin";
		
	}
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception{
		
		log.info("C : 로그인 get");
	}
	
	
	
	
	
}

package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webook.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	// 서비스 처리 객체 주입
	//@Inject
	//private MemberService service;
	
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
	public String postSignup() throws Exception{
		
		log.info("C : 회원가입 post");
		
		return "redirect:/member/signin";
		
	}
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception{
		
		log.info("C : 로그인 get");
	}
	
	
	
	
	
}

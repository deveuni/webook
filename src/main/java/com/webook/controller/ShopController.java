package com.webook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webook.domain.CartVO;
import com.webook.domain.MemberVO;
import com.webook.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Inject
	private ShopService service;
	@Inject
	private static final Logger log = LoggerFactory.getLogger(ShopController.class);

	/* 카트담기 */
	@ResponseBody
	@RequestMapping(value = "/detail/addCart", method = RequestMethod.POST)
	public void addCart(CartVO cart, HttpSession session) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		cart.setUserId(member.getUserId());
		
		service.addCart(cart);
		
	}
	
	/*  */
	/*  */
	/*  */
	
}

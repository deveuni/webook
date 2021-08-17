package com.webook.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.MemberVO;
import com.webook.service.ShopService;

@Controller
@RequestMapping("/goods/*")
public class ShopController {
	
	@Inject
	private ShopService service;
	@Inject
	private static final Logger log = LoggerFactory.getLogger(ShopController.class);

	/* 카트담기 */
	@ResponseBody
	@RequestMapping(value = "/detail/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		
		 if(member != null) { cart.setUserId(member.getUserId());
		 
			service.addCart(cart);
			
			 result = 1; }
			 
		return result;
	}
	
	/* 카트 목록 */
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		
		log.info("get cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		List<CartListVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList", cartList);
	}
	
	/* 카트 삭제 */
	@ResponseBody 
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, 
				@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		
		log.info("delete cart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}
	
	
	
	/*  */
	
}

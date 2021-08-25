package com.webook.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
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
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
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
		//MemberVO member = (MemberVO)session.getAttribute("userId");
		
		
		 if(member != null) { 
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			 result = 1; 
		 }
			 
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
	
	/* 주문 */
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		log.info("order");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		// 주문 정보
		service.orderInfo(order);
		
		// 주문 상세 정보
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		// 카트비우기
		service.cartAllDelete(userId);
		
		return "redirect:/orderList";
	}
	
	/* 주문 목록 */
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		log.info("get order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	/* 주문 상세 목록 */
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, 
					@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		log.info("get order view");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	/*  */
	/*  */
	/*  */
	
}

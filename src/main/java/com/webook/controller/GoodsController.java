package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webook.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {

	private static final Logger log =
			LoggerFactory.getLogger(GoodsController.class);
	
	/* 서비스 처리 객체 주입 */
	@Inject
	private GoodsService service;
	
	/* 상품 등록 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goodsRegisterGET() throws Exception {
		
		return "/goods/goodsRegister";
	}
	
	/* 상품 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goodsListGET() throws Exception {
		
		return "/goods/goodsList";
		
	}
	
	
	/**/
	
	/**/
	
	/**/
	
	/**/
	
	
}

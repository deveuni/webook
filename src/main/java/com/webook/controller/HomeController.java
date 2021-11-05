package com.webook.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.domain.PageMaker;
import com.webook.domain.Criteria;
import com.webook.service.MemberService;
import com.webook.service.ShopService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Inject
	private MemberService mservice;
	@Inject
	private ShopService service;
	
	
	/*
	 * @RequestMapping(value = "/webook", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * 
	 * return "home"; }
	 */
	
	@RequestMapping(value = "/webook", method = RequestMethod.GET) 
	public void main(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		
		
		// 슬라이드 출력 - 구매수??
		model.addAttribute("top3goods");
		
		
		
		
	}
	
}

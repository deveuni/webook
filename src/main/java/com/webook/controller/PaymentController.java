package com.webook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webook.service.PaymentService;


@Controller
@RequestMapping(value = "/pay/*")
public class PaymentController {

	@Inject
	private PaymentService service;
	
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String detailPayment() throws Exception {
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public void kakao(HttpServletRequest req, Model model
			) throws Exception {
		
	}
}

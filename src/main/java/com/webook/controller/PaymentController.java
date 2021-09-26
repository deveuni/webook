package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}

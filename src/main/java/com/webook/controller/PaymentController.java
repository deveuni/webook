package com.webook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webook.service.PaymentService;


@Controller
@RequestMapping(value = "/pay/*")
public class PaymentController {

	@Inject
	private PaymentService service;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
}

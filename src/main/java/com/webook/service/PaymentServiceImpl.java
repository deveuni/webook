package com.webook.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webook.persistence.PaymentDAO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Inject
	private PaymentDAO dao;
}

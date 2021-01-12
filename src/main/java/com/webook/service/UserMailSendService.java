package com.webook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	

}

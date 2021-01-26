package com.webook.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.print.attribute.standard.Sides;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.webook.persistence.MemberDAO;

public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private MemberDAO userDao;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >65 && num <= 90) || (num >= 97 && num <=122)) {
				sb.append((char) num);
			} else {
				continue;
			}
			
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String userEmail, String userId, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		userDao = sqlSession.getMapper(MemberDAO.class);
		userDao.GetKey(userId, key);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요. webook입니다.</h2><br><br>"
				+ "<h3>" + userId + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다. : "
				+ "<a href='http://localhost:8080" + request.getContextPath() + "/member/key_alter?userId=" + userId + "&userKey="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 메일을 무시하셔도 됩니다.)";
		try {
			mail.setSubject("[본인인증] webook의 인증메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입 인증 확인 (Y값으로 바꿔주는 메소드)
	public int alter_userkey_service(String userId, String userKey) throws Exception {
		
		int resultCnt = 0;
		
		userDao = sqlSession.getMapper(MemberDAO.class);
		resultCnt = userDao.alter_userKey(userId, userKey);
		
		return resultCnt;
	}

}

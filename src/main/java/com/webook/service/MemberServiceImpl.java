package com.webook.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.controller.MemberController;
import com.webook.domain.MemberVO;
import com.webook.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private MemberDAO mdao;
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	/* 회원가입 */
	@Override
	public void signup(MemberVO vo) throws Exception {
		
		if(vo == null) {
			return;
		}
		mdao.signup(vo);
	}
	
	/* 아이디 중복 확인 */
	@Override
	public MemberVO userIdCheck(String userId) throws Exception {

		return mdao.userIdCheck(userId); 
	}
	
	/* 로그인 */
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		
		return mdao.signin(vo);
	}
	
	/* 네이버 회원가입 */
	@Override
	public void signupNaver(MemberVO vo) throws Exception {
		mdao.signup(vo);
		
	}
	
	/* 네이버 로그인 */
	@Override
	public MemberVO signinNaver(MemberVO vo) throws Exception {
		MemberVO returnVO = null;
		
		try {
			returnVO = mdao.signin(vo);
			log.info("S : 네이버 아이디 로그인 정보 => " + vo);
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null;
		}
		return returnVO;
	}
	
	/* 구글 회원가입 */
	@Override
	public void signupGoogle(MemberVO vo) throws Exception {
		mdao.signup(vo);
		
	}
	
	/* 구글 로그인 */
	@Override
	public MemberVO signinGoogle(MemberVO vo) throws Exception {
		MemberVO returnVO = null;
		
		try {
			returnVO = mdao.signin(vo);
			log.info("S : 구글 아이디 로그인 정보 => " + vo);
		} catch (Exception e) {
			e.printStackTrace();
			// 실행하다 문제가 발생했을 때, 해당 데이터를 보내지 않겠다는 예외처리
			returnVO = null;
		}
		return returnVO;
	}
	
	/* 로그아웃 */
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	/* 아이디 찾기 */
	@Override
	public String findId(HttpServletResponse response, String userEmail) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userId = mdao.findId(userEmail);
		
		if(userId == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userId;
		}
	}
	
	/* 비밀번호 찾기 이메일 발송 */
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "test_webook@naver.com";
				String hostSMTPpwd = "webook@1212";

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "test_webook@naver.com";
				String fromName = "webook온라인서점";
				String subject = "";
				String msg = "";
				
			   if(div.equals("findPw")) {
					subject = "webook 임시 비밀번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
					msg += "<p>임시 비밀번호 : ";
					msg += vo.getUserPass() + "</p></div>";
				}
				// 받는 사람 E-Mail 주소
				String mail = vo.getUserEmail();
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
		
	}
	
	/* 비밀번호 찾기 */
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = mdao.readMember(vo.getUserId());
		PrintWriter out = response.getWriter();
		
		// 아이디가 없으면
		if(mdao.userIdCheck(vo.getUserId()) == null) {
			out.print("등록된 아이디가 없습니다.");
			out.close();
		}
		
		// 가입에 사용한 이메일이 아니면 
		else if(!vo.getUserEmail().equals(ck.getUserEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i=0; i<12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserPass(pw);
			
			// 비밀번호 변경
			mdao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findPw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}
	
	/* 회원정보 조회 */
	@Override
	public MemberVO readMember(String userId) throws Exception {
		
		MemberVO vo = null;
		
		vo = mdao.readMember(userId);
		
		return vo;
	}
	
	/* 회원정보 수정 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		mdao.updateMember(vo);
	}
	
	/* 비밀번호 변경 */
	@Override
	public MemberVO updatePw(MemberVO vo, String oldPw, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = mdao.readMember(vo.getUserId());
		PrintWriter out = response.getWriter();
		if(!oldPw.equals(ck.getUserPass())) {
			out.println("<script>");
			out.println("alert('기존비밀번호가 일치하지 않습니다.')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			mdao.updatePw(vo);
			return ck;
		}
	}
	
	/* 회원탈퇴 */
	@Override
	public void deleteMember(MemberVO vo) throws Exception {

		mdao.deleteMember(vo);
	}
	
	/* 비밀번호 체크 */
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = mdao.passChk(vo);
		return result;
	}
}

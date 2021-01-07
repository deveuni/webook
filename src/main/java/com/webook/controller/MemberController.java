package com.webook.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.webook.domain.MemberVO;
import com.webook.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	// 서비스 처리 객체 주입
	@Inject
	private MemberService service;
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberController.class);
	
	// NaverLoginBO
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	// http://localhost:8080/member/signup
	// 회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getSignup() throws Exception{
		
		log.info("C : 회원가입 get");
		
		return "/member/signup";
	}
	
	// 회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception{
		
		log.info("C : 회원가입 post");
		
		// 뷰페이지에서 전달되는 정보 vo
		log.info("C : 뷰페이지에서 전달되는 정보 vo => " + vo);
		
		// 비밀번호 암호화 - 할까? 찾아보고 정하기
		
		// 서비스에서 회원가입 동작 호출
		service.signup(vo);
		
		log.info("C : 회원가입 post동작 완료");
		
		// 로그인 페이지로 이동
		return "redirect:/member/signin";
		
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) throws Exception {
		
		MemberVO idCheck = service.userIdCheck(userId);
		
		if(idCheck != null) return 1;
		else return 0;
	}
	
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin(HttpSession session, Model model) throws Exception{
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		 
		log.info("C : 네이버로그인 => " + naverAuthUrl);
		 
		// 네이버 로그인 
		model.addAttribute("url", naverAuthUrl);
		
		log.info("C : 로그인 get");
	}
	
	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpSession session, RedirectAttributes rttr, Model model ) throws Exception{
		
		log.info("C : 로그인 post");
		
		// 뷰페이지에서 전달받은 id, pass 값을 저장 
		log.info("C : id,pass => " + vo);
		
		// 서비스 로그인 동작 호출
		MemberVO login = service.signin(vo);
		log.info("C : 로그인 결과 => " + login);
		
		// 로그인에 대한 정보가 없을 경우 signin 페이지로 이동
		if(login != null) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		
		// 아이디 세션값 생성
		session.setAttribute("userId", login.getUserId());
		
		
		// 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		//String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		 
		//log.info("C : 네이버로그인 => " + naverAuthUrl);
		 
		// 네이버 로그인 
		//model.addAttribute("url", naverAuthUrl);
		 
		
		return "redirect:/webook";
	}
	
	// 네이버 로그인 성공시 callback 호출 메소드
	@RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException  {
		
		log.info("C : callback() 호출");
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		
		log.info("C : 네이버 로그인 nickname = > " + nickname);
		
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId",nickname); //세션 생성
		
		model.addAttribute("result", apiResult);
		
		return "redirect:/webook";

		
	}
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		log.info("get logout");
		
		service.signout(session);
		
		return "redirect:/webook";
	}
	
	
	
	
}

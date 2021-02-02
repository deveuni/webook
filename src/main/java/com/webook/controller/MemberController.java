package com.webook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	private static final Logger log =
			LoggerFactory.getLogger(MemberController.class);
	

	/* 서비스 처리 객체 주입 */
	@Inject
	private MemberService service;
	
	// NaverLoginBO
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	// http://localhost:8080/member/signup
	/* 회원가입 get */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getSignup() throws Exception{
		
		log.info("C : 회원가입 get");
		
		return "/member/signup";
	}
	
	/* 회원가입 post */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo, HttpServletRequest request) throws Exception{
		
		log.info("C : 회원가입 post");
		
		// 뷰페이지에서 전달되는 정보 vo
		log.info("C : 뷰페이지에서 전달되는 정보 vo => " + vo);
		
		// 서비스에서 회원가입 동작 호출
		service.signup(vo);
		
		log.info("C : 회원가입 post동작 완료");
		
		// 로그인 페이지로 이동
		return "redirect:/member/signin";
		
	}
	
	/* 아이디 중복 체크 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) throws Exception {
		
		MemberVO idCheck = service.userIdCheck(userId);
		
		if(idCheck != null) return 1;
		else return 0;
	}
	
	
	/* 로그인 get */
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin(HttpSession session, Model model) throws Exception{
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		 
		log.info("C : 네이버로그인 => " + naverAuthUrl);
		 
		// 네이버 로그인 
		model.addAttribute("url", naverAuthUrl);
		
		log.info("C : 로그인 get");
	}
	
	/* 로그인 post */
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
		
		return "redirect:/webook";
	}
	
	/* 네이버 로그인 성공시 callback 호출 메소드 */
	@RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception  {
		
		log.info("C : callback() 호출");
		log.info("C 네이버 vo => " + vo);
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String userId = (String)response_obj.get("id");
		String userEmail = (String)response_obj.get("email");
		String userName = (String)response_obj.get("name");
		String userBirth = (String)response_obj.get("birthyear") + (String)response_obj.get("birthday");
		String userPhon = (String)response_obj.get("mobile");
		
		log.info("C : 네이버 로그인 nickname = > " + nickname);
		
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("naverId",nickname); //세션 생성
		model.addAttribute("result", apiResult);
		
		// 네이버 정보를 vo에 저장
		vo.setUserId(userEmail);
		vo.setUserPass(userId);
		vo.setUserEmail(userEmail);
		vo.setUserName(userName);
		vo.setUserBirth(userBirth);
		vo.setUserPhon(userPhon);
		
		// 네이버 로그인 DB연동
		MemberVO returnVO = service.signinNaver(vo);
		log.info("naver로그인 정보 => " + vo);
		
		if(returnVO == null) { //아이디가 DB에 존재하지 않는 경우
			// 네이버 회원가입
			service.signupNaver(vo);
			
			// 네이버 로그인
			returnVO = service.signinNaver(vo);
			session.setAttribute("naverUserId", returnVO.getUserId());
			session.setAttribute("naverName", returnVO.getUserName());
			rttr.addFlashAttribute("mvo", returnVO);
		} else {
			// 네이버 로그인
			returnVO = service.signinNaver(vo);
			session.setAttribute("naverUserId", returnVO.getUserId());
			session.setAttribute("naverName", returnVO.getUserName());
			rttr.addFlashAttribute("mvo", returnVO);
		}
		
		return "redirect:/webook";
		
	}
	
	/* 구글 로그인 */
	@ResponseBody
	@RequestMapping(value = "/signinGoogle", method = RequestMethod.POST)
	public String postSigninGoogle(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		MemberVO returnVO = service.signinGoogle(vo);
		String mvo_ajaxid = vo.getUserId();
		System.out.println("C: 구글아이디 포스트 db에서 가져온 vo "+ vo);
		System.out.println("C: 구글아이디 포스트 ajax에서 가져온 id "+ mvo_ajaxid);
		
		if(returnVO == null) { //아이디가 DB에 존재하지 않는 경우
			// 구글 회원가입
			service.signupGoogle(vo);
			
			// 구글 로그인
			returnVO = service.signinGoogle(vo);
			session.setAttribute("googleId", returnVO.getUserId());
			session.setAttribute("googleName", returnVO.getUserName());
			rttr.addFlashAttribute("mvo", returnVO);
		} 
		
		if(mvo_ajaxid.equals(returnVO.getUserId())) { //아이디가 DB에 존재하는 경우
			// 구글 로그인
			service.signinGoogle(vo);
			session.setAttribute("googleId", returnVO.getUserId());
			session.setAttribute("googleName", returnVO.getUserName());
			rttr.addFlashAttribute("mvo", returnVO);
		} else { //아이디가 DB에 존재하지 않는 경우
			// 구글 회원가입
			service.signupGoogle(vo);
			
			// 구글 로그인
			returnVO = service.signinGoogle(vo);
			session.setAttribute("googleId", returnVO.getUserId());
			session.setAttribute("googleName", returnVO.getUserName());
			rttr.addFlashAttribute("mvo", returnVO);
		}
		
		return "redirect:/webook";
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		log.info("get logout");
		
		service.signout(session);
		
		return "redirect:/webook";
	}
	
	/* 아이디 찾기 폼 */
	@RequestMapping(value = "/findIdForm", method = RequestMethod.GET)
	public String find_id_form() throws Exception {
		
		return "/member/findIdForm";
	}
	
	/* 아이디 찾기 */
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("userEmail") String userEmail, Model model) throws Exception {
		model.addAttribute("userId", service.findId(response, userEmail));
		return "/member/findId";
	}
	
	/* 비밀번호 찾기 폼 */
	@RequestMapping(value = "/findPwForm")
	public String find_pw_form() throws Exception {
		return "/member/findPwForm";
	}
	
	/* 비밀번호 찾기 */
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public void findPw(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception {
		service.findPw(response, vo);
	}
	
	/* 회원정보 조회(수정 get) */
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.GET)
	public void getInfoUpdate(HttpSession session, Model model) throws Exception {
		
		// 세션 객체 안에 있는 ID 정보 저장
		String userId = (String) session.getAttribute("userId");
		log.info("C : ID 저장 완료 -> " + userId);
		
		// 서비스 - 회원정보 가져오는 동작 
		MemberVO vo = service.readMember(userId);
		
		// 정보 저장 후 페이지 이동 
		model.addAttribute("memVO", vo);
		
	}
	
	/* 회원정보 수정 post */
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String postInfoUpdate(MemberVO vo) throws Exception {
		
		log.info("C : 수정할 회원정보 -> " + vo);
		
		service.updateMember(vo);
		
		return "redirect:/webook";
	}
	
	/* 비밀번호 변경 */
	@RequestMapping(value = "/updatePW", method = RequestMethod.POST)
	public String updatePw(@ModelAttribute MemberVO vo, @RequestParam("oldPw") String oldPw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		session.setAttribute("updatePw", service.updatePw(vo, oldPw, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "redirect:/member/infoUpdate";
	}
	
}

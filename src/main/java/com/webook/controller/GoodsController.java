package com.webook.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webook.domain.GoodsVO;
import com.webook.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {

	private static final Logger log =
			LoggerFactory.getLogger(GoodsController.class);
	
	/* 서비스 처리 객체 주입 */
	@Inject
	private GoodsService service;
	
	/* 상품 등록 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goodsRegisterGET() throws Exception {
		
		log.info("get goods register");
		
		return "/goods/goodsRegister";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String goodsRegisterePOST(GoodsVO vo) throws Exception {
		
		// 상품 등록 서비스 
		service.goodsRegister(vo);
		
		System.out.println("C 상품등록완료 : " + vo );
		
		return "redirect:/goods/list";
	}
	
	/* 상품 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception {
		
		log.info("get goods list");
		
		List<GoodsVO> list = service.goodsList();
		
		model.addAttribute("list", list);
		
		return "/goods/goodsList";
		
	}
	
	/* 상품 상세페이지 */
	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsDetailGET(@RequestParam("gdsNum") int gdsNum, Model model, HttpSession session) throws Exception {
		
		log.info("get goods detail");
		
		// 아이디 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		GoodsVO goods = service.goodsDetail(gdsNum);
		
		model.addAttribute("goods", goods);
		
		return "/goods/goodsDetail";
	}
	
	/* 상품 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String goodsModifyGET(@RequestParam("gdsNum") int gdsNum, Model model, HttpSession session) throws Exception {
		
		log.info("get goods modify");
		
		// 아이디 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		// 상품 수정 페이지 입력된 값 서비스
		model.addAttribute("goods", service.goodsDetail(gdsNum));
		
		return "/goods/goodsModify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String goodsModifyPOST(GoodsVO vo) throws Exception {
		
		log.info("post goods modify");
		
		// 상품 수정 서비스 호출
		service.goodsModify(vo);
		
		return "redirect:/goods/list";
	}
	
	/* 상품 삭제 */
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String goodsDeletePOST(@RequestParam("gdsNum") int gdsNum, Model model, RedirectAttributes rttr) throws Exception {
		
		// 상품 삭제 서비스 호출
		service.goodsDelete(gdsNum);
		
		return "redirect:/goods/list";
	}
	
	/**/
	
	/**/
	
	
}

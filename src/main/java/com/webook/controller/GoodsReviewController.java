package com.webook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webook.domain.GoodsReviewVO;
import com.webook.service.GoodsReviewService;
import com.webook.service.GoodsService;

@RestController
//@Controller
@RequestMapping("/detail/review/*")
public class GoodsReviewController {
	
	@Inject
	private GoodsService gService;
	@Inject
	private GoodsReviewService reService;
	private static final Logger log = LoggerFactory.getLogger(GoodsReviewController.class);
	
	/* 리뷰등록  */
	@RequestMapping(value = "/insert", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int reviewInsert(@ModelAttribute GoodsReviewVO reVO, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		System.out.println("C : reviewInsert데이터 " + reVO);
		
		reService.reviewInsert(reVO);
		//re_ref와 reNum 동기화
		reService.syncRe_ref(reService.getRenum());
		rttr.addFlashAttribute("result", reVO);
		
		rttr.addFlashAttribute("reVO", reService.reviewListEach(reService.getRenum()));
		System.out.println("C: AI제약조건있는 reNum찾기" + reService.getRenum());
		return reService.getRenum();
		
	}
	
	//!!!!!!!!!!!!!!상세페이지 안에 리뷰페이지 아예 인식이 안됨 ㅠㅠ
	// 구글 찾아보고 해보기,, 
	// detail -> insert!! 리뷰등록 안됨!! 
	// 리뷰 등록 숨기기 내놓기 안됨!!
	
	/*  */
	/*  */
	/*  */
	

}

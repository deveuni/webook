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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webook.domain.GoodsReviewVO;
import com.webook.service.GoodsReviewService;
import com.webook.service.GoodsService;

@Controller
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
		
		return reService.getRenum();
		
	}
	
	
	/*  */
	/*  */
	/*  */
	/*  */
	/*  */
	/*  */
	

}

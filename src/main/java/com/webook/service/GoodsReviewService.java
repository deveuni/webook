package com.webook.service;

import java.util.List;

import com.webook.domain.GoodsReviewVO;

public interface GoodsReviewService {
	
	/* 리뷰 목록 */
	public List<GoodsReviewVO> reviewList(Integer gdsNum) throws Exception;
	
	/* 리뷰 목록 each */
	public GoodsReviewVO reviewListEach(Integer reNum) throws Exception;
	
	/* AI제약조건 있는 reNum 가져오기 */
	public int getRenum() throws Exception;
	
	/* 리뷰작성 */
	public void reviewInsert(GoodsReviewVO reVO) throws Exception;
	
	
	
	/*  */
	/*  */
	/*  */

}

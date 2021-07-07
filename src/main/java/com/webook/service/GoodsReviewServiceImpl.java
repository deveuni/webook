package com.webook.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webook.domain.GoodsReviewVO;
import com.webook.persistence.GoodsReviewDAO;

@Service
public class GoodsReviewServiceImpl implements GoodsReviewService {

	// DAO 의존 주입
	@Inject
	private GoodsReviewDAO grdao;
	
	/* 리뷰작성 */
	@Override
	public void reviewInsert(GoodsReviewVO reVO) throws Exception {
		System.out.println("S : 리뷰등록 서비스");
		
		if(reVO == null) {
			System.out.println("S : reVO null");
		}
		
		try {
			grdao.reviewInsert(reVO);
		} catch (Exception e) {
			System.out.println("S : 리뷰등록 예외발생");
			e.printStackTrace();
		}
	}
	
	/* AI제약조건 있는 reNum 가져오기 */
	@Override
	public int getRenum() throws Exception {
		return grdao.getRenum();
	}
	
	
	
	/* */
	/* */
	/* */
	/* */
	/* */
	
	
}

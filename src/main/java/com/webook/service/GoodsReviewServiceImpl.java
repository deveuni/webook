package com.webook.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webook.domain.GoodsReviewVO;
import com.webook.persistence.GoodsReviewDAO;

@Service
public class GoodsReviewServiceImpl implements GoodsReviewService {

	// DAO 의존 주입
	@Inject
	private GoodsReviewDAO grdao;
	
	/* 리뷰 목록 */
	@Override
	public List<GoodsReviewVO> reviewList(Integer gdsNum) throws Exception {
		System.out.println("S : 리뷰 목록 서비스");
		return grdao.reviewList(gdsNum);
	}
	
	/* 리뷰 목록 each */
	@Override
	public GoodsReviewVO reviewListEach(Integer reNum) throws Exception {
		return grdao.reviewListEach(reNum);
	}
	
	/* AI제약조건 있는 reNum 가져오기 */
	@Override
	public int getRenum() throws Exception {
		return grdao.getRenum();
	}
	
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

	/* */
	/* */
	/* */
	/* re_ref와 reNum 동가화 */
	@Override
	public void syncRe_ref(Integer reNum) throws Exception {
		grdao.syncRe_ref(reNum);
	}
	
	
}

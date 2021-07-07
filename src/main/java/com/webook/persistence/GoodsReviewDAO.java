package com.webook.persistence;

import com.webook.domain.GoodsReviewVO;

public interface GoodsReviewDAO {
	
	/* 리뷰작성 */
	public void reviewInsert(GoodsReviewVO reVO) throws Exception;
	
	/* AI제약조건 있는 reNum 가져오기 */
	public int getRenum() throws Exception;
	
	/* */
	/* */
	/* */
	/* */
	/* */

}

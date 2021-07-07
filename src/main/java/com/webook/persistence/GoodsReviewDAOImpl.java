package com.webook.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.GoodsReviewVO;

@Repository
public class GoodsReviewDAOImpl implements GoodsReviewDAO {

	// DB 의존 주입
	@Inject
	private SqlSession sql;
	private static final String namespace = "com.webook.mappers.reviewMapper";
	
	/* 리뷰작성 */
	@Override
	public void reviewInsert(GoodsReviewVO reVO) throws Exception {
		sql.insert(namespace + ".reviewInsert", reVO);
	}
	
	/* AI제약조건 있는 reNum 가져오기 */
	@Override
	public int getRenum() throws Exception {
		return sql.selectOne(namespace+ ".getRenum");
	}
	
	/* */
	/* */
	/* */
	/* */
	/* */
	
	
}

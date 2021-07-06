package com.webook.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsReviewDAOImpl implements GoodsReviewDAO {

	// DB 의존 주입
	@Inject
	private SqlSession sql;
	private static final String namespace = "com.webook.mappers.reviewMapper";
	
	
}

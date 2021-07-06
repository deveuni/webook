package com.webook.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.webook.persistence.GoodsReviewDAO;

@Service
public class GoodsReviewServiceImpl implements GoodsReviewService {

	// DAO 의존 주입
	@Inject
	private GoodsReviewDAO grdao;
	
	
	
	
}

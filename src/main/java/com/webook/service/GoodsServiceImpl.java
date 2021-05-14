package com.webook.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.webook.domain.GoodsVO;
import com.webook.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	/* DB를 처리하기 위한 객체 주입 */ 
	@Inject
	private GoodsDAO gdao;
	
	private static final Logger log =
			LoggerFactory.getLogger(GoodsServiceImpl.class);

	/* 상품 등록 */
	@Override
	public void goodsRegister(GoodsVO vo) throws Exception {
		
		gdao.registerGoods(vo);
		
		System.out.println("S : 상품등록 " + vo);
	}
	
	/**/
	/**/
	/**/
	/**/
	
	
	
}

package com.webook.service;

import java.util.List;

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
	
	/* 상품 목록 */
	@Override
	public List<GoodsVO> goodsList() throws Exception {

		System.out.println("S : 상품 목록 ");
		
		return gdao.goodsList();
	}	
	
	/* 상품 조회 */
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {

		System.out.println("S : 상품 조회");
		
		return gdao.goodsDetail(gdsNum);
	}
	
	/* 상품 수정 */
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {

		System.out.println("S : 상품 수정");
		
		gdao.goodsModify(vo);
		
		System.out.println("S : 수정된 상품 정보 -> " + vo);
		
	}
	
	
	/**/
	
	
	
}

package com.webook.service;

import java.util.List;

import com.webook.domain.GoodsVO;

public interface GoodsService {
	
	/* 상품 등록 */
	public void goodsRegister(GoodsVO vo) throws Exception;
	
	/* 상품 목록 */
	public List<GoodsVO> goodsList() throws Exception; 
	
	/* 상품 조회 */
	public GoodsVO goodsDetail(int gdsNum) throws Exception;
	
	/* 상품 수정 */
	public void goodsModify(GoodsVO vo) throws Exception;
	
	/**/

}

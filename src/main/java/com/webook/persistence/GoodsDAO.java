package com.webook.persistence;

import java.util.List;

import com.webook.domain.GoodsVO;

public interface GoodsDAO {
	
	/* 상품 등록 */
	public void registerGoods(GoodsVO vo) throws Exception;
	
	/* 상품 목록 */
	public List<GoodsVO> goodsList() throws Exception;
	
	/* 상품 조회 */
	public GoodsVO goodsDetail(int gdsNum) throws Exception;
	
	/* 상품 수정 */
	public void goodsModify(GoodsVO vo) throws Exception;
	
	/* 상품 삭제 */
	public void goodsDelete(int gdsNum) throws Exception;
	
	/**/
	/**/
	/**/

}

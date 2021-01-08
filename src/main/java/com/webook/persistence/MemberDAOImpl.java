package com.webook.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.webook.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	/* DB 연결하는 객체 주입 */
	@Inject
	private SqlSession sql;
	
	/* Mapper를 구분하는 값 */
	private static final String namespace
		= "com.webook.mapper.MemberMapper";
	
	/* 회원가입 */
	@Override
	public void signup(MemberVO vo) throws Exception {
		
		sql.insert(namespace+".signup", vo);
	}
	
	/* 아이디 중복 확인 */
	@Override
	public MemberVO userIdCheck(String userId) throws Exception {
		
		return sql.selectOne(namespace+".idCheck", userId);
	}
	
	/* 로그인 */
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		
		return sql.selectOne(namespace+".signin", vo);
	}
	
	
}

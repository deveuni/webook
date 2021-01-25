package com.webook.persistence;

import java.util.HashMap;

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
	
	/* 유저 인증키 생성 메소드*/
	@Override
	public int GetKey(String userId, String userKey) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userKey", userKey);
		
		return sql.update(namespace+".GetKey", map);
	}
	
	/* 회원 인증키 Y로 바꿔주는 메소드 */
	@Override
	public int alter_userKey(String userId, String key) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userKey", key);
		
		return sql.update(namespace+".alter_userKey", map);
	}
	
}

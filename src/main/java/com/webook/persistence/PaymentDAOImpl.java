package com.webook.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Inject
	private SqlSession sql;
	
	private static final String namespace 
		= "com.webook.mappers.payMapper";

}

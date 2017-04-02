package com.graduate.base.data.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Mybatis Dao 基类
 * 
 * @author 刘宏�?
 *         <p>
 *         2016-6-1
 */
public class BaseDao {
	@Autowired
	public SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;		
	}
}

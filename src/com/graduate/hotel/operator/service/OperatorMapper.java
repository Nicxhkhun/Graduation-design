package com.graduate.hotel.operator.service;

import org.apache.ibatis.annotations.Param;

public interface OperatorMapper {
	
	public Operator selectByLoginName(@Param("loginName")String loginName,@Param("id")String id);
	
	public void add(Operator operator);
	
	public Operator findById(@Param("id")String id);

}

package com.graduate.hotel.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
	
	public List<OrderVo> query(@Param("order_num")String order_num,@Param("start_time")String start_time,@Param("end_time")String end_time,@Param("rowstart")Integer rowstart,@Param("rowend")Integer rowend);
	
	public int count(@Param("order_num")String order_num,@Param("start_time")String start_time,@Param("end_time")String end_time);
	
	public void add(Order order);
	
	public void update(Order order);
	
	public void stayUpdate(Order order);
	
	public void changeRoom(Order order);
	
	public OrderVo findById(@Param("id")String id);

}

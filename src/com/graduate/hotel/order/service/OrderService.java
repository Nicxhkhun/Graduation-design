package com.graduate.hotel.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.base.Page;
import com.graduate.hotel.room.service.RoomVo;

@Service("orderService")
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	/**
	 * 分页查询
	 * @param order_num
	 * @param start_time
	 * @param end_time
	 * @param page
	 * @return
	 */
	public Page<OrderVo> query(String order_num,String start_time,String end_time,Page page) {
		List<OrderVo> list = orderMapper.query(order_num,start_time,end_time,page.getFirst(),page.getPageSize());
		page.setResult(list);
		page.setTotalRows((int)orderMapper.count(order_num,start_time,end_time));
		return page;
	}
	/**
	 * 新增
	 * @param order
	 */
	@Transactional
	public void add(Order order){
		order.setId(UUID.randomUUID().toString().replace("-", ""));
		orderMapper.add(order);
	}
	/**
	 * 续住修改
	 * @param order
	 */
	@Transactional
	public void stayUpdate(Order order){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		order.setTime(format.format(new Date()));
		orderMapper.stayUpdate(order);
	}
	
	/**
	 * 换房账单修改
	 * @param order
	 */
	@Transactional
	public void changeRoom(Order order){
		orderMapper.changeRoom(order);
	}
	
	/**
	 * 修改
	 * @param order
	 */
	@Transactional
	public void update(Order order){
		orderMapper.update(order);
	}
	
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public OrderVo findById(String id){
		return orderMapper.findById(id);
	}
}

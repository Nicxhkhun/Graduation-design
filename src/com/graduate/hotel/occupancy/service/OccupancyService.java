package com.graduate.hotel.occupancy.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("occupancyService")
public class OccupancyService {
	@Autowired
	private OccupancyMapper occupancyMapper;
	
	/**
	 * 新增入住
	 * @param occupancy
	 */
	@Transactional
	public void add(Occupancy occupancy){
		occupancy.setId(UUID.randomUUID().toString().replace("-", ""));
		occupancyMapper.add(occupancy);
	}
	
	/**
	 * 查询房间入住信息
	 * @param room_id
	 * @return
	 */
	public List<Occupancy> findNewRecords(String room_id){
		return occupancyMapper.findNewRecords(room_id);
	}
	
	/**
	 * 续住
	 * @param occupancy
	 */
	@Transactional
	public void toStay(Occupancy occupancy){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		occupancy.setTime_stamp(format.format(new Date()));;
		occupancyMapper.toStay(occupancy);
	}
	
	/**
	 * 退房
	 * @param occupancy
	 */
	@Transactional
	public void checkOut(Occupancy occupancy){
		occupancyMapper.checkOut(occupancy);
	}
	
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public Occupancy findById(String id){
		return occupancyMapper.findById(id);
	}
	
	/**
	 * 换房
	 * @param occupancy
	 */
	@Transactional
	public void changeRoom(Occupancy occupancy){
		occupancyMapper.changeRoom(occupancy);
	}
}

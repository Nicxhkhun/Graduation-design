package com.graduate.hotel.occupancy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OccupancyMapper {

	public void add(Occupancy occupancy);
	
	public List<Occupancy> findNewRecords(String room_id);
	
	public void toStay(Occupancy occupancy);
	
	public void checkOut(Occupancy occupancy);
	
	public Occupancy findById(String id);
	
	public void changeRoom(Occupancy occupancy);
}

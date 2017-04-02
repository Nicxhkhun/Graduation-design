package com.graduate.hotel.room.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RoomMapper {
	
	public void add(Room room);
	
	public List<RoomVo> query(@Param("type_id")String type_id,@Param("room_number")String room_number,@Param("rowstart")int rowstart,@Param("rowend")int rowend);
	
	public int count(@Param("type_id")String type_id,@Param("room_number")String room_number);
	
	public void delete(@Param("id")String id);
	
	public Room findById(@Param("id")String id);
	
	public void update(Room room);

}

package com.graduate.hotel.room.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RoomTypeMapper {
	
//	public Operator selectByLoginName(@Param("loginName")String loginName,@Param("id")String id);
	public void add(RoomType roomType);
	
	public List<RoomType> query(@Param("tp_name")String tp_name,@Param("bednum")int bednum,@Param("rowstart")int rowstart,@Param("rowend")int rowend);
	
	public int count(@Param("tp_name")String tp_name,@Param("bednum")int bednum);
	
	public void delete(@Param("id")String id);
	
	public RoomType findById(@Param("id")String id);
	
	public void update(RoomType roomType);

	public List<RoomType> queryAll();
}

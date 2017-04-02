package com.graduate.hotel.room.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.base.Page;

@Service("roomTypeService")
public class RoomTypeService {
	@Autowired
	private RoomTypeMapper roomTypeMapper;
	
	/**
	 * 查询
	 * @param tp_name
	 * @param bednum
	 * @param page
	 * @return
	 */
	public Page<RoomType> query(String tp_name,int bednum,Page page) {
		List<RoomType> list = roomTypeMapper.query(tp_name,bednum,page.getFirst(),page.getPageSize());
		page.setResult(list);
		page.setTotalRows((int)roomTypeMapper.count(tp_name, bednum));
		return page;
	}
	/**
	 * 新增
	 * @param roomType
	 */
	@Transactional
	public void add(RoomType roomType){
		roomType.setId(UUID.randomUUID().toString());
		roomTypeMapper.add(roomType);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(String id){
		roomTypeMapper.delete(id);
	}
	
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public RoomType findById(String id){
		return roomTypeMapper.findById(id);
	}
	/**
	 * 修改
	 * @param roomType
	 */
	public void update(RoomType roomType){
		roomTypeMapper.update(roomType);
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<RoomType> queryAll(){
		return roomTypeMapper.queryAll();
	}
}

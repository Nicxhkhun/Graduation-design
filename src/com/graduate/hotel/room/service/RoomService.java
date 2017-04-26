package com.graduate.hotel.room.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.graduate.base.Page;

@Service("roomService")
public class RoomService {
	@Autowired
	private RoomMapper roomMapper;
	
	/**
	 * 查询
	 * @param tp_name
	 * @param bednum
	 * @param page
	 * @return
	 */
	public Page<RoomVo> query(String type_id,String room_number,Page page,Integer state) {
		List<RoomVo> list = roomMapper.query(type_id,room_number,page.getFirst(),page.getPageSize(),state);
		page.setResult(list);
		page.setTotalRows((int)roomMapper.count(type_id,room_number,state));
		return page;
	}
	/**
	 * 新增
	 * @param roomType
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@Transactional
	public void add(Room room,MultipartFile photoFile) throws IllegalStateException, IOException{
		room.setId(UUID.randomUUID().toString());
		if (photoFile != null && photoFile.getSize() > 0) {
			String fileName = photoFile.getOriginalFilename();
			String fileSuffix = fileName.substring(fileName.lastIndexOf("."));
			String fileNewName = room.getId() + fileSuffix;
			String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
			int num = t.indexOf(".metadata");
			String path = t.substring(1, num).replace('/', '\\') + "hotel\\WebContent\\picture\\";
			String filePath = path + fileNewName;
			File file = new File(filePath);
			photoFile.transferTo(file);
			room.setImgurl(fileNewName);
		}
		roomMapper.add(room);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(String id){
		roomMapper.delete(id);
	}
	
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public Room findById(String id){
		return roomMapper.findById(id);
	}
	
	/**
	 * id查询映射类
	 * @param id
	 * @return
	 */
	public RoomVo findRoomVoById(String id){
		return roomMapper.findRoomVoById(id);
	}
	/**
	 * 修改
	 * @param roomType
	 */
	public void update(Room room){
		roomMapper.update(room);
	}
	/**
	 * 修改房间状态
	 * @param state
	 * @param id
	 */
	@Transactional
	public void updateState(int state,String id){
		roomMapper.updateState(state, id);
	}
	
}

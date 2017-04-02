package com.graduate.hotel.room.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.base.BaseControl;
import com.graduate.base.Page;
import com.graduate.hotel.room.service.Room;
import com.graduate.hotel.room.service.RoomService;
import com.graduate.hotel.room.service.RoomType;
import com.graduate.hotel.room.service.RoomTypeService;
import com.graduate.util.JsonUtil;

@Controller
@RequestMapping(value = "/room", produces = "application/json;charset=UTF-8")
public class RoomControl extends BaseControl {

	@Autowired
	private RoomService roomService;

	@Autowired
	private RoomTypeService roomTypeService;
	/**
	 * 分页查询所有
	 */
	@ResponseBody
	@RequestMapping(value = "query.do")
	public ModelAndView selectDevice(ModelAndView view, String type_id, String room_number, Page page) {
		page = roomService.query(type_id,room_number,page);
		List list=roomTypeService.queryAll();
		view.addObject("type_data", list);
		view.addObject("data", page.getList());
		view.addObject("type_id", type_id);
		view.addObject("room_number", room_number);
		view.setViewName("room/room_query");
		return view;
	}

	/**
	 * 新增
	 * @param model
	 * @param roomtype
	 * @return
	 */
	@RequestMapping(value = "add.do")
	@ResponseBody
	public String add(Model model,MultipartFile photoFile,Room room){
		Map<String, String> map = new HashMap<String, String>();
		try{
			roomService.add(room,photoFile);
			map.put("code", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	@RequestMapping(value = "del.do", produces = "application/json")
	@ResponseBody
	public String delete(String id) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			roomService.delete(id);
			map.put("code", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	/**
	 * 初始化修改
	 * @param request
	 * @param view
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "initUpdate.do")
	public ModelAndView initUpdate(HttpServletRequest request, ModelAndView view, String id) {
		Room room = roomService.findById(id);
		List<RoomType> list=roomTypeService.queryAll();
		view.addObject("room", room);
		view.addObject("type_data", list);
		view.setViewName("room/room_update");
		return view;
	}
	/**
	 * 修改
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value = "update.do", produces = "application/json")
	@ResponseBody
	public String update(Room room){
		Map<String, String> map = new HashMap<String, String>();
		try{
			roomService.update(room);
			map.put("code", "SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
}
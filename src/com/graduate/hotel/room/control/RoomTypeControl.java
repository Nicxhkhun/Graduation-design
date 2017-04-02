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
import org.springframework.web.servlet.ModelAndView;

import com.graduate.base.BaseControl;
import com.graduate.base.Page;
import com.graduate.hotel.room.service.RoomType;
import com.graduate.hotel.room.service.RoomTypeService;
import com.graduate.util.JsonUtil;

@Controller
@RequestMapping(value = "/roomtype", produces = "application/json;charset=UTF-8")
public class RoomTypeControl extends BaseControl {

	@Autowired
	private RoomTypeService roomTypeService;

	/**
	 * 分页查询所有
	 */
	@ResponseBody
	@RequestMapping(value = "query.do")
	public ModelAndView selectDevice(ModelAndView view, String tp_name, String bednum, Page page) {
		Integer num=0;
		if(bednum!=null&&!"".equals(bednum)){
			num=Integer.parseInt(bednum);
		}
		page = roomTypeService.query(tp_name,num,page);
		
		view.addObject("data", page.getList());
		view.addObject("tp_name", tp_name);
		view.addObject("bednum", bednum);
		view.setViewName("room/roomtype_query");
		return view;
	}

	/**
	 * 新增
	 * @param model
	 * @param roomtype
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "add.do", produces = "application/json")
	public String add(Model model,RoomType roomtype){
		Map<String, String> map = new HashMap<String, String>();
		try{
			roomTypeService.add(roomtype);
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
			roomTypeService.delete(id);
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
		RoomType roomType = roomTypeService.findById(id);
		view.addObject("roomType", roomType);
		view.setViewName("room/roomtype_update");
		return view;
	}
	/**
	 * 修改
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value = "update.do", produces = "application/json")
	@ResponseBody
	public String update(RoomType roomType){
		Map<String, String> map = new HashMap<String, String>();
		try{
			roomTypeService.update(roomType);
			map.put("code", "SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	@RequestMapping(value = "findAll.do", produces = "application/json")
	@ResponseBody
	public ModelAndView findAll(ModelAndView view){
		List list=roomTypeService.queryAll();
		view.addObject("type_data", list);
		view.setViewName("room/room_add");
		return view;
	}
}
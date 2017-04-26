package com.graduate.hotel.occupancy.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.relation.RoleResult;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.graduate.base.BaseControl;
import com.graduate.base.Page;
import com.graduate.hotel.occupancy.service.Occupancy;
import com.graduate.hotel.occupancy.service.OccupancyService;
import com.graduate.hotel.order.service.Order;
import com.graduate.hotel.order.service.OrderService;
import com.graduate.hotel.room.service.Room;
import com.graduate.hotel.room.service.RoomService;
import com.graduate.hotel.room.service.RoomType;
import com.graduate.hotel.room.service.RoomTypeService;
import com.graduate.hotel.room.service.RoomVo;
import com.graduate.util.JsonUtil;

@Controller
@RequestMapping(value = "/occupancy", produces = "application/json;charset=UTF-8")
public class OccupancyControl extends BaseControl {

	@Autowired
	private RoomService roomService;

	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private OccupancyService occupancyService;
	
	@Autowired
	private OrderService orderService;
	/**
	 * 分页查询房间
	 */
	@ResponseBody
	@RequestMapping(value = "queryroom.do")
	public ModelAndView selectDevice(ModelAndView view, String type_id, String room_number, Page page) {
		page.setPageSize(27);
		page = roomService.query(type_id,room_number,page,null);
		List list=roomTypeService.queryAll();
		view.addObject("type_data", list);
		view.addObject("data", page.getList());
		view.addObject("type_id", type_id);
		view.addObject("room_number", room_number);
		view.setViewName("occupancy/occupancy_query");
		return view;
	}

	/**
	 * 由id查询房间
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "findById.do")
	@ResponseBody
	public String findById(Model model,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			Room room=roomService.findById(id);
			map.put("code", "SUCCESS");
			map.put("room", JSON.toJSON(room));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	/**
	 * 跳转入住登记页面
	 * @param view
	 * @param roomid
	 * @return
	 */
	@RequestMapping(value = "toCustomer.do")
	@ResponseBody
	public ModelAndView toCustomer(ModelAndView view,String roomid){
		view.addObject("roomid", roomid);
		view.setViewName("occupancy/cus_add");
		return view;	
	}
	
	@RequestMapping(value = "occupancy.do")
	@ResponseBody
	public ModelAndView Occupancy(HttpServletRequest request,ModelAndView view,String room_id,String p_account,String contact
			,String start_date,String end_date,String remark,String[] c_name,String[] zj_type,String[] zj_no,String[] c_sex){
		RoomVo roomVo=roomService.findRoomVoById(room_id);
		try{
			SimpleDateFormat format=new SimpleDateFormat("MMddyyHHmm");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
			Date date1 =format1.parse(start_date); 
			Date date2 =format1.parse(end_date);
			int day=(int)(date2.getTime()-date1.getTime())/(24*60*60*1000); 
			String in_no="RZ"+format.format(new Date());
			for (int i = 0; i < zj_no.length; i++) {
				if(!"".equals(zj_no[i]))
				{
					Occupancy occupancy=new Occupancy();
					occupancy.setRoom_id(room_id);
					occupancy.setIn_no(in_no);
					occupancy.setRoom_number(roomVo.getRoom_number());
					occupancy.setC_name(c_name[i]);
					occupancy.setC_sex(c_sex[i]);
					occupancy.setZj_type(zj_type[i]);
					occupancy.setZj_no(zj_no[i]);
					occupancy.setP_account(Integer.parseInt(p_account));
					occupancy.setIn_time(start_date);
					occupancy.setDays(day+1);
					occupancy.setForegift(roomVo.getPrice()*0.5*(day+1));
					occupancy.setContact(contact);
					occupancy.setOp_id(this.getLoginUserId(request));
					occupancy.setRemark(remark);
					occupancyService.add(occupancy);
				}
			}
			roomService.updateState(1, room_id);
			Order order=new Order();
			order.setRoom_id(room_id);
			order.setRoom_num(roomVo.getRoom_number());
			order.setOrder_num(in_no);
			order.setType("入住押金");
			order.setMoney(roomVo.getPrice()*0.5*(day+1));
			order.setOp_id(this.getLoginUserId(request));
			order.setRemark(p_account+"人入住"+roomVo.getRoom_number()+"房押金");
			orderService.add(order);
			view.addObject("result", "请交付押金"+roomVo.getPrice()*0.5*(day+1)+"元");
			view.addObject("res", "入住成功！");
		}catch(Exception e){
			view.addObject("result", "糟糕，可能出错了！");
			view.addObject("res", "请刷新重试！！！");
			e.printStackTrace();
		}
		view.setViewName("occupancy/cus_add");
		return view;
	}
	
	@RequestMapping(value = "toStay.do")
	@ResponseBody
	public ModelAndView toStay(HttpServletRequest request,ModelAndView view,String room_id){
		List<Occupancy> list=occupancyService.findNewRecords(room_id);
		view.addObject("list",list);
		view.addObject("op_name",this.getLoginUser(request).getName());
		view.setViewName("occupancy/tostay");
		return view;	
	}
	
	/**
	 * 续住
	 * @param request
	 * @param view
	 * @param room_id
	 * @return
	 */
	@RequestMapping(value = "Stay.do")
	@ResponseBody
	public String Stay(HttpServletRequest request,String days,String foregift,String day,String in_no,String room_id){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			Room room=roomService.findById(room_id);
			RoomType roomType=roomTypeService.findById(room.getType_id());
			double price=roomType.getPrice();
			double foreg=Double.parseDouble(foregift)+(Integer.parseInt(day)*price*0.5);
			Occupancy occupancy=new Occupancy();
			occupancy.setDays(Integer.parseInt(days)+Integer.parseInt(day));
			occupancy.setForegift(foreg);
			occupancy.setRemark("原预计入住"+days+"天，续住"+day+"天，原交付押金"+foregift+"元，又补交押金"+(Integer.parseInt(day)*price*0.5)+"元");
			occupancy.setIn_no(in_no);
			occupancy.setOp_id(this.getLoginUserId(request));
			System.out.println(occupancy.getDays());
			System.out.println(occupancy.getForegift());
			System.out.println(occupancy.getRemark());
			System.out.println(occupancy.getIn_no());
			System.out.println(occupancy.getOp_id());
			occupancyService.toStay(occupancy);
			Order order=new Order();
			order.setOrder_num(in_no);
			order.setMoney(foreg);
			order.setOp_id(this.getLoginUserId(request));
			orderService.stayUpdate(order);
			map.put("code", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	@RequestMapping(value = "tocheckOut.do")
	@ResponseBody
	public ModelAndView tocheckOut(HttpServletRequest request,ModelAndView view,String room_id){
		List<Occupancy> list=occupancyService.findNewRecords(room_id);
		view.addObject("list",list);
		view.addObject("op_name",this.getLoginUser(request).getName());
		view.setViewName("occupancy/tocheckout");
		return view;	
	}
	
	@RequestMapping(value = "checkOut.do")
	@ResponseBody
	public String checkOut(HttpServletRequest request,String in_time,String days,String foregift,String in_no,String room_id) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat format=new SimpleDateFormat("MMddyyHHmm");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		Room room=roomService.findById(room_id);
		RoomType roomType=roomTypeService.findById(room.getType_id());
		double price=roomType.getPrice();//房间价格
		double foregift1=Double.parseDouble(foregift);
		int days1=Integer.parseInt(days);
		double money=0;
		Date date1;
		Order order=new Order();
		String remark = null;
		try {
			date1 = format1.parse(in_time+" 00:00:00");
			Date date2 =new Date();
			int day=((int)(date2.getTime()-date1.getTime())/(24*60*60*1000))+1; //实际天数
			if(day>=days1){
				money=(price*day)-foregift1;//顾客需交付的金额
				remark="入住"+day+"天，退房结账交付"+money+"元";
				map.put("money", "请顾客交付"+money+"元！");
			}else if(day<days1){
				double m1=price*day;
				if(m1>=foregift1){
					money=m1-foregift1;//顾客需交付的金额
					remark="入住"+day+"天，退房结账交付"+money+"元";
					map.put("money", "请顾客交付"+money+"元！");
				}else{
					money=foregift1-m1;//找给顾客的金额
					remark="入住"+day+"天，退房结账,返还顾客"+money+"元";
					map.put("money", "需返还顾客"+money+"元！");
				}
			}
			String chk_no="TF"+format.format(new Date());
			Occupancy occupancy=new Occupancy();
			occupancy.setIn_no(in_no);
			occupancy.setChk_no(chk_no);
			occupancy.setChk_time(format1.format(new Date()));
			occupancy.setOp_id(this.getLoginUserId(request));
			occupancyService.checkOut(occupancy);
			roomService.updateState(2, room_id);
			order.setOrder_num(chk_no);
			order.setRoom_id(room_id);
			order.setRoom_num(room.getRoom_number());
			order.setMoney(money);
			order.setType("结账退房");
			order.setOp_id(this.getLoginUserId(request));
			order.setRemark(remark);
			orderService.add(order);
			map.put("code", "SUCCESS");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			map.put("code", "FAIL");
			e.printStackTrace();
		} 
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	@RequestMapping(value = "toChange.do")
	@ResponseBody
	public ModelAndView toChange(HttpServletRequest request,ModelAndView view,String room_id){
		List<Occupancy> list=occupancyService.findNewRecords(room_id);
		view.addObject("list",list);
		view.addObject("op_name",this.getLoginUser(request).getName());
		view.setViewName("occupancy/tochange");
		return view;	
	}
	
	@ResponseBody
	@RequestMapping(value = "findRoom.do")
	public ModelAndView findRoom(ModelAndView view, String ocid,String type_id, String room_number, Page page) {
		page = roomService.query(type_id,room_number,page,0);
		List list=roomTypeService.queryAll();
		view.addObject("type_data", list);
		view.addObject("data", page.getList());
		view.addObject("type_id", type_id);
		view.addObject("room_number", room_number);
		view.addObject("ocid", ocid);
		view.setViewName("occupancy/room");
		return view;
	}
	
	@RequestMapping(value = "change.do")
	@ResponseBody
	public String change(HttpServletRequest request,String ocid,String roomid){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			RoomVo room=roomService.findRoomVoById(roomid);
			Occupancy occupancy=occupancyService.findById(ocid);
			roomService.updateState(2, occupancy.getRoom_id());//修改之前客房的状态
			double money1=room.getPrice()*occupancy.getDays()*0.5;//换房后的押金
			double money2=occupancy.getForegift();//之前所交的押金
			double money3;
			Order order=new Order();
			if(money1>=money2){
				money3=money1-money2;//补交押金
				order.setRemark("换房补交押金"+money3+"元，总押金"+money1+"元");
				map.put("money", "顾客需补交押金"+money3+"元，共"+money1+"元");
			}else{
				money3=money2-money1;//返还押金
				order.setRemark("换房返还押金"+money3+"元，总押金"+money1+"元");
				map.put("money", "需返还顾客押金"+money3+"元，共"+money1+"元");
			}
			occupancy.setRoom_id(roomid);
			occupancy.setRoom_number(room.getRoom_number());
			occupancy.setForegift(money1);
			occupancy.setOp_id(this.getLoginUserId(request));
			occupancyService.changeRoom(occupancy);
			order.setOrder_num(occupancy.getIn_no());
			order.setRoom_id(roomid);
			order.setRoom_num(room.getRoom_number());
			order.setMoney(money1);
			order.setOp_id(this.getLoginUserId(request));
			orderService.changeRoom(order);
			roomService.updateState(1, roomid);//修改换房后的房间状态
			map.put("res", "SUCCESS");
		}catch(Exception e){
			map.put("res", "FAIL");
			e.printStackTrace();
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
	@RequestMapping(value = "clean.do")
	@ResponseBody
	public String clean(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			roomService.updateState(0, id);
			map.put("res", "SUCCESS");
		}catch(Exception e){
			map.put("res", "FAIL");
			e.printStackTrace();
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
}
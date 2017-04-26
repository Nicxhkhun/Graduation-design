package com.graduate.hotel.order.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.base.BaseControl;
import com.graduate.base.Page;
import com.graduate.hotel.operator.service.OperatorService;
import com.graduate.hotel.order.service.Order;
import com.graduate.hotel.order.service.OrderService;
import com.graduate.hotel.order.service.OrderVo;
import com.graduate.util.JsonUtil;

@Controller
@RequestMapping(value = "/order", produces = "application/json;charset=UTF-8")
public class OrderControl extends BaseControl {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OperatorService operatorService;

	/**
	 * 分页查询所有
	 */
	@ResponseBody
	@RequestMapping(value = "query.do")
	public ModelAndView selectDevice(ModelAndView view,String order_num,String start_time,String end_time, Page page) {
		page = orderService.query(order_num, start_time, end_time, page);
		view.addObject("data", page.getList());
		view.addObject("order_num", order_num);
		view.addObject("start_time",start_time);
		view.addObject("end_time", end_time);
		view.setViewName("order/order_query");
		return view;
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
		OrderVo order=orderService.findById(id);
		view.addObject("order", order);
		view.setViewName("order/order_update");
		return view;
	}
	/**
	 * 修改
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value = "update.do", produces = "application/json")
	@ResponseBody
	public String update(String id,String remark){
		Map<String, String> map = new HashMap<String, String>();
		Order order=new Order();
		order.setId(id);
		order.setRemark(remark);
		try{
			orderService.update(order);
			map.put("res", "SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
			map.put("res", "FAIL");
		}
		String json = JsonUtil.toJson(map);
		return json;
	}
	
}
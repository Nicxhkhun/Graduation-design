package com.graduate.hotel.operator.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.graduate.base.BaseControl;
import com.graduate.common.SessionKey;
import com.graduate.hotel.operator.service.Operator;
import com.graduate.hotel.operator.service.OperatorService;
import com.graduate.util.JsonUtil;

@Controller
public class LoginController extends BaseControl {

	/**
	 * 登陆判断
	 * 
	 */
	@Autowired
	private OperatorService operatorService;

	@RequestMapping(value = "login.do")
	public String login(HttpServletRequest request, String loginName, String password, Model model) {
		boolean b = operatorService.LoginApply(request, loginName, password);
		if (b == true) {
			return "main";
		}
		return "login";
	}

	/**
	 * 删除session
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "loginOut.do", produces = "application/json")
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute(SessionKey.USER); // 删除session
		session.invalidate();
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", "0");
		String json = JsonUtil.toJson(map);
		return json;
	}

//	/**
//	 * 修改密码
//	 * 
//	 */
//	@RequestMapping(value = "updatePassword.do", produces = "application/json")
//	@ResponseBody
//	public String updatePasswords(HttpServletRequest request, String oldPassword, String newPassword) {
//		Apply apply = getLoginUser(request);
//		String s = applyService.updatePassword(apply, oldPassword, newPassword);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("code", s);
//		String json = JsonUtil.toJson(map);
//		return json;
//	}
//
	@RequestMapping(value = "toRegister.do")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "register.do")
	@ResponseBody
	public String register(Operator operator, String loginName, MultipartFile photoFile,String PhotoBuffer, HttpSession session) {
		try {
			Operator checkAOperator = operatorService.selectByLoginName(loginName, null);
			if (checkAOperator != null) {
				return "EXIST";
			} else {
				operatorService.regist(operator, photoFile);
				Operator operator2 = operatorService.selectByLoginName(loginName, null);
				session.setAttribute(SessionKey.USER, operator2);
				session.setAttribute("name", operator2.getLoginName());
				return "SUCCESS";

			}
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}
	}
}
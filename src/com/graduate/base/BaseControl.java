package com.graduate.base;

import javax.servlet.http.HttpServletRequest;

import com.graduate.common.SessionKey;
import com.graduate.hotel.operator.service.Operator;

/**
 * 控制类基类
 * 
 * @author cx
 *
 */
public class BaseControl {

	/**
	 * 返回 当前登录的用户信息
	 * 
	 * @return
	 */
	public Operator getLoginUser(HttpServletRequest request) {
		Operator operator = (Operator) request.getSession().getAttribute(SessionKey.USER);
		return operator;
	}

	/**
	 * 返回 当前登录的ID
	 * 
	 * @return
	 */
	public String getLoginUserId(HttpServletRequest request) {
		Operator operator = (Operator) request.getSession().getAttribute(SessionKey.USER);
		return operator.getId();
	}

}

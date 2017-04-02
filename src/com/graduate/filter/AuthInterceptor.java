package com.graduate.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.graduate.common.SessionKey;
import com.graduate.hotel.operator.service.Operator;

//import com.miracletec.base.Constant;
//import com.miracletec.login.service.User;
//import com.miracletec.system.service.Authority;
//import com.miracletec.util.PowerUtil;

/**
 * 拦截器
 *@author cx
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {
	Logger log = Logger.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		// 用户是否登录
		Operator loginuser = (Operator) req.getSession().getAttribute(SessionKey.USER);
		String url = req.getRequestURI();
		log.info("请求地址:" + url);
		if (url.indexOf("login") > 0) {
			return true;
		}
		if (loginuser == null) {
			// 如果是Ajax请求
			if (req.getHeader("x-requested-with") != null
					&& req.getHeader("X-Requested-With").equalsIgnoreCase("XMLHttpRequest")) {
				res.getWriter().write("{\"code\":\"9000\"}");
			} else {
				res.sendRedirect(req.getContextPath() + "/login.jsp");
			}
			log.info("用户超时,拦截");
			return false;
		}

		return true;
	}
}

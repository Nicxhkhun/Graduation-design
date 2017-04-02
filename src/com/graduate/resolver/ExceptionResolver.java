package com.graduate.resolver;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.util.ExceptionUtil;

/**
 * 异常统一处理
 * @author cx
 */
public class ExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request,HttpServletResponse response, Object object, Exception exception) {
		ModelAndView view=new ModelAndView();
		Logger log=Logger.getLogger(ExceptionResolver.class);
		log.info("请求url:"+request.getRequestURI());
		if(exception instanceof SQLException){
			log.info(ExceptionUtil.Exception2StringForLog(exception));
		}else if(exception instanceof NullPointerException){
			log.info(ExceptionUtil.Exception2StringForLog(exception));
		}
		if(request.getHeader("x-requested-with") != null && 
				request.getHeader("X-Requested-With").equalsIgnoreCase("XMLHttpRequest")){
			log.info("請求是Ajax請求,设置响应�?");
			response.setHeader("errormessage","500");
			return null;
		}else{
			view.addObject("errormessage", exception.getMessage());
			view.setViewName("message/error");
			return view;
		}
	}


}

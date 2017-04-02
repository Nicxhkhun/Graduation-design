package com.graduate.util;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * 异常处理
 * 
 * <PRE>
 * 2011-05-16 刘宏兴 ADD
 * @author Administrator
 * 
 */
public class ExceptionUtil {
	/**
	 * 返回日志记录的异常信息
	 * 
	 * <PRE>
	 * 
	 * 2011-05-16 刘宏兴 ADD
	 * 
	 * @param exp
	 * @return
	 */
	public static String Exception2StringForLog(Exception exp) {
		String expMsg;
		expMsg = "<pre>ToString:\n" + exp.toString();

		expMsg += "\nStackTrace:\n";
		StringWriter stringWriter = new StringWriter();
		exp.printStackTrace(new PrintWriter(stringWriter));
		expMsg += stringWriter.getBuffer().toString();
		expMsg += "\nMessage:\n";
		expMsg += exp.getMessage();

		return expMsg;
	}

}

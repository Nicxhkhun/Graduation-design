package com.graduate.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 获取 spring ApplicationContext
 * <p>
 * 本类只用于单体测试
 * 
 * @author 刘宏兴 2016/5/31
 *
 */
public class SpringHelper {
	public static ApplicationContext applicationContext;

	static {
		applicationContext = new ClassPathXmlApplicationContext(
				new String[] { "conf/spring-mybatis.xml", "conf/dispatcher-servlet.xml" });

	}

	/**
	 * 获取 ApplicationContext
	 * 
	 * @return
	 */
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 根据名称 获取对象
	 * 
	 * @param name
	 * @return
	 */
	public static <T> T getBean(String name) {
		checkApplicationContext();
		return (T) applicationContext.getBean(name);
	}

	/**
	 * 根据类名称获取对象
	 * 
	 * @param requiredType
	 * @return
	 */
	public static <T> T getBean(Class<T> requiredType) {
		checkApplicationContext();
		return applicationContext.getBean(requiredType);
	}

	private static void checkApplicationContext() {
		if (applicationContext == null)
			throw new IllegalStateException("applicaitonContext未注入,请在applicationContext.xml中定义SpringContextHolder");
	}

}

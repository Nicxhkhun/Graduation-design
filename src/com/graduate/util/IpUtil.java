package com.graduate.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IpUtil {
	static Logger log = LoggerFactory.getLogger(IpUtil.class);

	/**
	 * 获取ip地址
	 * 
	 * @param request
	 * @return
	 * @throws UnknownHostException
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String localIp = "";
		try {
			localIp = InetAddress.getLocalHost().getHostAddress();
			log.debug("IpUtil#getIpAddr 获取的localIp:" + localIp);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		if (localIp != null) {
			return localIp;
		}
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		log.debug("IpUtil#getIpAddr 获取的ip:" + ip);
		return ip;
	}
}

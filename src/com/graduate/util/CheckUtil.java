package com.graduate.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckUtil {
	/**
	 * 校验手机号
	 * @param phone
	 * @return
	 */
	public static boolean checkPhone(String phone){
		if(phone == null || phone.equals(""))
			return false;
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		Matcher m = p.matcher(phone);
		return m.matches();
	}
	/**
	 * 校验登录名(数字，字母，下划线)
	 * @author 任金旺
	 * @param loginName
	 * @return
	 */
	public static boolean checkLoginName(String loginName){
		if(loginName==null||loginName.equals(""))
			return false;
		Pattern p=Pattern.compile("^[0-9a-zA-Z_]+$");
		Matcher m=p.matcher(loginName);
		return m.matches();
	}
	
	/**
	 * 校验邮箱
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email){
		if(email == null || email.equals(""))
			return false;
		Pattern p = Pattern.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
		Matcher m = p.matcher(email);
		return m.matches();
	}
	
	/**
	 * 校验身份证号
	 * @param idNumber
	 * @return
	 */
	public static boolean checkIdNo(String idNumber){
		if(idNumber == null || idNumber.equals(""))
			return false;
		Pattern p = Pattern.compile("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])");
		Matcher m = p.matcher(idNumber);
		return m.matches();
	}

}

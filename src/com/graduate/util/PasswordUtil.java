package com.graduate.util;

public class PasswordUtil {
	/**
	 * 生成 password
	 * <p>
	 * 刘宏兴 2016-6-7
	 * 
	 * @param id
	 *            数据库记录的 ID
	 * @param password
	 *            真实的密码
	 * @return
	 */
	public static String makePassword(String id, String password) {
		if (id == null)
			id = "";
		if (password == null)
			password = "";

		return MD5Util.toMD5(id + password + "yoyo");
	}
}

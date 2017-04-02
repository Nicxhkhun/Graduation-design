package com.graduate.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 生成MD5摘要
 * 
 * <PRE>
 * 2010-05-09 刘宏兴 ADD
 * @author Administrator
 * 
 */
public class MD5Util {
	
	public static String str2MD5_32(String sourceStr) throws Exception {
		String result = "";
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(sourceStr.getBytes());
		byte b[] = md.digest();
		int i;
		StringBuffer buf = new StringBuffer("");
		for (int offset = 0; offset < b.length; offset++) {
			i = b[offset];
			if (i < 0)
				i += 256;
			if (i < 16)
				buf.append("0");
			buf.append(Integer.toHexString(i));
		}
		result = buf.toString();
		return result;
	}

	
	public static String toMD5(String plainText) {
		String value = "";
		if (plainText == null)
			plainText = "";

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			value = buf.toString();

			//System.out.println("result: " + buf.toString());// 32位的加密
			// System.out.println("result: " + buf.toString().substring(8,
			// 24));// 16位的加密
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return value;
	}

	public static void main(String agrs[]) {
		// md5 md51 = new md5();
		String a = MD5Util.toMD5("893721");// 加密4
		System.out.println(a);
	}
}
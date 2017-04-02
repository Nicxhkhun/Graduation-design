package com.graduate.util;

import java.io.FileOutputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;

public class Base64ToImage {
	// base64字符串转化成图片
	public static boolean GenerateImage(String imgFilePath, String imgStr) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgStr == null) // 图像数据为空
			return false;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpg图片
			// String imgFilePath = "c:test.jpg";// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/*
	 * public static void main(String[] args) { String base64 =
	 * "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";
	 * boolean status = GenerateImage(base64); System.out.println(status); }
	 */
}

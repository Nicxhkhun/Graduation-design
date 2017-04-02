package com.graduate.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;

import com.google.gson.GsonBuilder;
import com.graduate.hotel.file.service.FileUploadMessage;

/**
 * 模拟（发送/删除文件）客户端
 * 
 * @author 陈欣
 *         <p>
 *         2016-9-9
 */
/**
 * 
 * @author 陈欣
 *         <p>
 *         2016年9月14日
 */
public class HttpPostUploadUtil {

	/**
	 * 上传文件
	 * 
	 * @param filepath
	 *            上传文件路径
	 */
	/**
	 * @param filepath
	 * @return
	 */
	public static String upload(String filepath) {
		String res = "";
		HttpURLConnection conn = null;
		String BOUNDARY = "---------------------------"; // boundary就是request头和上传文件内容的分隔符
		String urlStr = getUploadUrl(filepath);
		try {

			URL url = new URL(urlStr);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(30000);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
			conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

			OutputStream out = new DataOutputStream(conn.getOutputStream());
			InputStream is = Files.newInputStream(Paths.get(filepath));
			int a;
			while ((a = is.read()) != -1) {

				out.write(a);
			}
			out.flush();
			out.close();

			// 读取返回数据
			StringBuffer strBuf = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				strBuf.append(line).append("\n");
			}
			res = strBuf.toString();
			reader.close();
			reader = null;
		} catch (Exception e) {
			System.out.println("发送POST请求出错。" + urlStr);
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect();
				conn = null;
			}
		}
		return res;
	}

	public static FileUploadMessage upload(String filePath, String suffix) throws FileNotFoundException {
		String res = "";
		HttpURLConnection conn = null;
		String BOUNDARY = "---------------------------"; // boundary就是request头和上传文件内容的分隔符
		String urlStr = getUploadUrl(suffix);
		FileInputStream fileInputStream = new FileInputStream(filePath);
		try {

			URL url = new URL(urlStr);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(30000);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
			conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

			OutputStream out = new DataOutputStream(conn.getOutputStream());

			int a;
			while ((a = fileInputStream.read()) != -1) {

				out.write(a);
			}
			out.flush();
			out.close();

			// 读取返回数据
			StringBuffer strBuf = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				strBuf.append(line).append("\n");
			}
			res = strBuf.toString();
			reader.close();
			reader = null;
			fileInputStream.close();
		} catch (Exception e) {
			System.out.println("发送POST请求出错。" + urlStr);
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect();
				conn = null;
			}
		}
		FileUploadMessage fileUploadMessage = new GsonBuilder().create().fromJson(res, FileUploadMessage.class);
		return fileUploadMessage;
	}

	/**
	 * 删除文件
	 * 
	 * @param filedeletepath
	 *            删除文件路径
	 */
	public static String delete(String filedeletepath) {
		String res = "";
		HttpURLConnection conn = null;
		String urlStr = getDeleteUrl(filedeletepath);
		try {

			URL url = new URL(urlStr);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(30000);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setRequestMethod("DELETE");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
			conn.setRequestProperty("Content-Type", "multipart/form-data;");

			OutputStream out = new DataOutputStream(conn.getOutputStream());
			/*
			 * InputStream is = Files.newInputStream(Paths.get(filepath)); int
			 * a; while ((a = is.read()) != -1) {
			 * 
			 * out.write(a); }
			 */
			out.flush();
			out.close();

			// 读取返回数据
			StringBuffer strBuf = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				strBuf.append(line).append("\n");
			}
			res = strBuf.toString();
			reader.close();
			reader = null;
		} catch (Exception e) {
			System.out.println("发送Delete请求出错。" + urlStr);
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.disconnect();
				conn = null;
			}
		}
		return res;
	}

	/**
	 * 获取上传文件服务器访问地址
	 */
	/*
	 * public static String getUploadUrl(String filepath) { String url =
	 * "http://192.168.1.122:8081/file/file?appid=id3&ts="; Date date = new
	 * Date(); long current_time = date.getTime(); String s = "appid=id3&ts=" +
	 * current_time + "&ftype=jt&key=key3"; String md5 = MD5Util.md5(s); url =
	 * url + current_time + "&sign=" + md5 + "&ftype=jt&suffix=" +
	 * filepath.substring(filepath.lastIndexOf(".") + 1); return url; }
	 */
	public static String getUploadUrl(String suffix) {
		String url = "http://f.yoyoyt.com/file/file?appid=id3&ts=";
		Date date = new Date();
		long current_time = date.getTime();
		String s = "appid=id3&ts=" + current_time + "&ftype=jt&key=key3";
		String md5;
		try {
			md5 = MD5Util.str2MD5_32(s);
			url = url + current_time + "&sign=" + md5 + "&ftype=jt&suffix=" + suffix;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	/**
	 * 获取删除文件的服务器访问地址
	 */
	public static String getDeleteUrl(String filepath) {

		String fileFullName = URLEncoder.encode(filepath);
		String url = "http://f.yoyoyt.com/file/file?appid=id3&ts=";
		Date date = new Date();
		long current_time = date.getTime();
		String s = "appid=id3&ts=" + current_time + "&fileFullName=" + fileFullName + "&key=key3";
		String md5;
		try {
			md5 = MD5Util.str2MD5_32(s);
			url = url + current_time + "&sign=" + md5 + "&fileFullName=" + fileFullName;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	/**
	 * main
	 * 
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws FileNotFoundException {

		String filepath = "D:\\aa.png";
		// String urlStr =
		// "http://192.168.1.122:8080/file/file?appid=id3&ts=1473399476596&sign=a6cc2c7f316266e22063586f0ac56c70&ftype=jt&suffix=jpg";
		FileUploadMessage response = upload(filepath, "png");// appid=id3&ts=1473399476596&ftype=jt&key=key3
		System.out.println(response.getData().getFileFullName());
		// System.out.println(ret);

		/*
		 * String filedeletepath =
		 * "http://192.168.1.122:8081//file/id3/jt/5d669d8a3b1846afa4687e0f9fba5f90.jpg";
		 * String ret = delete(filedeletepath); System.out.println(ret);
		 */
	}

}

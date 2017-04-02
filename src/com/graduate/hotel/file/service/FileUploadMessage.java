package com.graduate.hotel.file.service;
/**
 * 调用文件上传接口返回的数据
 * @author 吴佳同
 *
 * 2016年9月8日
 * 
 * {“code”:”0”,”msg”:””,”data”:{“fileFullName”:”http://192.168.1.3:8080/file/o/a.jpg”}}
 * 
 * 规定 :	0表示 成功保存文件 
 * 		1表示参数 传入的不符合
 * 		0002表示 权限未通过验证
 * 		3表示 request请求中body为null
 * 		1001表示 保存文件时候 出现错误
 * 		1000 ftype的格式验证
		0001 ts超时的验证 只前后5分钟的请求
 */
public class FileUploadMessage {
	private String code;
	private String msg;
	private Data data;
	
	public class Data{
		private String fileFullName;

		public String getFileFullName() {
			return fileFullName;
		}

		public void setFileFullName(String fileFullName) {
			this.fileFullName = fileFullName;
		}
		
		
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	
}


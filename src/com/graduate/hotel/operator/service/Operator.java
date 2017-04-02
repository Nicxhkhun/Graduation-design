package com.graduate.hotel.operator.service;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Operator {

	private String id;
	private String loginName;
	private String password;
	private String name;
	private String sex;
	@JSONField(format = "yyyy-MM-dd")
	private String birthDay;
	private String phone;
	private String address;
	private String imgUrl;
	@JSONField(format = "HH:mm:ss")
	private Date inTime;
	private Integer privilege;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
	public Integer getPrivilege() {
		return privilege;
	}
	public void setPrivilege(Integer privilege) {
		this.privilege = privilege;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	
}
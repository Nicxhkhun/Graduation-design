package com.graduate.hotel.room.service;

public class RoomType {

	private String id;
	private String tp_name;
	private double price;
	private int bednum;
	private String remark;
	private int breakfast;
	private String bedtype;
	private int people_num;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTp_name() {
		return tp_name;
	}
	public void setTp_name(String tp_name) {
		this.tp_name = tp_name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getBednum() {
		return bednum;
	}
	public void setBednum(int bednum) {
		this.bednum = bednum;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public String getBedtype() {
		return bedtype;
	}
	public void setBedtype(String bedtype) {
		this.bedtype = bedtype;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	
	
}

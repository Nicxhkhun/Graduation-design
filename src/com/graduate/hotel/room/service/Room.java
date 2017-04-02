package com.graduate.hotel.room.service;

public class Room {

	private String id;
	private String room_number;
	private String position;
	private String type_id;
	private String phone;
	private int state;//(0:空闲，1：在使用，2：清洁中)
	private String imgurl;
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}

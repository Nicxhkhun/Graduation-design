package com.graduate.hotel.occupancy.service;

import java.util.Date;

public class Occupancy {

	private String id;//主键id
	private String in_no;//入住编号
	private String room_id;//房间id
	private String room_number;//房间号
	private String c_name;//顾客姓名
	private String c_sex;//性别
	private String zj_type;//证件类型
	private String zj_no;//证件号
	private int p_account;//入住人数
	private String in_time;//入住时间
	private int days;//入住天数
	private double foregift;//押金
	private String chk_no;//结算单号
	private String chk_time;//结算时间
	private String contact;//紧急联系人方式
	private String op_id;//操作员id
	private String remark;//备注
	private String time_stamp;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIn_no() {
		return in_no;
	}
	public void setIn_no(String in_no) {
		this.in_no = in_no;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_sex() {
		return c_sex;
	}
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	public String getZj_type() {
		return zj_type;
	}
	public void setZj_type(String zj_type) {
		this.zj_type = zj_type;
	}
	public String getZj_no() {
		return zj_no;
	}
	public void setZj_no(String zj_no) {
		this.zj_no = zj_no;
	}
	public int getP_account() {
		return p_account;
	}
	public void setP_account(int p_account) {
		this.p_account = p_account;
	}
	public String getIn_time() {
		return in_time;
	}
	public void setIn_time(String in_time) {
		this.in_time = in_time;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public double getForegift() {
		return foregift;
	}
	public void setForegift(double foregift) {
		this.foregift = foregift;
	}
	public String getChk_no() {
		return chk_no;
	}
	public void setChk_no(String chk_no) {
		this.chk_no = chk_no;
	}
	public String getChk_time() {
		return chk_time;
	}
	public void setChk_time(String chk_time) {
		this.chk_time = chk_time;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getOp_id() {
		return op_id;
	}
	public void setOp_id(String op_id) {
		this.op_id = op_id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}
	
	
}

package com.graduate.hotel.occupancy.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class test {

	public static void main(String[] args) throws ParseException {
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		String s1="2017-04-13 13:10";
		String s2="2017-04-15 13:10";
		Date date1 =format1.parse(s1); 
		Date date2 =format1.parse(s2);
		System.out.println(date1);
		int day=(int)(date2.getTime()-date1.getTime())/(24*60*60*1000); 
		System.out.println(day);
		System.out.println("2017-04-15 10:01:00.0".length());
	}
}

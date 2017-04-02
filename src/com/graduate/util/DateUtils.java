package com.graduate.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.log4j.Logger;

//import com.ailk.dazzle.common.i18n.DazzleMessage;

/**
 * <P>
 * 时间处理工具，负责处理常见的字符串操作，包括字符串相关的变换、判断与计算等。
 * </p>
 */
public class DateUtils {

	/**
	 * 指定格式化格式：yyyyMMdd
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyyMMdd = 0;

	/**
	 * 指定格式化格式：yyyy-MM-dd
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyy_MM_dd = 1;

	/**
	 * 指定格式化格式：HHmmss
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_HHmmss = 2;

	/**
	 * 指定格式化格式：HH:mm:ss
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_HH_mm_ss = 3;

	/**
	 * 指定格式化格式：HHmmssSSS
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_HHmmssSSS = 4;

	/**
	 * 指定格式化格式：HH:mm:ss.SSS
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_HH_mm_ss_SSS = 5;

	/**
	 * 指定格式化格式：yyyyMMddHHmmss
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyyMMddHHmmss = 6;

	/**
	 * 指定格式化格式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyy_MM_dd_HH_mm_ss = 7;

	/**
	 * 指定格式化格式：yyyyMMddHHmmssSSS
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyyMMddHHmmssSSS = 8;

	/**
	 * 指定格式化格式：yyyy-MM-dd HH:mm:ss.SSS
	 * 
	 * @see com.ailk.dazzle.util.type.DateUtils#date2String(Date, int)
	 * @see com.ailk.dazzle.util.type.DateUtils#string2Date(Date, int)
	 */
	public final static int FORMATTYPE_yyyy_MM_dd_HH_mm_ss_SSS = 9;

	/**
	 * 日志对象
	 */
	private static final Logger log = Logger.getLogger(DateUtils.class);

	/**
	 * 将Date对象转换为日期字符串。
	 * 
	 * @param date
	 *            日期对象
	 * @param formatType
	 *            指定格式:
	 *            <ul>
	 *            <li>0-yyyyMMdd</li>
	 *            <li>1-yyyy-MM-dd</li>
	 *            <li>2-HHmmss</li>
	 *            <li>3-HH:mm:ss</li>
	 *            <li>4-HHmmssSSS</li>
	 *            <li>5-HH:mm:ss.SSS</li>
	 *            <li>6-yyyyMMddHHmmss</li>
	 *            <li>7-yyyy-MM-dd HH:mm:ss</li>
	 *            <li>8-yyyyMMddHHmmssSSS</li>
	 *            <li>9-yyyy-MM-dd HH:mm:ss.SSS</li>
	 *            </ul>
	 * @return 日期字符串
	 * @author miaofc
	 * @date Nov 22, 2011 5:30:32 PM
	 */
	public static String date2String(Date date, int formatType) {
		// 如果日期为null，则直接返回空值
		if (date == null) {
			return "";
		}

		// 格式化字符串数组
		String[] patterns = { "yyyyMMdd", "yyyy-MM-dd", "HHmmss", "HH:mm:ss", "HHmmssSSS", "HH:mm:ss.SSS",
				"yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmssSSS", "yyyy-MM-dd HH:mm:ss.SSS" };
		// 根据选择类型格式化字符串
		SimpleDateFormat format = new SimpleDateFormat(patterns[formatType]);
		return format.format(date);
	}

	/**
	 * 将日期字符串转化为Date对象。
	 * 
	 * @param dateStr
	 * @param formatType
	 *            指定格式:
	 *            <ul>
	 *            <li>0-yyyyMMdd</li>
	 *            <li>1-yyyy-MM-dd</li>
	 *            <li>2-HHmmss</li>
	 *            <li>3-HH:mm:ss</li>
	 *            <li>4-HHmmssSSS</li>
	 *            <li>5-HH:mm:ss.SSS</li>
	 *            <li>6-yyyyMMddHHmmss</li>
	 *            <li>7-yyyy-MM-dd HH:mm:ss</li>
	 *            <li>8-yyyyMMddHHmmssSSS</li>
	 *            <li>9-yyyy-MM-dd HH:mm:ss.SSS</li>
	 *            </ul>
	 * @return Date对象
	 * @throws ParseException
	 * @author miaofc
	 * @date Nov 22, 2011 5:35:27 PM
	 */
	public static Date string2Date(String dateStr, int formatType) throws ParseException {
		// 如果字符串为null，则直接返回null
		if (dateStr == null) {
			return null;
		}

		// 格式化字符串数组
		String[] patterns = { "yyyyMMdd", "yyyy-MM-dd", "HHmmss", "HH:mm:ss", "HHmmssSSS", "HH:mm:ss.SSS",
				"yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmssSSS", "yyyy-MM-dd HH:mm:ss.SSS" };
		// 根据选择类型解析字符串
		SimpleDateFormat format = new SimpleDateFormat(patterns[formatType]);
		return format.parse(dateStr);
	}

	/**
	 * 得到一年中的某一天
	 * 
	 * @param year
	 *            年份
	 * @param ordinal
	 *            第几天，计数从1开始
	 * @return 一年中第ordinal天的Date对象
	 * @author miaofc
	 * @throws ParseException
	 * @date Nov 24, 2011 12:22:57 PM
	 */
	public static Date getDateOfDayInYear(int year, int ordinal) throws ParseException {
		// 计算出该年份第一天
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date firstDay = format.parse(String.valueOf(year));
		// 计算出目标日
		return new Date(firstDay.getTime() + 86400000 * (ordinal - 1));
	}

	/**
	 * 得到季度中的某一天
	 * 
	 * @param year
	 *            年份
	 * @param season
	 *            季度，计数从1开始
	 * @param ordinal
	 *            第几天，计数从1开始
	 * @return 该年份该季度下的第ordinal天的Date对象
	 * @author miaofc
	 * @throws ParseException
	 * @date Nov 24, 2011 12:25:12 PM
	 */
	public static Date getDateOfDayInSeason(int year, int season, int ordinal) throws ParseException {
		// 根据季度，得到季度的起始月份
		String firstMonth = String.valueOf(year);
		switch (season) {
		case 1:
			firstMonth += "01";
			break;
		case 2:
			firstMonth += "04";
			break;
		case 3:
			firstMonth += "07";
			break;
		case 4:
			firstMonth += "10";
			break;
		// 非法的季度数
		default:
			// throw new
			// IllegalArgumentException(DazzleMessage.get("IllegalSeasonNumber",
			// season));
			throw new IllegalArgumentException();
		}
		// 计算出该季度第一天
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		Date firstDay = format.parse(firstMonth);
		// 计算出目标日
		return new Date(firstDay.getTime() + 86400000 * (ordinal - 1));
	}

	/**
	 * 得到月份中的某一天
	 * 
	 * @param year
	 *            年份
	 * @param month
	 *            月份，计数从1开始
	 * @param ordinal
	 *            第几天，计数从1开始
	 * @return 该年份该月份下的第ordinal天的Date对象
	 * @throws ParseException
	 * @author miaofch
	 * @date Feb 8, 2012 3:39:11 PM
	 */
	public static Date getDateOfDayInMonth(int year, int month, int ordinal) throws ParseException {
		String yearStr = String.valueOf(year);
		String monthStr = month > 10 ? String.valueOf(month) : "0" + String.valueOf(month);
		// 计算出该月份第一天
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		Date firstDay = format.parse(yearStr + monthStr);
		// 计算出目标日
		return new Date(firstDay.getTime() + 86400000 * (ordinal - 1));
	}

	/**
	 * 得到一周中的某一天
	 * 
	 * @param someDayInWeek
	 *            周内的任意一天
	 * @param ordinal
	 *            希望得到第几天。计数从1开始，每周从周日开始。
	 * @return 该周内的第ordinal天的Date对象
	 * @author miaofc
	 * @date Nov 24, 2011 12:28:07 PM
	 */
	public static Date getDateOfDayInWeek(Date someDayInWeek, int ordinal) {
		Calendar someDayInWeekC = new GregorianCalendar();
		someDayInWeekC.setTime(someDayInWeek);
		// 计算出当周的首日
		Calendar firstDay = new GregorianCalendar();
		firstDay.set(someDayInWeekC.get(Calendar.YEAR), someDayInWeekC.get(Calendar.MONTH),
				someDayInWeekC.get(Calendar.DATE));
		firstDay.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		// 计算出目标日
		return new Date(firstDay.getTimeInMillis() + 86400000 * (ordinal - 1));
	}

	/**
	 * 求日期是一年中的第几天
	 * 
	 * @param day
	 *            待判断的日期
	 * @return 目标日是第几天。计数从1开始
	 * @author miaofc
	 * @date Nov 25, 2011 2:41:30 PM
	 */
	public static int getOrinalOfDayInYear(Date day) {
		Calendar c = new GregorianCalendar();
		c.setTime(day);
		return c.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 求日期是一个季度中的第几天
	 * 
	 * @param day
	 *            待判断的日期
	 * @return 目标日是第几天。计数从1开始
	 * @author miaofch
	 * @date Feb 16, 2012 10:38:32 AM
	 */
	public static int getOrinalOfDayInSeason(Date day) {
		Calendar c = new GregorianCalendar();
		c.setTime(day);
		// 得到月份，计数从1开始
		int month = c.get(Calendar.MONTH) + 1;
		// 得到年份，计数从1开始
		int year = c.get(Calendar.YEAR);
		// 根据季度的不同，区分计算
		int orinal = 0;
		// 第一季度
		if (1 <= month && month <= 3) {
			for (int i = 1; i < month; i++) {
				orinal += getNumberOfDaysInMonth(year, i);
			}
			orinal += getOrinalOfDayInMonth(day);
		}
		// 第二季度
		else if (4 <= month && month <= 6) {
			for (int i = 4; i < month; i++) {
				orinal += getNumberOfDaysInMonth(year, i);
			}
			orinal += getOrinalOfDayInMonth(day);
		}
		// 第三季度
		else if (7 <= month && month <= 9) {
			for (int i = 7; i < month; i++) {
				orinal += getNumberOfDaysInMonth(year, i);
			}
			orinal += getOrinalOfDayInMonth(day);
		}
		// 第四季度
		else if (10 <= month && month <= 12) {
			for (int i = 10; i < month; i++) {
				orinal += getNumberOfDaysInMonth(year, i);
			}
			orinal += getOrinalOfDayInMonth(day);
		}
		return orinal;
	}

	/**
	 * 求日期是一个月中的第几天
	 * 
	 * @param day
	 *            待判断的日期
	 * @return 目标日是第几天。计数从1开始
	 * @author miaofc
	 * @date Nov 25, 2011 2:41:46 PM
	 */
	public static int getOrinalOfDayInMonth(Date day) {
		Calendar c = new GregorianCalendar();
		c.setTime(day);
		return c.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 求日期是一周中的第几天
	 * 
	 * @param day
	 *            待判断的日期
	 * @return 目标日是第几天。计数从1开始
	 * @author miaofc
	 * @date Nov 25, 2011 2:42:15 PM
	 */
	public static int getOrinalOfDayInWeek(Date day) {
		Calendar c = new GregorianCalendar();
		c.setTime(day);
		return c.get(Calendar.DAY_OF_WEEK);
	}

	/**
	 * 求某一年一共有多少天
	 * 
	 * @param year
	 *            年份
	 * @return 年内一共有多少天
	 * @author miaofc
	 * @date Nov 25, 2011 2:43:23 PM
	 */
	public static int getNumberOfDaysInYear(int year) {
		// 若该年份为闰年，返回366
		if ((year % 100 != 0 && year % 4 == 0) || (year % 400 == 0)) {
			return 366;
		}
		// 普通年份返回365
		return 365;
	}

	/**
	 * 得到某个季度一共有多少天
	 * 
	 * @param someDayInSeanson
	 *            季度内的某一天
	 * @return 季度内一共有多少天
	 * @author miaofch
	 * @date Feb 17, 2012 5:37:09 PM
	 */
	public static int getNumberOfDaysInSeason(Date someDayInSeanson) {
		// 计算日期的所在年和季度
		Calendar c = new GregorianCalendar();
		c.setTime(someDayInSeanson);
		int year = c.get(Calendar.YEAR);
		int season = c.get(Calendar.MONTH) / 3 + 1;
		// 计算季度内共有几天
		return getNumberOfDaysInSeason(year, season);
	}

	/**
	 * 得到某个季度一共有多少天
	 * 
	 * @param year
	 *            年份
	 * @param season
	 *            季度。计数从1开始
	 * @return 季度内一共有多少天
	 * @author miaofch
	 * @date Feb 16, 2012 11:12:06 AM
	 */
	public static int getNumberOfDaysInSeason(int year, int season) {
		// 求季度内的第一个月
		int firstMonth = 0;
		switch (season) {
		case 1:
			firstMonth = 1;
			break;
		case 2:
			firstMonth = 4;
			break;
		case 3:
			firstMonth = 7;
			break;
		case 4:
			firstMonth = 10;
			break;
		// 非法的季度数
		default:
			// throw new
			// IllegalArgumentException(DazzleMessage.get("IllegalSeasonNumber",
			// season));
			throw new IllegalArgumentException();
		}
		// 计算日期总数
		int number = 0;
		for (int i = 0; i < 3; i++) {
			number += getNumberOfDaysInMonth(year, firstMonth + i);
		}
		return number;
	}

	/**
	 * 求某月一共有多少天
	 * 
	 * @param year
	 *            年份
	 * @param month
	 *            月份。从1开始
	 * @return 该月中一共有多少天
	 * @author miaofc
	 * @date Nov 25, 2011 2:43:36 PM
	 */
	public static int getNumberOfDaysInMonth(int year, int month) {
		// 根据日期设置日历实体
		Calendar c = new GregorianCalendar();
		// 日历实体中对于月份的计算从0开始
		c.set(year, month - 1, 1);
		int numberOfDays = c.getActualMaximum(Calendar.DATE);
		return numberOfDays;
	}

	/**
	 * 求当前年份一共有几天
	 * 
	 * @return 当前年份一共有多少天
	 * @author miaofc
	 * @date Nov 25, 2011 2:49:44 PM
	 */
	public static int getNumberOfDaysInCurrentYear() {
		// 设置日历实体，求当前年份
		Calendar c = new GregorianCalendar();
		c.setTimeInMillis(System.currentTimeMillis());
		int year = c.get(Calendar.YEAR);
		// 根据年份求天数
		return getNumberOfDaysInYear(year);
	}

	/**
	 * 求当前月份一共有几天
	 * 
	 * @return 当前月份一共有多少天
	 * @author miaofc
	 * @date Nov 25, 2011 2:49:27 PM
	 */
	public static int getNumberOfDaysInCurrentMonth() {
		// 设置日历实体
		Calendar c = new GregorianCalendar();
		c.setTimeInMillis(System.currentTimeMillis());
		int numberOfDays = c.getActualMaximum(Calendar.DATE);
		return numberOfDays;
	}

	/**
	 * 取得date在域field上偏移amount后的值
	 * 
	 * @param date
	 *            日期
	 * @param field
	 *            要偏移的时间域，如Calendar.YEAR、Calendar.MONTH等
	 * @param amount
	 *            偏移量
	 * @return 偏移后的日期时间
	 * @throws Exception
	 * @author miaofc
	 * @date Nov 22, 2011 5:30:32 PM
	 */
	public static Date dateOffset(Date date, int field, int amount) throws Exception {
		Calendar c = new GregorianCalendar();
		c.setTime(date);

		c.add(field, amount);
		return c.getTime();
	}

	/**
	 * 得到两个时间相差的毫秒数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的毫秒数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:10:03 PM
	 */
	public static long getDiffMillis(Date date1, Date date2) {
		return date1.getTime() - date2.getTime();
	}

	/**
	 * 得到两个时间相差的秒数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的秒数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:10:18 PM
	 */
	public static long getDiffSeconds(Date date1, Date date2) {
		return getDiffMillis(date1, date2) / 1000;
	}

	/**
	 * 得到两个时间相差的分钟数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的分钟数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:10:29 PM
	 */
	public static long getDiffMinutes(Date date1, Date date2) {
		return getDiffSeconds(date1, date2) / 60;
	}

	/**
	 * 得到两个时间相差的小时数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的小时数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:10:44 PM
	 */
	public static long getDiffHours(Date date1, Date date2) {
		return getDiffMinutes(date1, date2) / 60;
	}

	/**
	 * 得到两个时间相差的天数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的天数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:11:01 PM
	 */
	public static long getDiffDays(Date date1, Date date2) {
		return getDiffHours(date1, date2) / 24;
	}

	/**
	 * 得到两个时间相差的月数，每月天数认为是30天。
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的月数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:11:15 PM
	 */
	public static long getDiffMonths(Date date1, Date date2) {
		return getDiffDays(date1, date2) / 30;
	}

	/**
	 * 得到两个时间相差的自然月数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的自然月数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 28, 2011 2:43:34 PM
	 */
	public static int getDiffNaturalMonth(Date date1, Date date2) {
		Calendar calendar1 = new GregorianCalendar();
		calendar1.setTime(date1);
		Calendar calendar2 = new GregorianCalendar();
		calendar2.setTime(date2);
		int mouth1 = calendar1.get(Calendar.MONTH) + 1;
		int mouth2 = calendar2.get(Calendar.MONTH) + 1;
		return getDiffYears(date1, date2) * 12 - (mouth2 - mouth1);
	}

	/**
	 * 得到两个时间相差的年数
	 * 
	 * @param date1
	 *            时间1
	 * @param date2
	 *            时间2
	 * @return 两个时间之间相差的年数。计算顺序为date1-date2
	 * @author miaofc
	 * @date Nov 24, 2011 1:11:27 PM
	 */
	public static int getDiffYears(Date date1, Date date2) {
		Calendar calendar1 = new GregorianCalendar();
		calendar1.setTime(date1);
		Calendar calendar2 = new GregorianCalendar();
		calendar2.setTime(date2);
		int year1 = calendar1.get(Calendar.YEAR);
		int year2 = calendar2.get(Calendar.YEAR);
		return year1 - year2;
	}

	/**
	 * 时间戳字符串返回时间格式
	 * 
	 * @param stampString
	 *            时间戳字符串
	 * @return
	 */
	public static Date timeStampString2Date(String stampString) {
		Timestamp ts = new Timestamp(Long.valueOf(stampString));
		Date date = new Date();
		try {
			date = ts;
			return date;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public static void main(String[] args) throws ParseException {
		System.out.println(date2String(string2Date("1423756800000", 2), 9));
		System.out.println(date2String(timeStampString2Date("1423756800000"), 1));

	}

	/**
	 * 计算一周前日期
	 * 
	 * @return
	 */
	public static String getStartDate(Date date) {
		int year = Integer.parseInt(new SimpleDateFormat("yyyy").format(date));
		int month = Integer.parseInt(new SimpleDateFormat("MM").format(date));
		int day = Integer.parseInt(new SimpleDateFormat("dd").format(date)) - 7;
		if (day < 1) {
			month -= 1;
			if (month == 0) {
				year -= 1;
				month = 12;
			}
			if (month == 4 || month == 6 || month == 9 || month == 11) {
				day = 30 + day;
			} else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10
					|| month == 12) {
				day = 31 + day;
			} else if (month == 2) {
				if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
					day = 29 + day;
				else
					day = 28 + day;
			}
		}
		String y = year + "";
		String m = "";
		String d = "";
		if (month < 10)
			m = "0" + month;
		else
			m = month + "";
		if (day < 10)
			d = "0" + day;
		else
			d = day + "";
		String dateStart = y + "-" + m + "-" + d;
		return dateStart;
	}
}

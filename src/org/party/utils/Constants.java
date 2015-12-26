package org.party.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Constants {
	//存在session中的用户名的key
	public static String USER_SESSION_NAME = "userName";
	
	//默认日期
	public static java.sql.Date DEFAULT_DATE = java.sql.Date.valueOf("1900-01-01");
	
	//用户权限
	public static Integer COMMEN = 0;
	public static Integer MANAGER = 1;
	public static Integer ROOT = 2;
	
	//用户身份状态 User的status字段 和 next_status字段
	public static List<String> STATUS_DESC = Arrays.asList("申请入党", "积极分子", "发展对象", "预备党员", "正式党员", "已转出");
	public static Integer STATUS_APPLY = 0;
	public static Integer STATUS_CAN_NOT = 0;//不可转
	public static Integer STATUS_ACTIVIST = 1;
	public static Integer STATUS_TARGET = 2;
	public static Integer STATUS_PROBATIONARY = 3;
	public static Integer STATUS_FULL_MEMBER = 4;
	public static Integer STATUS_OUT = 5;
	
	//材料完整性
	public static Integer IS_COMPLETE_YES = 1;
	public static Integer IS_COMPLETE_NO = 0;
	
	//导入数据xls中 各个值 对应列下标
	//User部分
	public static Integer NAME = 1;
	public static Integer STUDENT_ID = 2;
	public static Integer GENDER = 3;
	public static Integer UCLASS = 4;
	public static Integer ORIGO = 5;
	public static Integer NATION = 6;
	public static Integer BIRTHDAY = 7;
	public static Integer DORMITORY = 8;
	public static Integer TELEPHONE = 9;
	public static Integer STATUS = 10;
	public static Integer APPLY_DATE = 11;
	public static Integer BE_ACTIVIST_DATE = 12;
	public static Integer BE_PASS_PARTY_CLASS_DATE = 13;
	public static Integer BE_TARGET_DATE = 14;
	public static Integer BE_PROBATIONARY_DATE = 15;
	public static Integer BE_FULL_MEMBER_DATE = 16;
	public static Integer JOB = 17;
	//Commit部分
	public static Integer RU_DANG_SHEN_QING_SHU = 18;
	public static Integer JI_JI_FEN_ZI_KAO_CHA_BIAO = 19;
	public static Integer ZI_ZHUAN = 20;
	public static Integer SI_XIANG_HUI_BAO = 21;
	public static Integer ZHENG_SHEN_CAI_LIAO = 22;
	public static Integer ZHENG_SHEN_BAO_GAO = 23;
	public static Integer QUN_ZHONG_YI_JIAN = 24;
	public static Integer DANG_KE_JIE_YE_ZHENG = 25;
	public static Integer TUI_YOU_RU_DANG = 26;
	public static Integer FA_ZHAN_DA_HUI_JUE_YI = 27;
	public static Integer FA_ZHAN_DANG_YUAN_GONG_SHI = 28;
	public static Integer RU_DANG_ZHI_YUAN_SHU = 29;
	public static Integer BAN_QI_ZONG_JIE = 30;
	public static Integer QUAN_NIAN_ZONG_JIE = 31;
	public static Integer ZHUAN_ZHENG_SHEN_QING = 32;
	public static Integer ZHUAN_ZHENG_GONG_SHI = 33;
	public static Integer YU_BEI_DANG_YUAN_KAO_CHA_BIAO = 34;
}

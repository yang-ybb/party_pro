package org.party.domain;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.party.persistence.DaoConfig;
import org.party.persistence.UserSql;

public class Commit {
	private String notice = "";
	
	/*
	 * 保存对commit的更新
	 */
	public boolean saveUpdate() {
		SqlSession session = DaoConfig.getNewSession();
		boolean result = true;
		try {
			UserSql.updateCommit(session, this);
			session.commit();
		}
		catch (Exception e) {
			//todo: 添加日志
			result = false;
			session.rollback();
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 根据UserId获取档案信息
	 */
	public static Commit findCommitByUserId(Integer id) {
		SqlSession session = DaoConfig.getNewSession();
		Commit result = null;
		try {
			result = UserSql.getCommitByUserId(session, id);
		}
		catch (Exception e) {
			//todo: 添加日志
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 获取档案信息提示消息
	 */
	public String getNotice() {
		switch(getUser().getStatus()) {
			case 0 :
				notice = checkBasicCommitOfShenqingrudang();
				break;
			case 1 :
				notice = checkBasicCommitOfJijifenzi();
				break;
			case 2 :
				notice = checkBasicCommitOfFazhanduixiang();
				break;
			case 3 :
				notice = checkBasicCommitOfYubeidangyuan();
				break;
			case 4 : notice = ""; break;
		}
		if(notice == "") {
			notice = "无";
		}
		return notice;
	}
	
	/*
	 * 申请入党，档案信息检查
	 */
	private String checkBasicCommitOfShenqingrudang() {
		String result = "";
		result += checkDataCount(rudangshenqingshu, 1, "入党申请书");
		result += checkDataCount(tuiyourudang, 1, "推优入党材料");
		return result;
	}
	
	/*
	 * 积极分子，档案信息检查
	 */
	private String checkBasicCommitOfJijifenzi() {
		String result = "";
		result += checkDataCount(jijifenzikaochabiao, 1, "积极分子考察表");
		Date beginDate = new Date(getUser().getBe_activist_date().toString());
		result += checkDataCount(sixianghuibao, countMonthDiffFromNow(beginDate)/3, "思想汇报");
		return result;
	}
	
	/*
	 * 发展对象，档案信息检查
	 */
	private String checkBasicCommitOfFazhanduixiang() {
		String result = "";
		Date beginDate = new Date(getUser().getBe_activist_date().toString());
		result +=  checkDataCount(sixianghuibao, countMonthDiffFromNow(beginDate)/3, "思想汇报");
		return result;
	}
	
	/*
	 * 预备党员，档案信息检查
	 */
	private String checkBasicCommitOfYubeidangyuan() {
		String result = "";
		result += checkDataCount(yubeidangyuankaochabiao, 1, "预备党员考察表");
		Date beActivistDate = getUser().getBe_activist_date();
		result += (checkDataCount(sixianghuibao + banqizongjie + quannianzongjie, countMonthDiffFromNow(beActivistDate)/3, "思想汇报"));
		return result;
	}
	
	/*
	 * ==== 描述
	 *   判断材料缺几份，生成提示信息
	 * 
	 * ==== 参数
	 * 	dataCount：现有材料份数
	 *  expectCount：期望的材料份数
	 *  info：当前材料名字
	 * 
	 * ==== 返回值
	 *  字符串，如：缺3份思想汇报
	 */
	private String checkDataCount(Integer dataCount, Integer expectCount, String info) {
		if(expectCount <= dataCount) {
			return "";
		}
		else {
			return "缺" + (expectCount - dataCount) + "份" + info;
		}
	}
	
	private Integer countMonthDiffFromNow(Date beginDate) {
		Date now = new Date();
		int result = 0;
		result += (now.getYear() - beginDate.getYear())*12;
		result -= beginDate.getMonth();
		result += now.getMonth();
		if(now.getDay() < beginDate.getDay()) {
			result -= 1;
		}
		return result;
	}
	
	public User getUser() {
		return User.findById(uid);
	}
	
    public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getRudangshenqingshu() {
		return rudangshenqingshu;
	}
	public void setRudangshenqingshu(Integer rudangshenqingshu) {
		this.rudangshenqingshu = rudangshenqingshu;
	}
	public Integer getJijifenzikaochabiao() {
		return jijifenzikaochabiao;
	}
	public void setJijifenzikaochabiao(Integer jijifenzikaochabiao) {
		this.jijifenzikaochabiao = jijifenzikaochabiao;
	}
	public Integer getZizhuan() {
		return zizhuan;
	}
	public void setZizhuan(Integer zizhuan) {
		this.zizhuan = zizhuan;
	}
	public Integer getSixianghuibao() {
		return sixianghuibao;
	}
	public void setSixianghuibao(Integer sixianghuibao) {
		this.sixianghuibao = sixianghuibao;
	}
	public Integer getZhengshencailiao() {
		return zhengshencailiao;
	}
	public void setZhengshencailiao(Integer zhengshencailiao) {
		this.zhengshencailiao = zhengshencailiao;
	}
	public Integer getZhengshenbaogao() {
		return zhengshenbaogao;
	}
	public void setZhengshenbaogao(Integer zhengshenbaogao) {
		this.zhengshenbaogao = zhengshenbaogao;
	}
	public Integer getQunzhongyijian() {
		return qunzhongyijian;
	}
	public void setQunzhongyijian(Integer qunzhongyijian) {
		this.qunzhongyijian = qunzhongyijian;
	}
	public Integer getDangxiaojieyezheng() {
		return dangxiaojieyezheng;
	}
	public void setDangxiaojieyezheng(Integer dangxiaojieyezheng) {
		this.dangxiaojieyezheng = dangxiaojieyezheng;
	}
	public Integer getTuiyourudang() {
		return tuiyourudang;
	}
	public void setTuiyourudang(Integer tuiyourudang) {
		this.tuiyourudang = tuiyourudang;
	}
	public Integer getZhibudahuijilu() {
		return zhibudahuijilu;
	}
	public void setZhibudahuijilu(Integer zhibudahuijilu) {
		this.zhibudahuijilu = zhibudahuijilu;
	}
	public Integer getFazhandangyuangongshi() {
		return fazhandangyuangongshi;
	}
	public void setFazhandangyuangongshi(Integer fazhandangyuangongshi) {
		this.fazhandangyuangongshi = fazhandangyuangongshi;
	}
	public Integer getRudangzhiyuanshu() {
		return rudangzhiyuanshu;
	}
	public void setRudangzhiyuanshu(Integer rudangzhiyuanshu) {
		this.rudangzhiyuanshu = rudangzhiyuanshu;
	}
	public Integer getBanqizongjie() {
		return banqizongjie;
	}
	public void setBanqizongjie(Integer banqizongjie) {
		this.banqizongjie = banqizongjie;
	}
	public Integer getQuannianzongjie() {
		return quannianzongjie;
	}
	public void setQuannianzongjie(Integer quannianzongjie) {
		this.quannianzongjie = quannianzongjie;
	}
	public Integer getZhuanzhengshenqing() {
		return zhuanzhengshenqing;
	}
	public void setZhuanzhengshenqing(Integer zhuanzhengshenqing) {
		this.zhuanzhengshenqing = zhuanzhengshenqing;
	}
	public Integer getYubeidangyuankaochabiao() {
		return yubeidangyuankaochabiao;
	}
	public void setYubeidangyuankaochabiao(Integer yubeidangyuankaochabiao) {
		this.yubeidangyuankaochabiao = yubeidangyuankaochabiao;
	}
	public Integer getZhuanzhenggongshi() {
		return zhuanzhenggongshi;
	}
	public void setZhuanzhenggongshi(Integer zhuanzhenggongshi) {
		this.zhuanzhenggongshi = zhuanzhenggongshi;
	}
	private Integer uid;
    private Integer rudangshenqingshu;
    private Integer jijifenzikaochabiao;
    private Integer zizhuan;
    private Integer sixianghuibao;
    private Integer zhengshencailiao;
    private Integer zhengshenbaogao;
    private Integer qunzhongyijian;
    private Integer dangxiaojieyezheng;
    private Integer tuiyourudang;
    private Integer zhibudahuijilu;
    private Integer fazhandangyuangongshi;
    private Integer rudangzhiyuanshu;
    private Integer banqizongjie;
    private Integer quannianzongjie;
    private Integer zhuanzhengshenqing;
    private Integer yubeidangyuankaochabiao;
    private Integer zhuanzhenggongshi;
}

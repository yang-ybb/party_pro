package org.party.domain;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.party.persistence.DaoConfig;
import org.party.persistence.UserSql;

public class User {
	public static User currentUser = null;
	
	public static boolean verifyLogin(String studentId, String password) {
		User user = new User();
		user.setStudentid(studentId);
		user.setPasswd(password);
		boolean result = false;
		SqlSession session = DaoConfig.getNewSession();
		try {
			result = UserSql.checkUser(session, user);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return result;
	}
	
	/*
	 * 通过studentId获取User
	 */
	public static User findByStudentId(String studentId) {
		SqlSession session = DaoConfig.getNewSession();
		User user = null;
		try {
			PairObjObj pair = new PairObjObj();
			pair.setFirst("studentid");
			pair.setSecond(studentId);
			user = UserSql.getUserByAttribute(session, pair).get(0);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return user;
	}
	
	public static boolean setCurrentUser(String studentId, String password) throws Exception {
		boolean checkResult = User.verifyLogin(studentId, password);
		if(checkResult) {
			currentUser = User.findByStudentId(studentId);
			return true;
		}
		return false;
	}
	
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPartybranchid() {
		return partybranchid;
	}
	public void setPartybranchid(Integer partybranchid) {
		this.partybranchid = partybranchid;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getDormitory() {
		return dormitory;
	}
	public void setDormitory(String dormitory) {
		this.dormitory = dormitory;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getUclass() {
		return uclass;
	}
	public void setUclass(String uclass) {
		this.uclass = uclass;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getOrigo() {
		return origo;
	}
	public void setOrigo(String origo) {
		this.origo = origo;
	}
	public Integer getPermission() {
		return permission;
	}
	public void setPermission(Integer permission) {
		this.permission = permission;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIs_complete() {
		return is_complete;
	}
	public void setIs_complete(Integer is_complete) {
		this.is_complete = is_complete;
	}
	public Date getBe_passpartyclass_date() {
		return be_passpartyclass_date;
	}
	public void setBe_passpartyclass_date(Date be_passpartyclass_date) {
		this.be_passpartyclass_date = be_passpartyclass_date;
	}
	public Date getBe_activist_date() {
		return be_activist_date;
	}
	public void setBe_activist_date(Date be_activist_date) {
		this.be_activist_date = be_activist_date;
	}
	public Date getBe_target_date() {
		return be_target_date;
	}
	public void setBe_target_date(Date be_target_date) {
		this.be_target_date = be_target_date;
	}
	public Date getBe_probationary_date() {
		return be_probationary_date;
	}
	public void setBe_probationary_date(Date be_probationary_date) {
		this.be_probationary_date = be_probationary_date;
	}
	public Date getBe_fullmember_date() {
		return be_fullmember_date;
	}
	public void setBe_fullmember_date(Date be_fullmember_date) {
		this.be_fullmember_date = be_fullmember_date;
	}
	private Integer id;
    private String studentid;
    private String name;
    private Integer partybranchid;
    private Date birthday;
    private String dormitory;
    private String passwd;
    private String telephone;
    private String uclass;
    private String gender;
    private String nation;
    private Date applydate;
    private String job;
    private String origo;
    private Integer permission;
    private Integer status;
    private Integer is_complete;
    private Date be_passpartyclass_date;
    private Date be_activist_date;
    private Date be_target_date;
    private Date be_probationary_date;
    private Date be_fullmember_date;
}

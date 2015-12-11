package org.party.domain;

import java.sql.Date;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.party.persistence.DaoConfig;
import org.party.persistence.UserSql;

public class User {
	public static User currentUser = null;
	
	/*
	 * 获取用户对应的临时表数据
	 */
	public User getTmpUser() {
		SqlSession session = DaoConfig.getNewSession();
		User tmpUser = null;
		try {
			tmpUser = UserSql.getUpdateById(session, id);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return tmpUser;
	}
	
	/*
	 * 更新密码
	 */
	public boolean updatePassword(String oldPassword, String newPassword, String confirmPassword) {
		boolean result = false;
		if (newPassword.equals(confirmPassword) && User.verifyLogin(currentUser.getStudentid(), oldPassword)) {
			SqlSession session = DaoConfig.getNewSession();
			try {
				this.passwd = newPassword;
				UserSql.updatePasswd(session, this);
				session.commit();
				result = true;
			}
			catch(Exception e) {
				//todo: 添加log
				session.rollback();
				result = false;
				e.printStackTrace();
			}
			finally {
				session.close();
			}
		}
		return result;
	}
	
	/*
	 * ==== Description
	 *   普通用户提交更新
	 * 
	 * ==== Returns
	 *   true | false 成功 失败
	 */
	public boolean updateAttributesToTemp() {
		SqlSession session = DaoConfig.getNewSession();
		boolean result = true;
		try {
			UserSql.commitUpdateInfos(session, this);
			session.commit();
		}
		catch(Exception e) {
			//todo: 添加log
			session.rollback();
			result = false;
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return result;
	}
	
	/*
	 * 登录验证
	 */
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
	 * 通过id获取User
	 */
	public static User findById(Integer id) {
		User result = null;
		User attributes = new User();
		attributes.setId(id);
		List<User> users = User.findUsersByCondition(attributes);
		if (users.size() > 0) {
			result = users.get(0);
		}
		return result;
	}
	
	/*
	 * 通过studentId获取User
	 */
	public static User findByStudentId(String studentId) {
		User result = null;
		User attributes = new User();
		attributes.setStudentid(studentId);
		List<User> users = User.findUsersByCondition(attributes);
		if (users.size() > 0) {
			result = users.get(0);
		}
		return result;
	}
	
	/*
	 * ==== 描述
	 *   设置当前登录的用户
	 *   需要校验通过才能设置
	 * ==== 参数
	 *   学号，密码
	 * ==== 返回
	 *   true | false 成功 失败
	 */
	public static boolean setCurrentUser(String studentId, String password) throws Exception {
		boolean checkResult = User.verifyLogin(studentId, password);
		if(checkResult) {
			currentUser = User.findByStudentId(studentId);
			return true;
		}
		return false;
	}
	
	/*
	 * ==== 描述
	 *   通过条件获取用户
	 * ==== 参数
	 *   condition：已经初始化条件的User类实例
	 * ==== 返回
	 *   List<User>
	 */
	public static List<User> findUsersByCondition(User condition) {
		SqlSession session = DaoConfig.getNewSession();
		List<User> users = null;
		try {
			users = UserSql.getUsersByAttributes(session, condition);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		if(users == null) {
			users = new ArrayList<User>();
		}
		
		return users;
	}
	
	/*
	 * 获取该对象对应的档案信息
	 */
	public Commit getCommit() {
		SqlSession session = DaoConfig.getNewSession();
		Commit result = null;
		try {
			result = UserSql.getCommit(session, this);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 获取申请入党时间
	 */
	public String getTransApplydate() {
		return getTransDate(applydate);
	}
	/*
	 * 获取成为积极分子时间
	 */
	public String getTransBe_activist_date() {
		return getTransDate(be_activist_date);
	}
	/*
	 * 获取通过党课时间
	 */
	public String getTransBe_passpartyclass_date() {
		return getTransDate(be_passpartyclass_date);
	}
	/*
	 * 获取成为发展对象
	 */
	public String getTransBe_target_date() {
		return getTransDate(be_target_date);
	}
	/*
	 * 获取成为预备党员
	 */
	public String getTransBe_probationary_date() {
		return getTransDate(be_probationary_date);
	}
	/*
	 * 获取成为正式党员
	 */
	public String getTransBe_fullmember_date() {
		return getTransDate(be_fullmember_date);
	}
	
	/*
	 * 获取经过转换的时间
	 */
	public String getTransDate(Date date) {
		if(date == null || date.before(Date.valueOf("1920-01-01"))) {
			return "无";
		}
		else {
			return date.toString();
		}
	}

	
	/*
	 * 获取所有的培养联系人名字和电话
	 * 
	 * 返回例子："张三（18800000000）李四（12200000000）"
	 */
	public String getIntrosNameAndTelephone() {
		List<User> intros = getIntros();
		String result = "";
		if(intros != null) {
			for(User user : intros) {
				result += (user.getName() + "(" + user.getTelephone() + ")");
			}
		}
		return result;
	}
	
	/*
	 * 获取所有的培养联系人
	 */
	public List<User> getIntros() {
		SqlSession session = DaoConfig.getNewSession();
		List<User> result = null;
		try {
			result = UserSql.getIntroListById(session, id);
		}
		catch(Exception e) {
			//todo: 添加log
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 获取党支部名称
	 */
	public String getPartyBranchName() {
		PartyBranch pb = getPartyBranch();
		if(pb != null) {
			return pb.getPartybranchname();
		}
		return "";
	}
	
	/*
	 * 获取党支部
	 */
	public PartyBranch getPartyBranch() {
		return PartyBranch.getPartyBranchById(partybranchid);
	}
	
	/*
	 * 获取当前状态名字
	 */
	public String getStatusName() {
		return statusName(status);
	}
	
	/*
	 * 获取可转状态名字
	 */
	public String getNextStatusName() {
		if(next_status == 0) {
			return "不可转";
		}
		else {
			return statusName(next_status);
		}
	}
	
	/*
	 * 配置每个状态的名字
	 */
	private String statusName(Integer status) {
		String result = "";
		switch(status) {
			case 0 : result = "申请入党"; break;
			case 1 : result = "积极分子"; break;
			case 2 : result = "发展对象"; break;
			case 3 : result = "预备党员"; break;
			case 4 : result = "正式党员"; break;
		}
		return result;
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
    private Integer next_status;
    private Integer is_complete;
    private Date be_passpartyclass_date;
    private Date be_activist_date;
    private Date be_target_date;
    private Date be_probationary_date;
    private Date be_fullmember_date;
    
    /*
     * 为搜索配置的变量
     */
    private Date applydate_begin;
    private Date applydate_end;
    private Date be_passpartyclass_date_begin;
    private Date be_passpartyclass_date_end;
    private Date be_activist_date_begin;
    private Date be_activist_date_end;
    private Date be_probationary_date_begin;
    private Date be_probationary_date_end;
    private Date be_fullmember_date_begin;
    private Date be_fullmember_date_end;

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

	public Integer getNext_status() {
		return next_status;
	}

	public void setNext_status(Integer next_status) {
		this.next_status = next_status;
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

	public Date getApplydate_begin() {
		return applydate_begin;
	}

	public void setApplydate_begin(Date applydate_begin) {
		this.applydate_begin = applydate_begin;
	}

	public Date getApplydate_end() {
		return applydate_end;
	}

	public void setApplydate_end(Date applydate_end) {
		this.applydate_end = applydate_end;
	}

	public Date getBe_passpartyclass_date_begin() {
		return be_passpartyclass_date_begin;
	}

	public void setBe_passpartyclass_date_begin(Date be_passpartyclass_date_begin) {
		this.be_passpartyclass_date_begin = be_passpartyclass_date_begin;
	}

	public Date getBe_passpartyclass_date_end() {
		return be_passpartyclass_date_end;
	}

	public void setBe_passpartyclass_date_end(Date be_passpartyclass_date_end) {
		this.be_passpartyclass_date_end = be_passpartyclass_date_end;
	}

	public Date getBe_activist_date_begin() {
		return be_activist_date_begin;
	}

	public void setBe_activist_date_begin(Date be_activist_date_begin) {
		this.be_activist_date_begin = be_activist_date_begin;
	}

	public Date getBe_activist_date_end() {
		return be_activist_date_end;
	}

	public void setBe_activist_date_end(Date be_activist_date_end) {
		this.be_activist_date_end = be_activist_date_end;
	}

	public Date getBe_probationary_date_begin() {
		return be_probationary_date_begin;
	}

	public void setBe_probationary_date_begin(Date be_probationary_date_begin) {
		this.be_probationary_date_begin = be_probationary_date_begin;
	}

	public Date getBe_probationary_date_end() {
		return be_probationary_date_end;
	}

	public void setBe_probationary_date_end(Date be_probationary_date_end) {
		this.be_probationary_date_end = be_probationary_date_end;
	}

	public Date getBe_fullmember_date_begin() {
		return be_fullmember_date_begin;
	}

	public void setBe_fullmember_date_begin(Date be_fullmember_date_begin) {
		this.be_fullmember_date_begin = be_fullmember_date_begin;
	}

	public Date getBe_fullmember_date_end() {
		return be_fullmember_date_end;
	}

	public void setBe_fullmember_date_end(Date be_fullmember_date_end) {
		this.be_fullmember_date_end = be_fullmember_date_end;
	}
}

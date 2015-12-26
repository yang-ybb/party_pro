package org.party.action;

import java.sql.Date;

import org.party.domain.*;
import org.party.action.*;
import org.party.utils.*;

public class ManageUserAction extends GenericAction {
	
	private User currentUser;
	
	private User user;
	private User tmpUser;
	private Commit commit;
	
	private Integer id;
	
	private Integer currentUserId;
	private Integer updateUserId;
	private Integer type;
	
	private String message;
	
	/*
	 *   查看和管理个人页
	 *   
	 * ==== URL
	 *   GET manageUser
	 * 
	 * ==== Params
	 *   id: 用户的id
	 */
	public String manageUser() throws Exception {
		currentUser = currentUser();
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		else {
			user = User.findById(id);
			commit = user.getCommit();
			if(currentUser.getPermission() == 2 || currentUser.getPartybranchid() == user.getPartybranchid()) {
				return "success";
			}
			else {
				return "error";
			}
		}
	}
	
	/*
	 *   用户资料修改审核页
	 *   
	 * ==== URL
	 *   GET manageUserChangeCheck
	 *   
	 * ==== Params
	 *   id
	 */
	public String manageUserChangeCheck() {
		currentUser = currentUser();
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		else {
			user = User.findById(id);
			tmpUser = user.getTmpUser();
			if(currentUser.getPermission() == 2 || currentUser.getPartybranchid() == user.getPartybranchid()) {
				return "success";
			}
			else {
				return "error";
			}
		}
	}
	
	/*
	 *   通过/不通过用户资料修改审核
	 *   
	 * ==== URL
	 *   POST checkUserChange
	 *   
	 * ==== Params
	 *   currentUserId: 当前用户id
	 *   updateUserId: 需要修改的用户id
	 *   type: 1通过，0不通过
	 */
	public String checkUserChange() throws Exception {
		currentUser = currentUser();
		if(currentUserId == null || currentUser == null ||
		   currentUser.getId() != currentUserId || currentUser.getPermission() < 1 ) {
			return "error";
		}
		else {
			user = User.findById(updateUserId);
			if (currentUser.getPermission() == 1 && currentUser.getPartybranchid() != user.getPartybranchid()) {
				return "error";
			}
			else {
				if ((type == 0 || type == 1) &&User.checkUserChange(updateUserId, type)) {
					return "success";
				}
				else {
					message = "审核失败，请重试！";
					tmpUser = user.getTmpUser();
					return "false";
				}
			}
		}
	}
	
	/*
	 *   管理员修改用户基本信息
	 *   
	 * ==== URL
	 *   GET manageUserInfoEdit
	 *   
	 * ==== Params
	 *   id
	 */
	public String manageUserInfoEdit() throws Exception {
		currentUser = currentUser();
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		else {
			user = User.findById(id);
			if(currentUser.getPermission() == 2 || currentUser.getPartybranchid() == user.getPartybranchid()) {
				return "success";
			}
			else {
				return "error";
			}
		}
	}
	
	/*
	 *   管理员更新用户基本信息
	 *   
	 * ==== URL
	 *   POST manageUserInfoUpdate
	 *   
	 * ==== Params
	 *   currentUserId: 操作者的id
	 *   updateUserId: 修改的用户的id
	 *   其他修改的参数
	 */
	public String manageUserInfoUpdate() throws Exception {
		currentUser = currentUser();
		if(currentUserId == null || currentUser == null ||
		   currentUser.getId() != currentUserId || currentUser.getPermission() < 1 ) {
			return "error";
		}
		else {
			user = User.findById(updateUserId);
			if (currentUser.getPermission() == 1 && currentUser.getPartybranchid() != user.getPartybranchid()) {
				return "error";
			}
			else {
				user = generateUpdateInfoUser(user);
				if (user.saveUpdate(intro1, intro2)) {
					return "success";
				}
				else {
					id = updateUserId;
					message = "修改失败，请重试！";
					return "false";
				}
			}
		}
	}
	
	/*
	 *   管理员修改用户档案信息
	 *   
	 * ==== URL
	 *   GET manageUserCommitEdit
	 *   
	 * ==== Params
	 *   id
	 */
	public String manageUserCommitEdit() throws Exception {
		currentUser = currentUser();
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		else {
			user = User.findById(id);
			if(currentUser.getPermission() == 2 || currentUser.getPartybranchid() == user.getPartybranchid()) {
				commit = Commit.findCommitByUserId(id);
				return "success";
			}
			else {
				return "error";
			}
		}
	}
	
	/*
	 *   管理员更新用户档案信息
	 *   
	 * ==== URL
	 *   POST manageUserCommitUpdate
	 *   
	 * ==== Params
	 *   currentUserId: 操作者的id
	 *   updateUserId: 修改的用户的id
	 *   其他修改的参数
	 */
	public String manageUserCommitUpdate() throws Exception {
		currentUser = currentUser();
		if(currentUserId == null || currentUser == null ||
		   currentUser.getId() != currentUserId || currentUser.getPermission() < 1 ) {
			return "error";
		}
		else {
			user = User.findById(updateUserId);
			if (currentUser.getPermission() == 1 && currentUser.getPartybranchid() != user.getPartybranchid()) {
				return "error";
			}
			else {
				commit = Commit.findCommitByUserId(updateUserId);
				commit = generateUpdateCommit(commit);
				if (commit.saveUpdate()) {
					return "success";
				}
				else {
					id = updateUserId;
					message = "修改失败，请重试！";
					return "false";
				}
			}
		}
	}
	
	/*
	 *   管理员添加用户页
	 *   
	 * ==== URL
	 *   GET manageUserAdd
	 */
	public String manageUserAdd() throws Exception {
		currentUser = currentUser();
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		else {
			return "success";
		}
	}
	
	/*
	 *   管理员创建一个用户
	 *   
	 * ==== URL
	 *   POST manageUserCreate
	 *   
	 * ==== Params
	 *   currentUserId: 操作者的id
	 *   其他创建的参数
	 */
	public String manageUserCreate() throws Exception {
		currentUser = currentUser();
		if(currentUserId == null || currentUser == null ||
		   currentUser.getId() != currentUserId || currentUser.getPermission() < 1 ) {
			return "error";
		}
		else {
			if(User.findByStudentId(studentid) != null) {
				message = "该学号已经存在。";
				return "false";
			}
			User addUser = generateCreateUserInfo(new User());
			addUser.setPartybranchid(partybranchid);
			Commit addCommit = generateCreateCommit(new Commit());
			if(addUser.validate() && User.createUser(addUser, addCommit)) {
				addUser = User.findByStudentId(studentid);
				if (addUser != null) {
					id = addUser.getId();
					return "success";
				}
				else {
					message = "创建失败，请联系管理员。";
					return "false";
				}
			}
			else {
				message = addUser.getErrors().toArray().toString();
				return "false";
			}
		}
	}
	
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
	
	/*
	 * 将档案信息修改的参数更新到实例对象
	 */
	private Commit generateUpdateCommit(Commit updateCommit) {
		updateCommit.setRudangshenqingshu(rudangshenqingshu);
		updateCommit.setJijifenzikaochabiao(jijifenzikaochabiao);
		updateCommit.setZizhuan(zizhuan);
		updateCommit.setSixianghuibao(sixianghuibao);
		updateCommit.setZhengshencailiao(zhengshencailiao);
		updateCommit.setZhengshenbaogao(zhengshenbaogao);
		updateCommit.setQunzhongyijian(qunzhongyijian);
		updateCommit.setDangxiaojieyezheng(dangxiaojieyezheng);
		updateCommit.setTuiyourudang(tuiyourudang);
		updateCommit.setZhibudahuijilu(zhibudahuijilu);
		updateCommit.setFazhandangyuangongshi(fazhandangyuangongshi);
		updateCommit.setRudangzhiyuanshu(rudangzhiyuanshu);
		updateCommit.setBanqizongjie(banqizongjie);
		updateCommit.setQuannianzongjie(quannianzongjie);
		updateCommit.setZhuanzhengshenqing(zhuanzhengshenqing);
		updateCommit.setYubeidangyuankaochabiao(yubeidangyuankaochabiao);
		updateCommit.setZhuanzhenggongshi(zhuanzhenggongshi);
		return updateCommit;
	}
	
	private Commit generateCreateCommit(Commit createCommit) {
		generateUpdateCommit(createCommit);
		return createCommit;
	}
	
	private String studentid;
    private String name;
    private Integer partybranchid;
    private Date birthday;
    private String dormitory;
    private String telephone;
    private String uclass;
    private String gender;
    private String nation;
    private Date applydate;
    private String job;
    private String origo;
    private Date be_passpartyclass_date;
    private Date be_activist_date;
    private Date be_target_date;
    private Date be_probationary_date;
    private Date be_fullmember_date;
    private Integer intro1;
    private Integer intro2;
	
	/*
	 * 将用户基本信息修改的参数更新到实例对象
	 */
	private User generateUpdateInfoUser(User updateInfoUser) {
		updateInfoUser.setName(name);
		updateInfoUser.setStudentid(studentid);
		updateInfoUser.setUclass(uclass);
		updateInfoUser.setOrigo(origo);
		updateInfoUser.setGender(gender);
		updateInfoUser.setNation(nation);
		updateInfoUser.setBirthday(birthday);
		updateInfoUser.setDormitory(dormitory);
		updateInfoUser.setTelephone(telephone);
		updateInfoUser.setApplydate(applydate);
		if (be_activist_date != null) {
			updateInfoUser.setBe_activist_date(be_activist_date);
		}
		if (be_activist_date != null) {
			updateInfoUser.setBe_passpartyclass_date(be_passpartyclass_date);
		}
		if (be_activist_date != null) {
			updateInfoUser.setBe_target_date(be_target_date);
		}
		if (be_activist_date != null) {
			updateInfoUser.setBe_probationary_date(be_probationary_date);
		}
		if (be_activist_date != null) {
			updateInfoUser.setBe_fullmember_date(be_fullmember_date);
		}
		if (currentUser.getPermission() == 2) {
			updateInfoUser.setPartybranchid(partybranchid);
		}
		else {
			updateInfoUser.setPartybranchid(currentUser.getPartybranchid());
		}
		updateInfoUser.setJob(job);
		return updateInfoUser;
	}
	
	private User generateCreateUserInfo(User createUser) {
		generateUpdateInfoUser(createUser);
		if(createUser.getBe_activist_date() == null) {
			createUser.setBe_activist_date(Constants.DEFAULT_DATE);
		}
		if(createUser.getBe_passpartyclass_date() == null) {
			createUser.setBe_passpartyclass_date(Constants.DEFAULT_DATE);
		}
		if(createUser.getBe_target_date() == null) {
			createUser.setBe_target_date(Constants.DEFAULT_DATE);
		}
		if(createUser.getBe_probationary_date() == null) {
			createUser.setBe_probationary_date(Constants.DEFAULT_DATE);
		}
		if(createUser.getBe_fullmember_date() == null) {
			createUser.setBe_fullmember_date(Constants.DEFAULT_DATE);
		}
		createUser.setPasswd(createUser.getStudentid());
		createUser.setPermission(0);
		createUser.setStatus(0);
		createUser.setNext_status(0);
		createUser.setIs_complete(0);
		return createUser;
	}
	
	public User getCurrentUser() {
		return currentUser;
	}

	public User getUser() {
		return user;
	}

	public User getTmpUser() {
		return tmpUser;
	}

	public Commit getCommit() {
		return commit;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCurrentUserId() {
		return currentUserId;
	}

	public void setCurrentUserId(Integer currentUserId) {
		this.currentUserId = currentUserId;
	}

	public Integer getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getMessage() {
		return message;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
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

	public Integer getIntro1() {
		return intro1;
	}

	public void setIntro1(Integer intro1) {
		this.intro1 = intro1;
	}

	public Integer getIntro2() {
		return intro2;
	}

	public void setIntro2(Integer intro2) {
		this.intro2 = intro2;
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
}

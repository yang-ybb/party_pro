package org.party.action;

import java.sql.Date;

import org.party.domain.Commit;
import org.party.domain.User;

import com.opensymphony.xwork2.Action;

public class UserAction implements Action {

	private User currentUser;
	private Commit currentCommit;
	
	private Integer id;
    private String studentid;
    private String name;
    private Date birthday;
    private String dormitory;
    private String telephone;
    private String uclass;
    private String gender;
    private String nation;
    private String job;
    private String origo;
    
    private String old_password;
    private String new_password;
    private String confirm_password;
	
    private Integer status;
    private String message;
	/*
	 * ==== Description
	 *   首页（用户个人信息展示）
	 *   
	 * ==== URL
	 *   GET index
	 */
	public String index() throws Exception {
		currentUser = User.currentUser;
		if (currentUser != null) {
			currentCommit = currentUser.getCommit();
			if(currentCommit != null) {
				return "success";
			}
		}
		return "error";
	}
	
	/*
	 * ==== Description
	 *   用户基本信息编辑页
	 * 
	 * ==== URL
	 *   GET userInfoEdit
	 */
	public String userInfoEdit() throws Exception {
		currentUser = User.currentUser;
		if(currentUser != null) {
			return "success";
		}
		return "error";
	}
	
	/*
	 * ==== Description
	 *   用户基本信息修改
	 *   
	 * ==== URL
	 *   POST userInfoUpdate
	 */
	public String userInfoUpdate() throws Exception {
		currentUser = User.currentUser;
		if(id == null || currentUser == null || id != currentUser.getId()) {
			message = "用户身份验证失败！";
			return "error";
		}
		else {
			User user = generateParamsToUser();
			if(user.updateAttributesToTemp()) {
				return "success";
			}
			else {
				currentUser = user;
				message = "用户信息提交失败！请稍后重试，或者联系管理员！";
				return "false";
			}
		}
	}
	
	/*
	 * ==== Description
	 *   用户密码编辑
	 *   
	 * ==== URL
	 *   GET passwordEdit
	 */
	public String passwordEdit() throws Exception {
		currentUser = User.currentUser;
		if(currentUser == null) {
			status = 403;
			return "error";
		}
		else {
			return "success";
		}
	}
	
	/*
	 * ==== Description
	 *   用户密码更新
	 *   
	 * ==== URL
	 *   GET passwordUpdate
	 */
	public String passwordUpdate() throws Exception {
		currentUser = User.currentUser;
		if(id == null || currentUser == null || id != currentUser.getId()) {
			return "error";
		}
		else if (new_password.equals(confirm_password)){
			if (User.verifyLogin(currentUser.getStudentid(), old_password)) {
				if (currentUser.updatePassword(old_password, new_password, confirm_password)) {
					status = 200;
					return "success";
				}
			}
		}
		message = "密码修改失败！请重试！";
		return "false";
	}
	
	/*
	 * ==== Description
	 *   将参数更新到User实例中
	 *   该实例中的其他参数为原来的参数
	 * 
	 * ==== Returns
	 *   更新后的User实例
	 */
	private User generateParamsToUser() {
		User updateUser = User.findById(id);
		updateUser.setName(name);
		updateUser.setUclass(uclass);
		updateUser.setOrigo(origo);
		updateUser.setGender(gender);
		updateUser.setNation(nation);
		updateUser.setBirthday(birthday);
		updateUser.setDormitory(dormitory);
		updateUser.setTelephone(telephone);
		updateUser.setJob(job);
		return updateUser;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.Action#execute()
	 */
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public Commit getCurrentCommit() {
		return currentCommit;
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

	public String getOld_password() {
		return old_password;
	}

	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}

	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}

	public String getMessage() {
		return message;
	}

	public Integer getStatus() {
		return status;
	}
}

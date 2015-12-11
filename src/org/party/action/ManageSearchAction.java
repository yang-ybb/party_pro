package org.party.action;

import java.sql.Date;
import java.util.List;

import org.party.domain.User;

import com.opensymphony.xwork2.Action;

public class ManageSearchAction implements Action {
	
	private User currentUser;
	private List<User> users;
	
	/*
	 * ====Description
	 *   检索用户
	 *   
	 * === URL
	 *   GET search
	 */
	public String search() throws Exception {
		currentUser = User.currentUser;
		if(currentUser == null || currentUser.getPermission() < 1) {
			return "error";
		}
		users = User.findUsersByCondition(generateSearchCondition());
		return "success";
	}
	
	/*
	 * 生成搜索的条件
	 */
	private User generateSearchCondition() {
		User condition = new User();
		
		if(currentUser.getPermission() == 2) {
			condition.setPartybranchid(partybranchid);
		} else {
			condition.setPartybranchid(currentUser.getPartybranchid());
		}
		condition.setStudentid(studentid);
		condition.setName(name);
		condition.setUclass(uclass);
		condition.setApplydate_begin(applydate_begin);
		condition.setApplydate_end(applydate_end);
		condition.setStatus(status);
		condition.setNext_status(next_status);
		condition.setIs_complete(is_complete);
		condition.setBe_passpartyclass_date_begin(be_passpartyclass_date_begin);
		condition.setBe_passpartyclass_date_end(be_passpartyclass_date_end);
		condition.setBe_activist_date_begin(be_activist_date_begin);
		condition.setBe_activist_date_end(be_activist_date_end);
		condition.setBe_probationary_date_begin(be_probationary_date_begin);
		condition.setBe_probationary_date_end(be_probationary_date_end);
		condition.setBe_fullmember_date_begin(be_fullmember_date_begin);
		condition.setBe_fullmember_date_end(be_fullmember_date_end);
		return condition;
	}
	
	public User getCurrentUser() {
		return currentUser;
	}
	
    public List<User> getUsers() {
		return users;
	}

	private String studentid;
	private String name;
    private Integer partybranchid;
    private String uclass;
    private Date applydate_begin;
    private Date applydate_end;
    private Integer status;
    private Integer next_status;
    private Integer is_complete;
    private Date be_passpartyclass_date_begin;
    private Date be_passpartyclass_date_end;
    private Date be_activist_date_begin;
    private Date be_activist_date_end;
    private Date be_probationary_date_begin;
    private Date be_probationary_date_end;
    private Date be_fullmember_date_begin;
    private Date be_fullmember_date_end;
    
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
	public String getUclass() {
		return uclass;
	}
	public void setUclass(String uclass) {
		this.uclass = uclass;
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

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}

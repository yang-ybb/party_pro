package org.party.action;

import org.party.domain.*;
import com.opensymphony.xwork2.Action;

public class ManageUserAction implements Action {
	
	private User currentUser;
	
	private User user;
	private User tmpUser;
	private Commit commit;
	
	private Integer id;
	
	/*
	 * ==== Description
	 *   查看和管理个人页
	 *   
	 * ==== URL
	 *   GET manageUser
	 * 
	 * ==== Params
	 *   id: 用户的id
	 */
	public String manageUser() throws Exception {
		currentUser = User.currentUser;
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
	 * ==== Description
	 *   用户资料修改审核页
	 *   
	 * ==== URL
	 *   GET manageUserChangeCheck
	 *   
	 * ==== Params
	 *   id
	 */
	public String manageUserChangeCheck() {
		currentUser = User.currentUser;
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

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}

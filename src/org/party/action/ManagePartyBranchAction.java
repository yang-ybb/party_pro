package org.party.action;

import java.util.*;

import org.party.domain.*;

public class ManagePartyBranchAction extends GenericAction {
	
	private User currentUser;
	private Integer currentUserId;
	private List<PartyBranch> allPartyBranches;
	
	private PartyBranch updatePartyBranch;
	private Integer updatePartyBranchId;
	private String partyBranchName;
	private Integer updateAdminUserId;
	private List<User> allPartyBranchUsers;

	/*
	 * 党支部管理和新增页
	 * 
	 * 只有最高权限的管理员才能进
	 * 
	 * ==== URL
	 *   GET managePartyBranch
	 */
	public String managePartyBranch() throws Exception {
		currentUser = currentUser();
		if (currentUser != null && currentUser.getPermission() == 2) {
			allPartyBranches = PartyBranch.getAllPartyBranches();
			return "success";
		}
		else {
			messages.add("没有权限");
			return "error";
		}
	}
	
	/*
	 * 创建一个党支部
	 * 
	 * 只有最高管理员有权限
	 * 
	 * ==== URL 
	 * 	 POST managePartyBranchCreate
	 * 
	 * ==== Params
	 *   partyBranchName
	 *   currentUserId
	 */
	public String managePartyBranchCreate() throws Exception {
		currentUser = currentUser();
		if(currentUser != null && currentUserId != null &&
			currentUserId == currentUser.getId() && currentUser.getPermission() == 2) {
			allPartyBranches = PartyBranch.getAllPartyBranches();
			if (validatePartyBranchName() && PartyBranch.createPartyBranch(partyBranchName)) {
				return "success";
			}
			else {
				messages.add(0, "创建失败");
				return "false";
			}
		}
		else {
			messages.add("没有权限");
			return "error";
		}
	}
	
	/*
	 * 修改党支部信息
	 * 
	 * ==== URL
	 *   GET managePartyBranchEdit
	 *   
	 * ==== Params
	 *   updatePartyBranchId
	 */
	public String managePartyBranchEdit() throws Exception {
		currentUser = currentUser();
		if (currentUser != null && currentUser.getPermission() == 2) {
			updatePartyBranch = PartyBranch.getPartyBranchById(updatePartyBranchId);
			updateAdminUserId = updatePartyBranch.getAdminid();
			allPartyBranchUsers = updatePartyBranch.getALlUsersOfThisPartyBranch();
			return "success";
		}
		else {
			return "error";
		}
	}
	
	/*
	 * 更新到党支部信息
	 * 
	 * ==== URL
	 *   POST managePartyBranchUpdate
	 *   
	 * ==== Parmas
	 *   currentUserId
	 *   updatePartyBranchId
	 *   updatePartyBranchName
	 *   updateAdminUserId
	 */
	public String managePartyBranchUpdate() throws Exception{
		currentUser = currentUser();
		if(currentUser != null && currentUserId != null &&
			currentUser.getId() == currentUserId && currentUser.getPermission() == 2) {
			updatePartyBranch = PartyBranch.getPartyBranchById(updatePartyBranchId);
			if (updatePartyBranch == null) {
				messages.add("需要更新的党支部不存在");
				return "false";
			}
			updatePartyBranch.setPartybranchname(partyBranchName);
			updatePartyBranch.setAdminid(updateAdminUserId);
			if (validatePartyBranchName() && updatePartyBranch.saveUpdate()) {
				return "success";
			}
			else {
				messages.add(0, "修改失败");
				return "false";
			}
		}
		return "error";
	}
	
	/*
	 * 校验党支部名称
	 */
	private boolean validatePartyBranchName() {
		if (partyBranchName == null || partyBranchName.equals("")) {
			messages.add("党支部名称不能为空.");
			return false;
		}
		allPartyBranches = PartyBranch.getAllPartyBranches();
		for(PartyBranch pb : allPartyBranches) {
			if(pb.getPartybranchname().equals(partyBranchName)) {
				if(updatePartyBranchId != null && pb.getPartybranchid() == updatePartyBranchId) {
					continue;//更新时，排除和自身相同
				}
				messages.add("该党支部已经存在");
				return false;
			}
		}
		return true;
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public List<PartyBranch> getAllPartyBranches() {
		return allPartyBranches;
	}

	public Integer getCurrentUserId() {
		return currentUserId;
	}

	public void setCurrentUserId(Integer currentUserId) {
		this.currentUserId = currentUserId;
	}

	public String getPartyBranchName() {
		return partyBranchName;
	}

	public void setPartyBranchName(String partyBranchName) {
		this.partyBranchName = partyBranchName;
	}

	public PartyBranch getUpdatePartyBranch() {
		return updatePartyBranch;
	}

	public Integer getUpdatePartyBranchId() {
		return updatePartyBranchId;
	}

	public void setUpdatePartyBranchId(Integer updatePartyBranchId) {
		this.updatePartyBranchId = updatePartyBranchId;
	}

	public Integer getUpdateAdminUserId() {
		return updateAdminUserId;
	}

	public void setUpdateAdminUserId(Integer updateAdminUserId) {
		this.updateAdminUserId = updateAdminUserId;
	}

	public List<User> getAllPartyBranchUsers() {
		return allPartyBranchUsers;
	}
}

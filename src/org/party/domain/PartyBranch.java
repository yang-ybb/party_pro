package org.party.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.party.persistence.DaoConfig;
import org.party.persistence.UserSql;

public class PartyBranch {
    private Integer partybranchid;
    private String partybranchname;
    private Integer adminid;
    public Integer getPartybranchid() {
        return partybranchid;
    }
    public void setPartybranchid(Integer partybranchid) {
        this.partybranchid = partybranchid;
    }
    public String getPartybranchname() {
        return partybranchname;
    }
    public void setPartybranchname(String partybranchname) {
        this.partybranchname = partybranchname;
    }
    public Integer getAdminid() {
        return adminid;
    }
    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }
    
    /*
     * 更新党支部信息
     */
    public boolean saveUpdate() {
    	SqlSession session = DaoConfig.getNewSession();
    	boolean result = true;
    	try {
    		UserSql.updatePartyBranch(session, this);
    		session.commit();
    	}
    	catch(Exception e) {
    		//todo: add log
    		result = false;
    		session.rollback();
    		e.printStackTrace();
    	}
    	finally {
    		session.close();
    	}
    	return result;
    }
    
    /*
     * 通过党支部id查找党支部
     */
    public static PartyBranch findById(Integer partyBranchId) {
    	if(partyBranchId == null) return null;
    	SqlSession session = DaoConfig.getNewSession();
    	PartyBranch result = null;
    	try {
    		result = UserSql.getPartyBranchById(session, partyBranchId);
    	}
    	catch(Exception e) {
    		//todo: add log
    		e.printStackTrace();
    	}
    	finally {
    		session.close();
    	}
    	return result;
    }
    
    /*
     * 返回该党支部的所有成员
     */
    public List<User> getALlUsersOfThisPartyBranch() {
    	SqlSession session = DaoConfig.getNewSession();
    	List<User> users = null;
    	try {
    		users = UserSql.getUserListInPartybranch(session, partybranchid);
    	}
    	catch(Exception e) {
    		//todo: add log
    		e.printStackTrace();
    	}
    	finally {
    		session.close();
    	}
    	return users;
    }
    
    /*
     * 创建一个新党支部
     */
    public static boolean createPartyBranch(String partyBranchName) {
    	SqlSession session = DaoConfig.getNewSession();
    	boolean result = true;
    	try {
    		PartyBranch pb = new PartyBranch();
    		pb.setPartybranchname(partyBranchName);
    		UserSql.addNewPartyBranch(session, pb);
    		session.commit();
    	}
    	catch(Exception e) {
    		//todo: add log
    		result = false;
    		session.rollback();
    		e.printStackTrace();
    	}
    	finally {
    		session.close();
    	}
    	return result;
    }
    
    /*
     * 获取管理员名字
     */
    public String getAdminName() {
    	User admin = User.findById(adminid);
    	if (admin == null) {
    		return "无";
    	}
    	else {
    		return admin.getName();
    	}
    }
    
    /*
     * 根据id获取党支部
     */
    public static PartyBranch getPartyBranchById(Integer partybranchId) {
    	SqlSession session = DaoConfig.getNewSession();
    	PartyBranch result = null;
    	try {
    		result = UserSql.getPartyBranchById(session, partybranchId);
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
     * 返回所有党支部
     */
    public static List<PartyBranch> getAllPartyBranches() {
    	SqlSession session = DaoConfig.getNewSession();
    	List<PartyBranch> result = null;
    	try {
    		result = UserSql.getPartyBranchList(session);
    	}
    	catch (Exception e) {
    		//todo: 添加log
    		e.printStackTrace();
    	}
    	finally {
    		session.close();
    	}
    	return result;
    }
}

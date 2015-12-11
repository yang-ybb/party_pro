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

package org.party.domain;

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
}

package org.party.persistence;

import org.party.domain.*;
import org.apache.ibatis.session.*;

import java.util.*;
import java.sql.Date;

@SuppressWarnings("unchecked")
public class UserSql {	
	/*
     * 通过ID索引用户，不存在的时候返回null
     */
    public static User getUserById(SqlSession session, Integer id) {
        return (User) session.selectOne("selectUserById", id);
    }
    
    /*
     * 合并两个有序列表
     */
    private static List<Integer> mergeList(List<Integer> a, List<Integer> b) {
        List<Integer> res = new ArrayList<Integer>();
        int i = 0;
        int j = 0;
        int length1 = a.size();
        int length2 = a.size();
        while (i < length1 && j < length2) {
            if (a.get(i) < b.get(j)) {
                res.add(a.get(i));
                ++i;
            } else if (a.get(i) > b.get(j)) {
                res.add(b.get(j));
                ++j;
            } else {
                ++i;
            }
        }
        if (i < length1 - 1) {
            for (; i < length1; ++i) {
                res.add(a.get(i));
            }
        } else if (j < length2 - 1) {
            for (; j < length2; ++j) {
                res.add(b.get(j));
            }
        }
        return res;
    }
    /*
     * 通过条件筛选用户，条件之间的逻辑为与
     * return: 符合条件与逻辑的用户ID列表
     * args: conditions.arg1 : 筛选属性
     *       conditions.arg2 : 限定值
     *       conditions.op   : 限定方法(运算符)
     */
    public static List<Integer> filterUser(SqlSession session, List<Condition> conditions) {
        int length = conditions.size();
        Condition first = conditions.get(0);
        List<Integer> res = session.selectList("_getIdByCondition", first);
        int i = 1;
        for (i = 1; i < length; ++i) {
            List<Integer> tmp = session.selectList("_getIdByCondition", first);
            res = mergeList(res, tmp);
        }
        return res;
    }

    /*
     * 返回精确符合某条件的所有User
     * args: at_val.first 需要筛选的属性
     *       attr_val.second 需要筛选的属性值
     */
    public static List<User> getUsersByAttributes(SqlSession session, User attributes) {
        return session.selectList("selectUserByAttributes", attributes);
    }

    /*
     * 获得某个User(由ID确定)的所有介绍人
     */
    public static List<Integer> getIntroIdListById (SqlSession session, Integer id){
        return session.selectList("getIntroIdListById", id);
    }
    
    /*
     * 获得某个User(由ID确定)的所有介绍人
     */
    public static List<User> getIntroListById (SqlSession session, Integer id){
        return session.selectList("getIntroListById", id);
    }
    
    /*
     * 添加入党介绍人信息
     */
    public static void setIntroById (SqlSession session, Integer memid, Integer introid){
        PairObjObj poo = new PairObjObj();
        poo.setFirst(memid);
        poo.setSecond(introid);
        session.update("setIntroById",poo);
    }
    
    /*
     * 删除入党介绍人和积极分子的介绍关系
     */
    public static void deleteIntroById (SqlSession session, Integer memid, Integer introid){
        PairObjObj poo = new PairObjObj();
        poo.setFirst(memid);
        poo.setSecond(introid);
        session.delete("deleteIntroById",poo);
    }

    /*
     * 添加新党支部
     */
    public static void addNewPartyBranch (SqlSession session, PartyBranch partybranch){
        session.insert("addNewPartyBranch",partybranch);
    }

    /*
     * 更新党支部信息
     */
    public static void updatePartyBranch (SqlSession session, PartyBranch partybranch){
        session.update("updatePartyBranch",partybranch);
    }

    /*
     * 获取党支部信息
     */
    public static PartyBranch getPartyBranchById (SqlSession session, Integer partybranchid){
        return (PartyBranch)session.selectOne ("getPartyBranchById",partybranchid);
    }

    /*
     * 通过名称筛选党支部
     * 使用了非unique的属性，所以返回列表，请注意处理(不建议使用)
     */
    public static List<PartyBranch> getPartyBranchByName (SqlSession session, String partybranchname){
        return session.selectList ("getPartyBranchByName", partybranchname);
    }

    /*
     * 返回党支部信息列表
     */
    public static List<PartyBranch> getPartyBranchList (SqlSession session){
        return session.selectList ("getPartyBranchList");
    }

    /*
     * 删除一个党支部
     */
    public static void deletePartyBranchById (SqlSession session, Integer partybranchid){
        session.delete("deletePartyBranchById",partybranchid);
    }

    /*
     * 通过username和passwd校验身份，不区分用户不存在/密码错误，请注意返回错误
     */
    public static boolean checkUser(SqlSession session, User user) {
        return session.selectList("checkUser", user).size() == 1;
    }
    
    /*
     * 更新密码
     */
    public static void updatePasswd (SqlSession session, User user) {
        session.update("updatePasswd",user);
    }
    
    /*
     * 获取所有字段(包括passwd加密之后的值，请注意处理)
     */
    public static List<User> getAllUser(SqlSession session) {
        return session.selectList("listAllUser");
    }

    /*
     * 添加user，建库过程会进行passwd加密
     */
    public static void addUser(SqlSession session, User user) {
        session.insert("insertUser", user);
    }
    
    /*
     * 提交更新，历史提交会被覆盖
     */
    public static void commitUpdateInfos(SqlSession session, User user) {
        if (getUpdateById(session, user.getId()) != null) {
            deleteUpdateById(session, user.getId());
        }
        session.insert("commitUpdateInfos", user);
    }
    
    /*
     * 审核更新，建议在同一session中进行update信息的删除，update信息删除一定要进行!!!
     */
    public static void checkedUpdateUser(SqlSession session, User user) {
        session.update("checkedUpdateUser", user);
    }

    /*
     * 删除update信息
     */
    public static void deleteUpdateById(SqlSession session, Integer id) {
        session.delete("deleteUpdateById", id);
    }

    /*
     * 获得更新列表
     */
    public static List<User> getAllUpdate(SqlSession session) {
        return session.selectList("getUpdateList", null);
    }

    /*
     * 获得某User的更新
     */
    public static User getUpdateById(SqlSession session, Integer id) {
        return (User) session.selectOne("getUpdateById", id);
    }

    /*
     * 删除用户信息，未采取标志位方式，session commit之后不可撤销
     */
    public static void deleteUser(SqlSession session, int id) {
        session.delete("deleteUser", id);
    }

    /*
     * 获取材料数量
     */
    public static Commit getCommit(SqlSession session, User user) {
        return (Commit) session.selectOne("getCommitCnt", user);
    }

    /*
     * 更新材料数量
     */
    public static void updateCommit(SqlSession session, Commit commit) {
        session.update("updateCommitCnt", commit);
    }

    /*
     * 新建材料数量信息，所有材料数量初始化为0，建议在创建用户时使用
     */
    public static void createCommit(SqlSession session, User user) {
        session.insert("createCommitCnt", user);
    }
    
    /*
     * 删除材料数量信息，建议在删除用户时使用
     */
    public static void deleteCommit(SqlSession session, Commit commit) {
        session.delete("deleteCommitCnt", commit);
    }

    /*
     * 获得指定党支部中所有的成员信息
     */
    public static List<User> getUserListInPartybranch(SqlSession session, Integer partybranch){
        return session.selectList("getUserListInPartybranch",partybranch);
    }
}

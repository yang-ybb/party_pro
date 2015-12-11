package org.party.action;

import org.party.domain.*;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction implements Action {
	
	String userName;
	String password;
	
	String message;

	/*
	 * 描述： 验证登录
	 */
	@Override
	public String execute() throws Exception {
		boolean result = User.verifyLogin(userName, password);
		if(result) {
			User.setCurrentUser(userName, password);
			ActionContext.getContext().getSession().put("currentUserId", User.currentUser.getId());
			return "success";
		}
		else {
			message = "用户名或密码错误，请重新输入。";
			return "error";	
		}
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

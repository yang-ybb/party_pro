package org.party.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.party.domain.*;
import org.party.utils.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Action;

public class GenericAction implements Action {
	
	//日志
	public Logger logger;
	public List<String> messages = new ArrayList<String>();
	
	public GenericAction() {
		logger = Logger.getLogger(this.getClass());
		PropertyConfigurator.configure("\\src\\log4j.properties");
	}
	
	public User currentUser() {
		String userName = (String) ActionContext.getContext().getSession().get("userName");
		return User.findByStudentId(userName);
	}
	
	public String currentTimestamp() {
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
	}
	
	public static java.sql.Date stringToDate(String str) {
		return new java.sql.Date(java.sql.Date.parse(str));
	}

	public List<String> getMessages() {
		return messages;
	}

	public void setMessages(List<String> messages) {
		this.messages = messages;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}

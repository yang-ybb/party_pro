<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String pageName = request.getParameter("pageName"); 
	if(pageName == null) { pageName = "";}%>
<div class="col-md-2 sidebar">
	<div>
		<div class="well">
			<span><h4>个人页面</h4></span>
			<ul class="nav nav-pills nav-stacked">
				<li class="<%= pageName.equals("index") ? "active" : "" %>">
					<a href="index">个人信息</a>
				</li>
			</ul>
		</div>
	</div>
	<div>
		<div class="well">
			<span><h4>管理页面</h4></span>
			<ul class="nav nav-pills nav-stacked">
				<li class="<%= pageName.equals("ManageSearch") ? "active" : "" %>"><a href="search">用户检索</a></li>
				<li class="<%= pageName.equals("ManageUserAdd") ? "active" : "" %>"><a href="manageUserAdd">添加用户</a></li>
				<li class="<%= pageName.equals("ManageUserImport") ? "active" : "" %>"><a href="manageUserImport">批量导入</a></li>
				<li class="<%= pageName.equals("ManagePartyBranch") ? "active" : "" %>"><a href="managePartyBranch">党支部管理</a></li>
			</ul>
		</div>
	</div>
</div>

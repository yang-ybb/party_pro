<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String pageName = request.getParameter("pageName"); %>
<div class="col-md-2 sidebar">
	<div>
		<div class="well">
			<span><h4>个人页面</h4></span>
			<ul class="nav nav-pills nav-stacked">
				<li class="<%= pageName=="index" ? "active" : "" %>">
					<a href="index">个人信息</a>
				</li>
			</ul>
		</div>
	</div>
	<div>
		<div class="well">
			<span><h4>管理页面</h4></span>
			<ul class="nav nav-pills nav-stacked">
				<li><a class="<%= pageName=="search" ? "active" : "" %>" href="search">用户检索</a></li>
				<li><a class="<%= pageName=="manageUserAdd" ? "active" : "" %>" href="manageUserAdd">添加用户</a></li>
				<li><a class="<%= pageName=="manageUserImport" ? "active" : "" %>" href="manageUserImport">批量导入</a></li>
				<li><a class="<%= pageName=="managePartyBranch" ? "active" : "" %>" href="managePartyBranch">党支部管理</a></li>
			</ul>
		</div>
		<span><%=pageName %></span>
	</div>
</div>

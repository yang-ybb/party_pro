<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>党支部修改</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker.css" rel="stylesheet">
    <script src="js/party.js"></script>
    <link href="css/party.css" rel="stylesheet">
    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<jsp:include page="TopBar.jsp" flush="true"/>
	
	<div class="container-fluid main-container">
		<jsp:include page="LeftBar.jsp" flush="true"/>
		
		<div class="col-md-10 content">
			<div class="panel panel-default">
                <div class="panel-heading">修改党支部</div>
                <div class="panel-body">
                	<jsp:include page="Message.jsp"/>
                    <form id="add-partybranch-form" accept-charset="UTF-8" action="managePartyBranchUpdate" 
                    	method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">党支部名称：</label>
                            <div class="col-md-4">
                                <input type="text" id="partyBranchName" class="form-control" 
                                	value="${updatePartyBranch.getPartybranchname()}" name="partyBranchName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">党支部管理员：</label>
                            <% List<User> members = (List<User>)pageContext.findAttribute("allPartyBranchUsers"); %>
                            <% Integer updateAdminUserId = (Integer)pageContext.findAttribute("updateAdminUserId"); %>
                            <div class="col-md-2">
                                <select class="form-control" name="updateAdminUserId">
                                    <option value="">请选择</option>
                                    <% if (members != null && members.size() > 0) { %>
                                    	<% for (User member : members) { %>
                                    		<% if(member.getId() == updateAdminUserId) { %>
                                    			<option value="<%= member.getId() %>" selected="selected"><%= member.getName() %></option>
                                    		<% }else { %>
                                    			<option value="<%= member.getId() %>"><%= member.getName() %></option>
                                    		<% } %>
                                    	<% } %>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                        	<input type="hidden" name="currentUserId" value="${currentUser.getId()}"/>
                        	<input type="hidden" name="updatePartyBranchId" value="${updatePartyBranchId}"/>
                            <div class="col-md-offset-2 col-md-10">
                                <button type="submit" id="partyBranchEditSubmit" class="btn btn-primary">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
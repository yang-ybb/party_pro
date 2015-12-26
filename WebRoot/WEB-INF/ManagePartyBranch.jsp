<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>党支部管理</title>

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
		<jsp:include page="LeftBar.jsp" flush="true">
			<jsp:param name="pageName" value="managePartyBranch"/>
		</jsp:include>
		
		<div class="col-md-10 content">
			<div class="panel panel-default">
                <div class="panel-heading">添加党支部</div>
                <div class="panel-body">
                	<jsp:include page="Message.jsp"/>
                    <form id="add-partybranch-form" accept-charset="UTF-8" action="managePartyBranchCreate"
                    	method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">党支部名称：</label>
                            <div class="col-md-4">
                                <input type="text" id="partyBranchName" class="form-control" 
                                	name="partyBranchName" placeholder="输入党支部名称" value="${partyBranchName}"/>
                                <input type="hidden" name="currentUserId" value="${currentUser.getId()}"/>
                            </div>
                            <button type="submit" id="partyBranchCreateSubmit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">党支部列表</div>
                <div class="panel-body">
                	<% List<PartyBranch> allPartyBranches = (List<PartyBranch>)pageContext.findAttribute("allPartyBranches"); %>
                    <% if(allPartyBranches == null || allPartyBranches.size() == 0) { %>
                    	<p>系统中暂时没有党支部，您可以在上面的输入框添加.</p>
                    <% } else { %>
	                    <p>一共有<%= allPartyBranches.size() %>个党支部</p>
	                    <table class="table table-bordered table-hover">
	                        <thread>
	                            <tr class="active">
	                                <th>党支部名称</th>
	                                <th>党支部负责人</th>
	                                <th>操作</th>
	                            </tr>
	                        </thread>
	                        <body>
	                        	<% for(PartyBranch pb : allPartyBranches) { %>
		                            <tr class="success">
		                                <td><%= pb.getPartybranchname() %></td>
		                                <td><%= pb.getAdminName() %></td>
		                                <td><a href="managePartyBranchEdit?updatePartyBranchId=<%= pb.getPartybranchid() %>">修改</a></td>
		                            </tr>
	                            <% } %>
	                        </body>
	                    </table>
	                <% } %>
                    </div>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
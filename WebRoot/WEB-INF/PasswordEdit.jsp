<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>密码修改</title>

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
                <div class="panel-heading">密码修改</div>
                <div class="panel-body">
                    <form id="password-edit-form-common" accept-charset="UTF-8" action="passwordUpdate" method="post" class="form-horizontal">
                    	<input type="hidden" name="id" value="${currentUser.getId()}"/>
                        <div class="form-group">
                            <label class="col-md-2 control-label">原密码：</label>
                            <div class="col-md-2">
                                <input type="password" id="old-password" class="form-control" name="old_password" placeholder="请输入原密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">新密码：</label>
                            <div class="col-md-2">
                                <input type="password" id="new-password" class="form-control" name="new_password" placeholder="请输入新密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">确认新密码：</label>
                            <div class="col-md-2">
                                <input type="password" id="confirm-password" class="form-control" name="confirm_password" placeholder="再次输入新密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </div>
                    </form>
                    <div><p>${message}</p></div>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
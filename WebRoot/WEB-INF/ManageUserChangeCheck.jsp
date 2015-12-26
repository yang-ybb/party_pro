<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户修改审核</title>

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
                <div class="panel-heading">资料修改审核</div>
                <div class="panel-body">
                	<jsp:include page="Message.jsp"/>
                	
                    <table class="table table-bordered table-hover">
                        <thread>
                            <tr class="active">
                                <th>项目</th>
                                <th>姓名</th>
                                <th>学号</th>
                                <th>班级</th>
                                <th>籍贯</th>
                                <th>性别</th>
                                <th>民族</th>
                                <th>出生日期</th>
                                <th>宿舍</th>
                                <th>联系方式</th>
                                <th>社会工作</th>
                            </tr>
                        </thread>
                        <tbody>
                            <tr class="warning">
                                <th>修改前</th>
                                <td>${user.getName()}</td>
                                <td>${user.getStudentid()}</td>
                                <td>${user.getUclass()}</td>
                                <td>${user.getOrigo()}</td>
                                <td>${user.getGender()=="m" ? "男" : "女"}</td>
                                <td>${user.getNation()}</td>
                                <td>${user.getBirthday()}</td>
                                <td>${user.getDormitory()}</td>
                                <td>${user.getTelephone()}</td>
                                <td>${user.getJob()}</td>
                            </tr>
                            <tr class="success">
                                <th>修改后</th>
                                <td>${tmpUser.getName()}</td>
                                <td>${tmpUser.getStudentid()}</td>
                                <td>${tmpUser.getUclass()}</td>
                                <td>${tmpUser.getOrigo()}</td>
                                <td>${tmpUser.getGender()=="m" ? "男" : "女"}</td>
                                <td>${tmpUser.getNation()}</td>
                                <td>${tmpUser.getBirthday()}</td>
                                <td>${tmpUser.getDormitory()}</td>
                                <td>${tmpUser.getTelephone()}</td>
                                <td>${tmpUser.getJob()}</td>
                            </tr>
                        </tbody>
                    </table>
                    <form id="manageUserChangeCheckForm" accept-charset="UTF-8" action="checkUserChange" method="post">
	                    <div class="col-sm-offset-1 col-sm-10">
	                    	<input type="hidden" id="currentUserId" name="currentUserId" value="${currentUser.getId()}"/>
	                    	<input type="hidden" id="updateUserId" name="updateUserId" value="${id}"/>
	                    	<input type="hidden" id="type" name="type" value=""/>
	                        <button id="pass-user-change" type="submit" class="btn btn-primary">审核通过</button>
	                        <button id="refuse-user-change" type="submit" class="btn btn-warning">审核不通过</button>
	                    </div>
                    </form>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
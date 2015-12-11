<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>基础信息修改</title>

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
				<div class="panel-heading">基础信息修改</div>
				<div class="panel-body">
					<form id="info-edit-form-common" accept-charset="UTF-8" action="userInfoUpdate"
						method="post" class="form-horizontal">
						<input type="hidden" name="id" value="${currentUser.getId()}"/>
						<div class="form-group">
							<label class="col-md-2 control-label">姓名：</label>
							<div class="col-md-2">
								<input type="text" id="name" class="form-control" value="${currentUser.getName()}"
									name="name" />
							</div>
							<label class="col-md-2 control-label">学号：</label>
							<div class="col-md-2">
								<input type="text" id="studentid" class="form-control"
									value="${currentUser.getStudentid()}" name="studentid" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">班级：</label>
							<div class="col-md-2">
								<input type="text" id="uclass" class="form-control"
									value="${currentUser.getUclass()}" name="uclass" />
							</div>
							<label class="col-md-2 control-label">籍贯：</label>
							<div class="col-md-2">
								<input type="text" id="origo" class="form-control" value="${currentUser.getOrigo()}"
									name="origo" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">性别：</label>
							<div class="col-md-2">
								<select class="form-control" id="gender" name="gender">
									<option value="m" ${currentUser.getGender()=="m" ? "selected" : ""}>男</option>
									<option value="f" ${currentUser.getGender()=="f" ? "selected" : ""}>女</option>
								</select>
							</div>
							<label class="col-md-2 control-label">民族：</label>
							<div class="col-md-2">
								<input type="text" id="nation" class="form-control" value="${currentUser.getNation()}"
									name="nation" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">出生日期：</label>
							<div class="col-md-2">
								<input type="text" id="birthday" class="form-control"
									value="${currentUser.getBirthday()}" name="birthday" readonly="readonly"/>
							</div>
							<label class="col-md-2 control-label">宿舍：</label>
							<div class="col-md-2">
								<input type="text" id="dorimitory" class="form-control"
									value="${currentUser.getDormitory()}" name="dormitory" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">联系方式：</label>
							<div class="col-md-2">
								<input type="text" id="telephone" class="form-control"
									value="${currentUser.getTelephone()}" name="telephone" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">社会工作：</label>
							<div class="col-md-5">
								<textarea type="text" id="job" class="form-control" rows="5"
									name="job">${currentUser.getJob()}</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</div>
					</form>
				</div>
				<div style="font-color:red;">
					<p>${message}</p>
				</div>
			</div>
		</div>
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
<script type="text/javascript">
	$(function() {
		$("#birthday").datepicker({format: 'yyyy-mm-dd'});
	});
</script>
</body>
</html>
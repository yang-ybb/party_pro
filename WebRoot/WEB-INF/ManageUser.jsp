<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>成员管理</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
                <div class="panel-heading">
                    状态信息
                </div>
                <% User showUser = (User)pageContext.findAttribute("user"); %>
                <div class="panel-body">
                    <p>
                        <label class="col-md-2">当前状态：</label>
                        <span>${user.getStatusName()}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <% if(showUser.getNext_status() > 0) { %>
                        	<a href="javascript:void(0)">转为${user.getNextStatusName()}</a>
                        <% } %>
                    </p>
                    <p>
                        <label class="col-md-2">材料信息：</label>
                        <span>${commit.getNotice()}</span>
                    </p>
                    <% if(showUser.getTmpUser() != null) {%>
	                    <p>
	                        <label class="col-md-2">修改审核：</label>
	                        <span>
	                            <a href="manageUserChangeCheck?id=${user.getId()}">审核入口</a>
	                        </span>
	                    </p>
                    <% } %>
                </div>
            </div>
            <div id="user_info_common" class="panel panel-default">
                <div class="panel-heading">基础信息&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="text-small" href="manageUserInfoEdit?id=${user.getId()}" target="_blank">编辑</a>
                </div>
                <div class="panel-body">
                    <span class="col-md-4">
                        <label>姓名：</label>
                        <span>${user.getName()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>学号：</label>
                        <span>${user.getStudentid()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>班级：</label>
                        <span>${user.getUclass()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>籍贯：</label>
                        <span>${user.getOrigo()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>性别：</label>
                        <span>${user.getGender()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>民族：</label>
                        <span>${user.getNation()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>出生日期：</label>
                        <span>${user.getBirthday()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>宿舍：</label>
                        <span>${user.getDormitory()}</span>
                    </span>
                    <span class="col-md-4">
                        <label>联系方式：</label>
                        <span>${user.getTelephone()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>培养/联系人：</label>
                        <span>${user.getIntrosNameAndTelephone()}</span>
                    </span><br>
                    <span class="col-md-10">
                        <label>社会工作：</label>
                        <span>${user.getJob()}</span>
                    </span><br>
                    <span class="col-md-6">
                        <label>申请入党时间：</label>
                        <span>${user.getTransApplydate()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>确定为积极分子时间：</label>
                        <span>${user.getTransBe_activist_date()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>党课通过时间：</label>
                        <span>${user.getTransBe_passpartyclass_date()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>确定为发展对象时间：</label>
                        <span>${user.getTransBe_target_date()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>发展时间：</label>
                        <span>${user.getTransBe_probationary_date()}</span>
                    </span>
                    <span class="col-md-6">
                        <label>转正时间：</label>
                        <span>${user.getTransBe_fullmember_date()}</span>
                    </span>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">档案信息&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="text-small" href="manageUserCommitEdit?id=${user.getId()}" target="_blank">编辑</a>
                </div>
                <div class="panel-body">
                    <span class="col-md-3">
                        <label>入党申请书：</label>
                        <span>${commit.getRudangshenqingshu()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>积极分子考察表：</label>
                        <span>${commit.getJijifenzikaochabiao()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>推优入党材料：</label>
                        <span>${commit.getTuiyourudang()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>思想汇报：</label>
                        <span>${commit.getSixianghuibao()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>政审材料：</label>
                        <span>${commit.getZhengshencailiao()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>政审报告：</label>
                        <span>${commit.getZhengshenbaogao()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>群众意见：</label>
                        <span>${commit.getQunzhongyijian()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>党课结业证：</label>
                        <span>${commit.getDangxiaojieyezheng()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>自传：</label>
                        <span>${currentCommit.getZizhuan()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>发展公示材料：</label>
                        <span>${commit.getFazhandangyuangongshi()}</span>
                    </span><br>
                    <span class="col-md-3">
                        <label>发展大会决议：</label>
                        <span>${commit.getZhibudahuijilu()}</span>
                    </span><br>
                    <span class="col-md-3">
                        <label>入党志愿书：</label>
                        <span>${commit.getRudangzhiyuanshu()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>预备期半期总结：</label>
                        <span>${commit.getBanqizongjie()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>预备期全年总结：</label>
                        <span>${commit.getQuannianzongjie()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>转正申请：</label>
                        <span>${commit.getZhuanzhengshenqing()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>转正公示材料：</label>
                        <span>${commit.getZhuanzhenggongshi()}</span>
                    </span>
                    <span class="col-md-3">
                        <label>预备党员考察表：</label>
                        <span>${commit.getYubeidangyuankaochabiao()}</span>
                    </span>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
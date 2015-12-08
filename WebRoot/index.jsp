<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录</title>

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
                <div class="panel-heading">状态信息</div>
                <div class="panel-body">
                    <span class="col-md-10">
                        <label class="col-md-2">当前状态：</label>
                        <span>预备党员</span>
                    </span>
                    <span class="col-md-10">
                        <label class="col-md-2">提示信息：</label>
                        <span>
                            缺1份《入党申请书》<br>
                            缺1份《思想汇报》
                        </span>
                    </span>
                </div>
            </div>
            <div id="user_info_common" class="panel panel-default">
                <div class="panel-heading">
                    基础信息&nbsp;&nbsp;&nbsp;&nbsp;
                    <a id="user_info_edit_common" class="text-small" href="file:///D:/Web/party_pro/WebRoot/info_edit_common.html" target="_blank">编辑</a>
                </div>
                <div class="panel-body">
                    <span class="col-md-4">
                        <label>姓名：</label>
                        <span>张三</span>
                    </span>
                    <span class="col-md-4">
                        <label>学号：</label>
                        <span>12345678</span>
                    </span>
                    <span class="col-md-4">
                        <label>班级：</label>
                        <span>计科1204</span>
                    </span>
                    <span class="col-md-4">
                        <label>籍贯：</label>
                        <span>北京市</span>
                    </span>
                    <span class="col-md-4">
                        <label>性别：</label>
                        <span>男</span>
                    </span>
                    <span class="col-md-4">
                        <label>民族：</label>
                        <span>汉族</span>
                    </span>
                    <span class="col-md-4">
                        <label>出生日期：</label>
                        <span>1993年6月12日</span>
                    </span>
                    <span class="col-md-4">
                        <label>宿舍：</label>
                        <span>JB-1410</span>
                    </span>
                    <span class="col-md-4">
                        <label>联系方式：</label>
                        <span>18800000000</span>
                    </span>
                    <span class="col-md-6">
                        <label>培养/联系人：</label>
                        <span>杜拉拉（15800000000）张巴巴（15900000000）</span>
                    </span><br>
                    <span class="col-md-10">
                        <label>社会工作：</label>
                        <span>校学生会主席，计科1204班班长</span>
                    </span><br>
                    <span class="col-md-6">
                        <label>申请入党时间：</label>
                        <span>2012年12月1日</span>
                    </span>
                    <span class="col-md-6">
                        <label>确定为积极分子时间：</label>
                        <span>2013年4月1日</span>
                    </span>
                    <span class="col-md-6">
                        <label>党课通过时间：</label>
                        <span>2013年5月20日</span>
                    </span>
                    <span class="col-md-6">
                        <label>确定为发展对象时间：</label>
                        <span>2014年3月20日</span>
                    </span>
                    <span class="col-md-6">
                        <label>发展时间：</label>
                        <span>2014年6月10日</span>
                    </span>
                    <span class="col-md-6">
                        <label>转正时间：</label>
                        <span>2015年6月10日</span>
                    </span>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    档案信息
                </div>
                <div class="panel-body">
                    <span class="col-md-3">
                        <label>入党申请书：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>积极分子考察表：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>推优入党材料：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>思想汇报：</label>
                        <span>5</span>
                    </span>
                    <span class="col-md-3">
                        <label>政审材料：</label>
                        <span>2</span>
                    </span>
                    <span class="col-md-3">
                        <label>政审报告：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>群众意见：</label>
                        <span>8</span>
                    </span>
                    <span class="col-md-3">
                        <label>党课结业证：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>自传：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>发展公示材料：</label>
                        <span>1</span>
                    </span><br>
                    <span class="col-md-3">
                        <label>发展大会决议：</label>
                        <span>1</span>
                    </span><br>
                    <span class="col-md-3">
                        <label>入党志愿书：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>预备期半期总结：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>预备期全年总结：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>转正申请：</label>
                        <span>1</span>
                    </span>
                    <span class="col-md-3">
                        <label>转正公示材料：</label>
                        <span></span>
                    </span>
                    <span class="col-md-3">
                        <label>预备党员考察表：</label>
                        <span>1</span>
                    </span>
                </div>
            </div>
		</div>		

		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
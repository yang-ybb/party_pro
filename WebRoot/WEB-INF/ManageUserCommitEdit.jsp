<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户档案信息修改</title>

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
                <div class="panel-heading">档案信息修改</div>
                <div class="panel-body">
                    <form id="info-edit-form-common" accept-charset="UTF-8" action="" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">入党申请书：</label>
                            <div class="col-md-1">
                                <input type="text" id="rudangshenqingshu" class="form-control" value="${commit.getRudangshenqingshu()}" name="rudangshenqingshu"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="rudangshenqingshu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">积极分子考察表：</label>
                            <div class="col-md-1">
                                <input type="text" id="jijifenzikaochabiao" class="form-control" value="${commit.getJijifenzikaochabiao()}" name="jijifenzikaochabiao"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="jijifenzikaochabiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">推优入党材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="tuiyourudang" class="form-control" value="${commit.getTuiyourudang()}" name="tuiyourudang"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="tuiyourudang-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">思想汇报：</label>
                            <div class="col-md-1">
                                <input type="text" id="sixianghuibao" class="form-control" value="${commit.getSixianghuibao()}" name="sixianghuibao"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="sixianghuibao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">政审材料：</label>
                            <div class="col-md-1">
                                <input type="text" id=" zhengshencailiao" class="form-control" value="${commit.getZhengshencailiao()}" name=" zhengshencailiao"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id=" zhengshencailiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">政审报告：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhengshenbaogao" class="form-control" value="${commit.getZhengshenbaogao()}" name="zhengshenbaogao"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="zhengshenbaogao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">群众意见：</label>
                            <div class="col-md-1">
                                <input type="text" id="qunzhongyijian" class="form-control" value="${commit.getQunzhongyijian()}" name="qunzhongyijian"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="qunzhongyijian-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">党课结业证：</label>
                            <div class="col-md-1">
                                <input type="text" id="dangxiaojieyezheng" class="form-control" value="${commit.getDangxiaojieyezheng()}" name="dangxiaojieyezheng"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="dangxiaojieyezheng-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">自传：</label>
                            <div class="col-md-1">
                                <input type="text" id="zizhuan" class="form-control" value="${commit.getZizhuan()}" name="zizhuan"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="zizhuan-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">发展公示材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="fazhandangyuangongshi" class="form-control" value="${commit.getFazhandangyuangongshi()}" name="fazhandangyuangongshi"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="fazhandangyuangongshi-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">发展大会决议：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhibudahuijilu" class="form-control" value="${commit.getZhibudahuijilu()}" name="zhibudahuijilu"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="zhibudahuijilu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">入党志愿书：</label>
                            <div class="col-md-1">
                                <input type="text" id="rudangzhiyuanshu" class="form-control" value="${commit.getRudangzhiyuanshu()}" name="rudangzhiyuanshu"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="rudangzhiyuanshu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">预备期半期总结：</label>
                            <div class="col-md-1">
                                <input type="text" id="banqizongjie" class="form-control" value="${commit.getBanqizongjie()}" name="banqizongjie"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="banqizongjie">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">预备期全年总结：</label>
                            <div class="col-md-1">
                                <input type="text" id="quannianzongjie" class="form-control" value="${commit.getQuannianzongjie()}" name="quannianzongjie"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="quannianzongjie-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">转正申请：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhuanzhengshenqing" class="form-control" value="${commit.getZhuanzhengshenqing()}" name="zhuanzhengshenqing"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="zhuanzhengshenqing-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">转正公示材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhuanzhenggongshi" class="form-control" value="${commit.getZhuanzhenggongshi()}" name="zhuanzhenggongshi"/>
                            </div>
                            <div class="col-md-1">
                                <button class="btn" id="zhuanzhenggongshi-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">预备党员考察表：</label>
                            <div class="col-md-1">
                                <input type="text" id="yubeidangyuankaochabiao" class="form-control" value="${commit.getYubeidangyuankaochabiao()}" name="yubeidangyuankaochabiao"/>
                            </div>
                            <div class="col-md-1">
	                            <input type="hidden" name="currentUserId" value="${currentUser.getId()}"/>
		                    	<input type="hidden" name="updateUserId" value="${id}"/>
                                <button class="btn" id="yubeidangyuankaochabiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">提交</button>
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
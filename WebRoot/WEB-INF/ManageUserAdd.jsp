<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>成员添加</title>

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
			<jsp:param name="pageName" value="ManageUserAdd"/>
		</jsp:include>
		
		<div class="col-md-10 content">
			<div class="panel panel-default">
                <div class="panel-heading">用户添加</div>
                <div class="panel-body">
                	<% String message = (String)pageContext.findAttribute("message"); %>
                	<% if(message != null && message.length() > 0) { %>
	                	<div class="col-md-12">
	                        <p class="col-md-offset-1 col-md-10 well error-message">${message}</p>
	                    </div>
	                <% } %>
                    <form id="manageUserAddForm" accept-charset="UTF-8" action="manageUserCreate" 
                    	method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>姓名：</label>
                            <div class="col-md-2">
                                <input type="text" id="name" class="form-control input" value="${name}" name="name"/>
                            </div>
                            <label class="col-md-2 control-label"><em>*</em>学号：</label>
                            <div class="col-md-2">
                                <input type="text" id="studentid" class="form-control input" value="${studentid}" name="studentid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>班级：</label>
                            <div class="col-md-2">
                                <input type="text" id="uclass" class="form-control input" value="${uclass}" name="uclass"/>
                            </div>
                            <label class="col-md-2 control-label"><em>*</em>籍贯：</label>
                            <div class="col-md-2">
                                <input type="text" id="origo" class="form-control input" value="${origo}" name="origo"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>性别：</label>
                            <div class="col-md-2">
                                <select class="form-control" id="gender" name="gender">
									<option value="m" ${gender=="m" ? "selected" : ""}>男</option>
									<option value="f" ${gender=="f" ? "selected" : ""}>女</option>
								</select>
                            </div>
                            <label class="col-md-2 control-label"><em>*</em>民族：</label>
                            <div class="col-md-2">
                                <input type="text" id="nation" class="form-control input" value="${nation}" name="nation"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>出生日期：</label>
                            <div class="col-md-2">
                                <input type="text" id="birthday" class="form-control input date-in" value="${birthday}" name="birthday" readonly="readonly"/>
                            </div>
                            <label class="col-md-2 control-label"><em>*</em>宿舍：</label>
                            <div class="col-md-2">
                                <input type="text" id="dormitory" class="form-control input" value="${dormitory}" name="dormitory"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>联系方式：</label>
                            <div class="col-md-2">
                                <input type="text" id="telephone" class="form-control phone" value="${telephone}" name="telephone"/>
                            </div>
                            <label class="col-md-2 control-label">培养人：</label>
                            <% List<User> allUsers = User.getAllUsers(); %>
                            <% Integer intro1 = (Integer)pageContext.findAttribute("intro1"); %>
                            <% Integer intro2 = (Integer)pageContext.findAttribute("intro2"); %>
                            <div class="col-md-2">
                                <select class="form-control" id="intro1" name="intro1">
                                    <option value="">请选择</option>
                                    <% for(User intro : allUsers) { %>
                                    	<% if(intro.getId() == intro1) { %>
                                    		<option value="<%=intro.getId()%>" selected="selected"><%=intro.getName()%></option>
                                    	<% } else { %>
                                    		<option value="<%=intro.getId()%>"><%=intro.getName()%></option>
                                    	<% } %>
                                    <% } %>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" id="intro2" name="intro2">
                                    <option value="">请选择</option>
                                     <% for(User intro : allUsers) { %>
                                    	<% if(intro.getId() == intro2) { %>
                                    		<option value="<%=intro.getId()%>" selected="selected"><%=intro.getName()%></option>
                                    	<% } else { %>
                                    		<option value="<%=intro.getId()%>"><%=intro.getName()%></option>
                                    	<% } %>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><em>*</em>申请入党时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="applydate" class="form-control input date-in" value="${applydate}"
                                	name="applydate" readonly="readonly"/>
                            </div>
                            <label class="col-md-2 control-label">定为积极分子时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_activist_date" class="form-control date-in" value="${be_activist_date}"
                                	name="be_activist_date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">党课通过时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_passpartyclass_date" class="form-control date-in" value="${be_passpartyclass_date}"
                                	name="be_passpartyclass_date"/>
                            </div>
                            <label class="col-md-2 control-label">定为发展对象时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_target_date" class="form-control date-in" value="${be_target_date}"
                                	name="be_target_date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">发展时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_probationary_date" class="form-control date-in" value="${be_probationary_date}"
                                	name="be_probationary_date"/>
                            </div>
                            <label class="col-md-2 control-label">转正时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_fullmember_date" class="form-control date-in" value="${be_fullmember_date}"
                                	name="be_fullmember_date"/>
                            </div>
                        </div>
                        <% List<PartyBranch> partyBranches = PartyBranch.getAllPartyBranches(); %>
                        <div class="form-group">
                        	<label class="col-md-2 control-label"><em>*</em>党支部：</label>
                            <div class="col-md-2">
                               	<% User currentUser = (User)pageContext.findAttribute("currentUser"); %>
                               	<% Integer partyBranchId = (Integer)pageContext.findAttribute("partybranchid"); %>
                                <% if (currentUser.getPermission() == 2) { %>
	                            	<select id="partybranchid" class="form-control" name="partybranchid">
	                                	<option value="0">请选择</option>
	                                   	<% for(PartyBranch pb : partyBranches) { %>
	                                      	<% if (partyBranchId == pb.getPartybranchid()) { %>
		                                      	<option value="<%=pb.getPartybranchid()%>" selected="selected"><%=pb.getPartybranchname()%></option>
		                                   	<% } else {%>
		                                      	<option value="<%=pb.getPartybranchid()%>"><%=pb.getPartybranchname()%></option>
		                                   	<% } %>
		                               	<% } %>
	                               	</select>
	                         	<% } else { %>
	                              	<input id="partybranchid" class="form-control" name="partybranchid" value="<%= currentUser.getPartyBranchName() %>" disabled="disabled"/>
	                           	<% }%>
                           	</div>
                       	</div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">社会工作：</label>
                            <div class="col-md-5">
                                <textarea type="text" id="job" class="form-control input" rows="5" name="job">${job}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">入党申请书：</label>
                            <div class="col-md-1">
                                <input type="text" id="rudangshenqingshu" class="form-control commit" value="${rudangshenqingshu}" name="rudangshenqingshu"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="rudangshenqingshu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">积极分子考察表：</label>
                            <div class="col-md-1">
                                <input type="text" id="jijifenzikaochabiao" class="form-control commit" value="${jijifenzikaochabiao}" name="jijifenzikaochabiao"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="jijifenzikaochabiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">推优入党材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="tuiyourudang" class="form-control commit" value="${tuiyourudang}" name="tuiyourudang"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="tuiyourudang-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">思想汇报：</label>
                            <div class="col-md-1">
                                <input type="text" id="sixianghuibao" class="form-control commit" value="${sixianghuibao}" name="sixianghuibao"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="sixianghuibao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">政审材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhengshencailiao" class="form-control commit" value="${zhengshencailiao}" name="zhengshencailiao"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zhengshencailiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">政审报告：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhengshenbaogao" class="form-control commit" value="${zhengshenbaogao}" name="zhengshenbaogao"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zhengshenbaogao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">群众意见：</label>
                            <div class="col-md-1">
                                <input type="text" id="qunzhongyijian" class="form-control commit" value="${qunzhongyijian}" name="qunzhongyijian"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="qunzhongyijian-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">党课结业证：</label>
                            <div class="col-md-1">
                                <input type="text" id="dangxiaojieyezheng" class="form-control commit" value="${dangxiaojieyezheng}" name="dangxiaojieyezheng"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="dangxiaojieyezheng-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">自传：</label>
                            <div class="col-md-1">
                                <input type="text" id="zizhuan" class="form-control commit" value="${zizhuan}" name="zizhuan"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zizhuan-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">发展公示材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="fazhandangyuangongshi" class="form-control commit" value="${fazhandangyuangongshi}" name="fazhandangyuangongshi"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="fazhandangyuangongshi-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">发展大会决议：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhibudahuijilu" class="form-control commit" value="${zhibudahuijilu}" name="zhibudahuijilu"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zhibudahuijilu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">入党志愿书：</label>
                            <div class="col-md-1">
                                <input type="text" id="rudangzhiyuanshu" class="form-control commit" value="${rudangzhiyuanshu}" name="rudangzhiyuanshu"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="rudangzhiyuanshu-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">预备期半期总结：</label>
                            <div class="col-md-1">
                                <input type="text" id="banqizongjie" class="form-control commit" value="${banqizongjie}" name="banqizongjie"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="banqizongjie-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">预备期全年总结：</label>
                            <div class="col-md-1">
                                <input type="text" id="quannianzongjie" class="form-control commit" value="${quannianzongjie}" name="quannianzongjie"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="quannianzongjie-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">转正申请：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhuanzhengshenqing" class="form-control commit" value="${zhuanzhengshenqing}" name="zhuanzhengshenqing"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zhuanzhengshenqing-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">转正公示材料：</label>
                            <div class="col-md-1">
                                <input type="text" id="zhuanzhenggongshi" class="form-control commit" value="${zhuanzhenggongshi}" name="zhuanzhenggongshi"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="zhuanzhenggongshi-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label class="col-md-2 control-label">预备党员考察表：</label>
                            <div class="col-md-1">
                                <input type="text" id="yubeidangyuankaochabiao" class="form-control commit" value="${yubeidangyuankaochabiao}" name="yubeidangyuankaochabiao"/>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="btn add-button" id="yubeidangyuankaochabiao-plus">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                        	<input type="hidden" name="currentUserId" value="${currentUser.getId()}"/>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#birthday").datepicker({format: 'yyyy-mm-dd'});
			$("#applydate").datepicker({format: 'yyyy-mm-dd'});
			$("#be_activist_date").datepicker({format: 'yyyy-mm-dd'});
			$("#be_passpartyclass_date").datepicker({format: 'yyyy-mm-dd'});
			$("#be_target_date").datepicker({format: 'yyyy-mm-dd'});
			$("#be_probationary_date").datepicker({format: 'yyyy-mm-dd'});
			$("#be_fullmember_date").datepicker({format: 'yyyy-mm-dd'});
		});
	</script>
</body>
</html>
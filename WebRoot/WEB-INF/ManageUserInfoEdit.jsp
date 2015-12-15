<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户基本信息修改</title>

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
                <div class="panel-heading">用户基本信息修改</div>
                <div class="panel-body">
                    <form id="info-edit-form-manage" accept-charset="UTF-8" action="manageUserInfoEdit" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">姓名：</label>
                            <div class="col-md-2">
                                <input type="text" id="name" class="form-control" value="${user.getName()}" name="name"/>
                            </div>
                            <label class="col-md-2 control-label">学号：</label>
                            <div class="col-md-2">
                                <input type="text" id="studentid" class="form-control" value="${user.getStudentid()}" name="studentid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">班级：</label>
                            <div class="col-md-2">
                                <input type="text" id="uclass" class="form-control" value="${user.getUclass()}" name="uclass"/>
                            </div>
                            <label class="col-md-2 control-label">籍贯：</label>
                            <div class="col-md-2">
                                <input type="text" id="origo" class="form-control" value="${user.getOrigo()}" name="origo"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">性别：</label>
                            <div class="col-md-2">
                                <select class="form-control" id="gender" name="gender">
									<option value="m" ${user.getGender()=="m" ? "selected" : ""}>男</option>
									<option value="f" ${user.getGender()=="f" ? "selected" : ""}>女</option>
								</select>
                            </div>
                            <label class="col-md-2 control-label">民族：</label>
                            <div class="col-md-2">
                                <input type="text" id="nation" class="form-control" value="${user.getNation()}" name="nation"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">出生日期：</label>
                            <div class="col-md-2">
                                <input type="text" id="birthday" class="form-control" value="${user.getBirthday()}" name="birthday"/>
                            </div>
                            <label class="col-md-2 control-label">宿舍：</label>
                            <div class="col-md-2">
                                <input type="text" id="dormitory" class="form-control" value="${user.getDormitory()}" name="dorimitory"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">联系方式：</label>
                            <div class="col-md-2">
                                <input type="text" id="telephone" class="form-control" value="${user.getTelephone()}" name="telephone"/>
                            </div>
                            <label class="col-md-2 control-label">培养人：</label>
                            <% List<User> allUsers = User.getAllUsers(); %>
                            <% User user = (User)pageContext.findAttribute("user"); %>
                            <div class="col-md-2">
                                <select class="form-control" id="intro1" name="intro1">
                                    <option value="">请选择</option>
                                    <% for(User intro : allUsers) { %>
                                    	<% if(intro.getId() == user.getFirstIntroId()) { %>
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
                                    	<% if(intro.getId() == user.getSecondIntroId()) { %>
                                    		<option value="<%=intro.getId()%>" selected="selected"><%=intro.getName()%></option>
                                    	<% } else { %>
                                    		<option value="<%=intro.getId()%>"><%=intro.getName()%></option>
                                    	<% } %>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">申请入党时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="applyday" class="form-control" value="${user.getApplydate()}" name="applyday"/>
                            </div>
                            <label class="col-md-2 control-label">定为积极分子时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_activist_date" class="form-control" value="${user.getBe_activist_date()}" name="be_activist_date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">党课通过时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_passpartyclass_date" class="form-control" value="${user.getBe_passpartyclass_date()}" name="be_passpartyclass_date"/>
                            </div>
                            <label class="col-md-2 control-label">定为发展对象时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_target_date" class="form-control" value="${user.getBe_target_date()}" name="be_target_date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">发展时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_probationary_date" class="form-control" value="${user.getBe_probationary_date()}" name="be_probationary_date"/>
                            </div>
                            <label class="col-md-2 control-label">转正时间：</label>
                            <div class="col-md-2">
                                <input type="text" id="be_fullmember_date" class="form-control" value="${user.getBe_fullmember_date()}" name="be_fullmember_date"/>
                            </div>
                        </div>
                        <% List<PartyBranch> partyBranches = PartyBranch.getAllPartyBranches(); %>
                        <div class="form-group">
                        	<label class="col-md-2 control-label">党支部：</label>
                            <div class="col-md-2">
                               	<% User currentUser = (User)pageContext.findAttribute("currentUser"); %>
                                <% if (currentUser.getPermission() == 2) { %>
	                            	<select id="partybranchid" class="form-control" name="partybranchid">
	                                	<option value="0">请选择</option>
	                                   	<% for(PartyBranch pb : partyBranches) { %>
	                                      	<% if (user.getPartybranchid() == pb.getPartybranchid()) { %>
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
                                <textarea type="text" id="job" class="form-control" rows="5" name="job">${user.getJob()}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                        	<input type="hidden" name="currentUserId" value="${currentUser.getId()}"/>
	                    	<input type="hidden" name="updateUserId" value="${id}"/>
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
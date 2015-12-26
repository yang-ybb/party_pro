<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.PartyBranch" %>
<%@ page import="org.party.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	List<PartyBranch> partyBranches = PartyBranch.getAllPartyBranches();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户检索</title>

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
			<jsp:param name="pageName" value="ManageSearch"/>
		</jsp:include>
		
		<div class="col-md-10 content">
			<div class="panel panel-default">
                <div class="panel-heading">用户检索</div>
                <div class="panel-body">
                    <div class="col-md-12 well">
                        <label>检索条件：</label>
                        <form id="info-edit-form-common" accept-charset="UTF-8" action="search" method="get" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-2 control-label">姓名：</label>
                                <div class="col-md-2">
                                    <input type="text" id="name" class="form-control" value="${name}" name="name"/>
                                </div>
                                <label class="col-md-2 control-label">学号：</label>
                                <div class="col-md-2">
                                    <input type="text" id="studentid" class="form-control" value="${studentid}" name="studentid"/>
                                </div>
                                <label class="col-md-2 control-label">班级：</label>
                                <div class="col-md-2">
                                    <input type="text" id="uclass" class="form-control" value="${uclass}" name="uclass"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">党支部：</label>
                                <div class="col-md-2">
                                	<% User currentUser = (User)pageContext.findAttribute("currentUser"); %>
                                	<% if (currentUser.getPermission() == 2) { %>
	                                    <select id="partybranchid" class="form-control" name="partybranchid">
	                                        <option value="0">请选择</option>
	                                        <% for(PartyBranch pb : partyBranches) { %>
	                                        	<% if ((Integer)pageContext.findAttribute("partybranchid") == pb.getPartybranchid()) { %>
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
                                <label class="col-md-2 control-label">当前状态：</label>
                                <div class="col-md-2">
                                    <select class="form-control" id="status" name="status">
                                        <option value="">请选择</option>
                                        <option value="0" ${status == 0 ? "selected" : ""}>申请入党</option>
                                        <option value="1" ${status == 1 ? "selected" : ""}>积极分子</option>
                                        <option value="2" ${status == 2 ? "selected" : ""}>发展对象</option>
                                        <option value="3" ${status == 3 ? "selected" : ""}>预备党员</option>
                                        <option value="4" ${status == 4 ? "selected" : ""}>正式党员</option>
                                    </select>
                                </div>
                                <label class="col-md-2 control-label">可转状态：</label>
                                <div class="col-md-2">
                                    <select class="form-control" id="next_status" name="next_status">
                                        <option value="">请选择</option>
                                        <option value="0" ${next_status == 0 ? "selected" : ""}>不可转</option>
                                        <option value="1" ${next_status == 1 ? "selected" : ""}>积极分子</option>
                                        <option value="2" ${next_status == 2 ? "selected" : ""}>发展对象</option>
                                        <option value="3" ${next_status == 3 ? "selected" : ""}>预备党员</option>
                                        <option value="4" ${next_status == 4 ? "selected" : ""}>正式党员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">材料完整性：</label>
                                <div class="col-md-2">
                                    <select class="form-control" id="is_complete" name="is_complete">
                                        <option value="">请选择</option>
                                        <option value="1" ${is_complete == 1 ? "selected" : ""}>完整</option>
                                        <option value="0" ${is_complete == 0 ? "selected" : ""}>不完整</option>
                                    </select>
                                </div>
                                <label class="col-md-2 control-label">申请入党时间：</label>
                                <div class="col-md-2">
                                    <input type="text" id="applydate_begin" class="form-control" value="${applydate_begin}" name="applydate_begin"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="applydate_end" class="form-control" value="${applydate_end}" name="applydate_end"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">定积时间：</label>
                                <div class="col-md-2">
                                    <input type="text" id="be_activist_date_begin" class="form-control" value="${be_activist_date_begin}" name="be_activist_date_begin"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="be_activist_date_end" class="form-control" value="${be_activist_date_end}" name="be_activist_date_end"/>
                                </div>
                                <label class="col-md-2 control-label">党课通过时间：</label>
                                <div class="col-md-2">
                                    <input type="text" id="be_passpartyclass_date_begin" class="form-control" value="${be_passpartyclass_date_begin}" name="be_passpartyclass_date_begin"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="be_passpartyclass_date_end" class="form-control" value="${be_passpartyclass_date_end}" name="be_passpartyclass_date_end"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">发展时间：</label>
                                <div class="col-md-2">
                                    <input type="text" id="be_probationary_date_begin" class="form-control" value="${be_probationary_date_begin}" name="be_probationary_date_begin"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="be_probationary_date_end" class="form-control" value="${be_probationary_date_end}" name="be_probationary_date_end"/>
                                </div>
                                <label class="col-md-2 control-label">转正时间：</label>
                                <div class="col-md-2">
                                    <input type="text" id="be_fullmember_date_begin" class="form-control" value="${be_fullmember_date_begin}" name="be_fullmember_date_begin"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="be_fullmember_date_end" class="form-control" value="${be_fullmember_date_end}" name="be_fullmember_date_end"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <% List<User> users = (List<User>)pageContext.findAttribute("users"); %>
                    <div class="col-md-12">
                        <label>检索结果：</label>
                        <span>一共搜索到${users.size()}位用户</span><br>
                    
                        <table class="table table-bordered table-hover">
                            <thread>
                                <tr class="active">
                                    <th>姓名</th>
                                    <th>学号</th>
                                    <th>班级</th>
                                    <th>党支部</th>
                                    <th>当前状态</th>
                                    <th>可转状态</th>
                                    <th>材料完整性</th>
                                    <th>操作</th>
                                </tr>
                            </thread>
                            <tbody>
                            	<% for(User user : users) { %>
	                                <tr class="success">
	                                    <td><%= user.getName() %></td>
	                                    <td><%= user.getStudentid() %></td>
	                                    <td><%= user.getUclass() %></td>
	                                    <td><%= user.getPartyBranchName() %></td>
	                                    <td><%= user.getStatusName() %></td>
	                                    <td><%= user.getNextStatusName() %></td>
	                                    <td><%= user.getIs_complete() %></td>
	                                    <td><a href="manageUser?id=<%= user.getId() %>">查看和管理</a></td>
	                                </tr>
	                             <% } %>
                            </tbody>
                        </table>
                    </div>
<!--                     <div class="col-md-12"> -->
<!--                         <label>检索结果：</label> -->
<!--                         <span>一共搜索到${users.size()}位用户</span><br> -->
                    
<!--                         <table class="table table-bordered table-hover"> -->
<!--                             <thread> -->
<!--                                 <tr class="active"> -->
<!--                                     <th>姓名</th> -->
<!--                                     <th>学号</th> -->
<!--                                     <th>班级</th> -->
<!--                                     <th>党支部</th> -->
<!--                                     <th>当前状态</th> -->
<!--                                     <th>可转状态</th> -->
<!--                                     <th>材料完整性</th> -->
<!--                                     <th>操作</th> -->
<!--                                 </tr> -->
<!--                             </thread> -->
<!--                             <tbody> -->
<!--                             	<c:forEach var="user" items="${users}"> -->
<!-- 	                                <tr class="success"> -->
<!-- 	                                    <td><c:out value="${user.getName()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getStudentid()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getUclass()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getPartyBranchName()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getStatusName()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getNextStatusName()}"/></td> -->
<!-- 	                                    <td><c:out value="${user.getIs_complete()}"/></td> -->
<!-- 	                                    <td><a href="#">查看和管理</a></td> -->
<!-- 	                                </tr> -->
<!--                                 </c:forEach> -->
<!--                             </tbody> -->
<!--                         </table> -->
<!--                     </div> -->
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
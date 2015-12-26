<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.party.domain.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>成员导入</title>

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
                <div class="panel-heading">批量导入</div>
                <div class="panel-body">
                	<jsp:include page="Message.jsp"/>
                    <span class="col-md-12">
                        <h3>特别提醒：</h3>
                        <p>请从下面下载导入文件模板，严格参照模板填写导入数据。</p>
                        <p>每次导入只能导入一个党支部的数据，如果导入多个党支部数据，请分开导入。</p>
                        <p class="red">不符合模板要求的数据将不会被导入。文件不要超过1000行。</p>
                        <div>&nbsp;</div>
                        <p>下载模板：<a href="Download/template.xls" download>导入模板下载链接</a></p>
                    </span>
                    <div>&nbsp;</div>
                    <form id="manageUserImportForm" accept-charset="UTF-8" action="manageUserImportAction" 
                    	method="post" enctype="multipart/form-data" class="form">
	                    <% List<PartyBranch> partyBranches = PartyBranch.getAllPartyBranches(); %>
                        <div class="col-md-12">
	                        <h4><em>*</em><label>选择党支部：</label></h4>
							<div class="col-md-3">
								<% Integer partyBranchId = (Integer) pageContext.findAttribute("partyBranchId"); %>
								<select id="partyBranchId" class="form-control" name="partyBranchId">
									<option value="">请选择</option>
									<% for (PartyBranch pb : partyBranches) { %>
									<% if (partyBranchId == pb.getPartybranchid()) { %>
										<option value="<%=pb.getPartybranchid()%>" selected="selected"><%=pb.getPartybranchname()%></option>
									<% } else { %>
										<option value="<%=pb.getPartybranchid()%>"><%=pb.getPartybranchname()%></option>
									<% }} %>
								</select>
							</div>
							<br><br>
	                        <p>
	                            <h4><em>*</em><label>选择文件：</label></h4>
	                            <input type="file" name="importFile" title="选择文件" data-filename-placement="inside"/>
	                        </p>
	                        <br>
	                        <button type="submit" id="manageUserImportSubmit" class="btn btn-primary">开始导入</button>
	                    </div>
                    </form>
                </div>
            </div>
		</div>
		
		<jsp:include page="Footer.jsp" flush="true"/>
	</div>
</body>
</html>
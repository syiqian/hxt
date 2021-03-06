<%@page import="com.hinear.hxt.entity.UserInfo"%>
<%@page import="com.hinear.hxt.entity.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>每周课程</title>
<link rel="shortcut icon" href="<%=basePath%>/icons/favicon.ico"> 
<link href="<%=basePath%>/css/bootstrap.min.css?v=3.3.7" rel="stylesheet">
<link href="<%=basePath%>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="<%=basePath%>/css/animate.css" rel="stylesheet">
<link href="<%=basePath%>/css/style.css?v=4.1.0" rel="stylesheet">
<!-- 表格 -->
<link href="<%=basePath%>/css/plugins/bootstraptable/bootstrap-table.min.css"
	rel="stylesheet">
<link href="<%=basePath%>/css/plugins/editable/bootstrap-editable.css"
	rel="stylesheet">
<!-- 下拉多选 -->
<link href="<%=basePath%>/css/plugins/multiple-select/bootstrap-multiselect.css"
	rel="stylesheet">
<!-- 日期选择 -->
<link href="<%=basePath%>/css/plugins/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<link href="<%=basePath%>/css/plugins/bootstrapvalidator/bootstrapValidator.min.css" rel="stylesheet">
<style type="text/css">
a{color: black;}
a:HOVER {
	color: blue;
}
</style>
</head>
<body class="gray-bg">
	<!-- 包装内容 动画 从右方进入 -->
	<div class="wrapper wrapper-content animated fadeInRight">
		<!-- 面板 -->
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h3>每周课程</h3>
			</div>
			<div class="ibox-content">
				<!--查询窗体-->
				<div class="box-body no-padding">
					<form class="form-horizontal" role="form" id="queryForm">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="queClassID">班级：</label>
								<div class="col-md-7">
									<select id="queClassID" class="form-control">
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="queTermID">学期：</label>
								<div class="col-md-7">
									<select id="queTermID" class="form-control">
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<div class="col-md-4">
									<a id="btnSearch" type="button" class="btn btn-sm btn-primary" onclick="searchData()">搜索</a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 表格列表主窗体 -->
				<!-- 表格上班按钮（新增等）的工具条 -->
				<!-- 表格内容 -->
				<table id="table">
				</table>
			</div>
		</div>
		<!-- 面板 END -->
	</div>
	<!-- table modal -->
	<div id="editModal" class="modal fade" role='dialog' tabindex="-1"
		aria-labelledby="editModalLabel" data-backdrop="true"
		aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="editModal">选择科目</h5>
				</div>
				<div class="modal-body">
					<div class="box-body no-padding">
						<form class="form-horizontal"  role="form">
							<div class="form-group">
								<label for="editSubjectID" class="col-sm-4 control-label">科目：</label>
								<div class="col-sm-6">
									<select id="editSubjectID" class="form-control">
										<option value="0">无</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnSave" type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveData()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>

			</div>
		</div>
	</div>
	<!--Modal ends here--->
	<!-- 全局js -->
    <script src="<%=basePath%>/js/jquery-3.2.1.min.js?v=3.2.1"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.7"></script>
    <!-- 兼容ie9及以下json -->
	<script src="<%=basePath%>/js/json2.js"></script>
	<!-- 表格js -->
	<script src="<%=basePath%>/js/plugins/bootstraptable/bootstrap-table.min.js"></script>
	<script src="<%=basePath%>/js/plugins/bootstraptable/locale/bootstrap-table-zh-CN.js"></script>
	<script src="<%=basePath%>/js/plugins/editable/bootstrap-editable.min.js"></script>
	<script src="<%=basePath%>/js/plugins/editable/bootstrap-table-editable.js"></script>
	<!-- 下拉多选 -->
	<script src="<%=basePath%>/js/plugins/multiple-select/bootstrap-multiselect.js"></script>
	<!-- 日期选择 -->
	<script src="<%=basePath%>/js/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=basePath%>/js/plugins/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/plugins/bootstrapvalidator/bootstrapValidator.min.js?v=0.5.3"></script>
	
	<!-- util -->
	<script src="<%=basePath%>/js/common/util.js"></script>
	<script src="<%=basePath%>/js/common/util-table.js"></script>
	<script type="text/javascript">
		var utype = <%=userInfo.getUSERTYPEID()%>;
	</script>
	<script type="text/javascript" src="course.js?v=1.2"></script>
	<script src="<%=basePath%>/js/common/role-handler.js"></script>
</body>
</html>
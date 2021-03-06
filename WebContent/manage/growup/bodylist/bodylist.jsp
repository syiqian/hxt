<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>保健信息</title>
<link rel="shortcut icon" href="<%=basePath%>/icons/favicon.ico"> 
<link href="<%=basePath%>/css/bootstrap.min.css?v=3.3.7" rel="stylesheet">
<link href="<%=basePath%>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="<%=basePath%>/css/animate.css" rel="stylesheet">
<link href="<%=basePath%>/css/style.css?v=4.1.0" rel="stylesheet">
<link href="<%=basePath%>/css/plugins/bootstraptable/bootstrap-table.css" rel="stylesheet">
<link href="<%=basePath%>/css/plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet"><!-- 日期控件 -->
<link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<link href="<%=basePath%>/css/plugins/bootstrapvalidator/bootstrapValidator.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h3>保健信息</h3>
			</div>
			<div class="ibox-content"> <!-- ibox 主体内容 -->
				<!-- 查询条件 -->
				<div class="box-body no-padding">
					<div class="form-horizontal" role="form">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="queStartDate">开始日期：</label>
								<div class="col-md-6">
									<div class="input-group date" id="queStartDateGroup">
										<input type="text" id="queStartDate" class="form-control" readonly="readonly"/>
									    <span class="input-group-addon" >
									        <span class="glyphicon glyphicon-calendar"></span>
									    </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="queEndDate">结束日期：</label>
								<div class="col-md-6">
									<div class="input-group date" id="queEndDateGroup">
										<input type="text" id="queEndDate" class="form-control" readonly="readonly"/>
										<span class="input-group-addon" >
									        <span class="glyphicon glyphicon-calendar"></span>
									    </span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="queName">姓名：</label>
								<div class="col-md-6">
									<input type="text" id="queName" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="queStuNo">学号：</label>
								<div class="col-md-6">
									<input type="number" id="queStuNo" class="form-control" />
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="queClassID">班级：</label>
								<div class="col-md-6">
									<select id="queClassID" class="form-control">
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12 col-md-4 col-md-offset-2">
									<a type="button" class="btn btn-sm btn-primary"onclick="searchData()">搜索</a>
								</div>
							</div>
						</div>		
					</div>
				</div>
				<div id="toolbar">
					<button type="button" class="btn btn-primary btn-sm add-role" style="display: none;"
						data-toggle="modal" data-target="#addModal">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
				</div>
				<!-- table -->
				<table id="table" class="table-role"></table>
			</div> <!-- end ibox-content  -->
		</div>
	</div>
	
	<!-- table 新增 modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-lablledby="healthModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- 会话窗口 -->
			<div class="modal-content">
				<!-- 模态框内容 -->
				<div class="modal-header">
					<!-- 模态框头 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<!-- 右上角关闭按钮“x” -->
					<h4 class="modal-title" id="addModalTitle">新增保健信息</h4>
				</div>
				<div class="modal-body" style="overflow-y: scroll;">
					<!-- 模态框主题内容 -->
					<div class="box-body no-padding">
						<form id="addForm" class="form-horizontal" role="form">
							<div class="col-md-6">
								<div class="form-group">
									<label for="addClassID" class="col-md-4 control-label">班级：</label>
									<div class="col-md-6">
										<select id="addClassID" name="classID" class="form-control" onchange="changeClass()" required>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="addStuID" class="col-md-4 control-label">学生：</label>
									<div class="col-md-6">
										<select id="addStuID" name="stuID" class="form-control" required>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="addHeight" class="col-md-4 control-label">身高(cm)：</label>
									<div class="col-md-6">
										<input name="height" type="number" id="addHeight" class="form-control" required />
									</div>
								</div>
								<div class="form-group">
									<label for="addHeadSize" class="col-md-4 control-label">头围(cm)：</label>
									<div class="col-md-6">
										<input name="headSize" type="number" id="addHeadSize" class="form-control" required />
									</div>
								</div>
								<div class="form-group">
									<label for="addBodyState" class="col-md-4 control-label">健康状态：</label>
									<div class="col-md-6">
										<input name="bodyState" type="text" id="addBodyState" class="form-control"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="addNumber" class="col-md-4 control-label">体检编号：</label>
									<div class="col-md-6">
										<input name="number" type="text" id="addNumber" class="form-control" required />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="addDate">体检日期：</label>
									<div class="col-md-6">
										<div class="input-group date" id="addDateGroup">
											<input type="text" id="addDate" name="date" class="form-control" readonly="readonly"/>
											<span class="input-group-addon" >
										        <span class="glyphicon glyphicon-calendar"></span>
										    </span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="addWeight" class="col-md-4 control-label">体重(kg)：</label>
									<div class="col-md-6">
										<input name="weight" type="text" id="addWeight" class="form-control" required />
									</div>
								</div>
								<div class="form-group">
									<label for="addBustSize" class="col-md-4 control-label">胸围(cm)：</label>
									<div class="col-md-6">
										<input name="bustSize" type="number" id="addBustSize" class="form-control" required />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button id="addBtnSave" type="button" class="btn btn-primary">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- table 删除modal -->
	<div id="delModal" class="modal fade" role='dialog' tabindex="-1"
		aria-labelledby="delModalLabel" data-backdrop="true"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="delModalLabel" style="color: red">删除
					</h5>
				</div>
				<div class="modal-body">
					<p class="glyphicon glyphicon-question-sign">&nbsp;是否确认删除？</p>
				</div>
				<div class="modal-footer">
					<button id="delBtnOk" type="button" class="btn btn-delete"
						data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 全局js -->
<script src="<%=basePath%>/js/jquery-3.2.1.min.js?v=3.2.1"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.7"></script>
<!-- 兼容ie9及以下 -->
<script src="<%=basePath%>/js/json2.js"></script>
<script src="<%=basePath%>/js/plugins/bootstraptable/bootstrap-table.js"></script>
<script src="<%=basePath%>/js/plugins/bootstraptable/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=basePath%>/js/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath%>/js/plugins/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/plugins/bootstrapvalidator/bootstrapValidator.min.js?v=0.5.3"></script>
  
<!-- util -->
<script src="<%=basePath%>/js/common/util.js"></script>
<script src="<%=basePath%>/js/common/util-table.js"></script>

<script type="text/javascript" src="bodylist.js?v=1.2"></script>
<script type="text/javascript" src="<%=basePath%>/js/common/role-handler.js"></script>

</body>
</html>
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
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>页面标题</title>
<!-- 图标 -->
<link rel="shortcut icon" href="<%=basePath%>/icons/favicon.ico">
<!-- 全局公用CSS -->
<link href="<%=basePath%>/css/bootstrap.min.css?v=3.3.7"
	rel="stylesheet">
<link href="<%=basePath%>/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
</head>
<body>

	<!-- 全局公用JS -->
	<script src="<%=basePath%>/js/jquery-3.2.1.min.js?v=3.2.1"></script>
	<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.7"></script>
	<!-- 兼容ie9及以下JSON -->
	<script src="<%=basePath%>/js/json2.js"></script>
</body>
</html>
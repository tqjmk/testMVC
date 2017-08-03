<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<title>主界面</title>
</head>
<body>
<body class="easyui-layout">
	<div data-options="region:'north',title:'header',split:true,noheader:true" style="height:60px;background:#666;">
<div class="logo">后台管理</div>
<div class="logout">
您好，${sessionScope.userinfo.username }  | <a href="logout.do">退出</a>
</div>
</div>
<div data-options="region:'south',title:'footer',split:true,noheader:true" style="height:50px;line-height:30px;text-align:center;">
©2017.7 残月之风 Powered by JAVA SSM and EasyUI.
</div><div data-options="region:'west',title:' 导 航',split:true,iconCls:'icon-world'" style="width:180px;padding:10px;">
	<ul id="nav"></ul>
</div>
<div data-options="region:'center'" style="overflow:hidden;">
<div id="tabs">
	<div title="起始页 " style="padding:0 10px;display:block;">
	<p>欢迎来到后台管理系统！</p>
</div>
</div>
</div>

<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/main.js"></script>

</body>


</html>
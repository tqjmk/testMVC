<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/login.js"></script>

<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<title>EasyUI登录界面</title>
</head>
<body>
	<div id="login">
		<p>用户名:<input type="text" id="username" class="textbox"></p>
		<p>密码:<input type="password" id="password" class="textbox"></p>
	</div>
	<div id="btn">
		<a href="javascript:void(0)" class="easyui-linkbutton">登录</a>
	</div>
</body>
</html>
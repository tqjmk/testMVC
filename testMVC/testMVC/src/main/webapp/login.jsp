<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#register").on("click",function(){
			window.location.href="register.jsp";
		})
	})
</script>
</head>
<body>
	<center>
	<form action="login.do" method="post">
		用户名:<input type="text" name="username"><br>
		密码:<input type="password" name="password"><br>
		<input type="submit" value="登录">
		<input type="button" value="注册" id="register">
	</form>
	</center>
</body>
</html>
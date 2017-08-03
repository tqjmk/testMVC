<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理界面</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){		
		$("select option[value='${search.province}']").attr("selected","selected");
		
		$("#testTransaction").on("click",function(){
			window.location.href = "testTransaction.do";
		})
	})
</script>
</head>
<body>
<form action="searchUser.do" method="post">
	<table align="center" width="auto" border="1">		
		<tr>
			<td>用户名:<input type="text" name="name" value="${search.name }"></td>
			<td colspan="2" align="center">省:
				<select name="province">
					<option value="">--请选择--</option>
					<option value="1">省1</option>
					<option value="2">省2</option>
					<option value="3">省3</option>
				</select>
			</td>
				<td colspan="4">
					生日:<input type="date" name="minBirthday" value="${search.minBirthday}">
					-<input type="date" name="maxBirthday" value="${search.maxBirthday}">
				</td>
				<td align="center"><input type="submit" id="search" value="搜索"></td>
			</tr>
		
		<tr>
			<th>序号</th>
			<th>用户名</th>
			<th>密码</th>
			<th>省</th>
			<th>市</th>
			<th>街道</th>
			<th>生日</th>
			<th>操作</th>
		</tr>
		<c:forEach var="user" items="${userinfos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${user.username}</td>
				<td>${user.password}</td>
				<td>${user.provinceId}</td>
				<td>${user.cityId}</td>
				<td>${user.streetId}</td>
				<td>${user.birthday}</td>
				<td>
					<a href="editUserInfo.do?id=${user.id}">修改</a>
					<a href="deleteUserInfo.do?id=${user.id}" >删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
<center><input type="button" value="执行事务测试" id="testTransaction"></center>
</body>
</html>
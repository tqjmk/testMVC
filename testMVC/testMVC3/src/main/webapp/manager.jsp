<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理界面</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/manager.css" />

</head>
<body>
	<table id="manager"></table>

	<div id="manage_tool" style="padding: 5px;">
		<div style="margin-bottom: 5px;">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="manage_tool.add();">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"onclick="manage_tool.edit();">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"onclick="manage_tool.remove();"> 删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id=refresh onclick="manage_tool.reload();">刷新</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" id="redo" onclick="manage_tool.redo();">取消选择</a>
		</div>
		<div style="padding: 0 0 0 7px; color: #333;">
			用户名：<input type="text" class="textbox" name="search_username" style="width: 110px" id="search_username">
			生日从：<input type="text" name="birthday_from" class="easyui-datebox" editable="false" style="width: 110px" id="birthday_from"> 到：
			<input type="text" name="birthday_to" class="easyui-datebox" editable="false" style="width: 110px" id="birthday_to">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="manage_tool.search();">查询</a>
		</div>				
	</div>
	
	
	<form id="manage_add" style="margin:0;padding:5px 0 0 25px;color:#333;">
		<p>用户名:<input type="text" name="username" id="username" class="textbox"></p>
		<p>密码:<input type="password" name="password" id="password" class="textbox"></p>
		<p>省份:<select name="provinceId" id="province">
			<option value="0">--请选择省份--</option>
		</select></p>
		<p>市区:<select name="cityId" id="city">
			<option value="0">--请选择市区--</option>
		</select></p>
		<p>街道:<select name="streetId" id="street">
			<option value="0">--请选择街道--</option>
		</select></p>
		<p>生日:<input name="birthday" type="date" id="birthday"></p>
	</form>
	
	<form id="manage_edit" style="margin:0;padding:5px 0 0 25px;color:#333;">
		<input type = "hidden" name="id" class="textbox" style="width:200px;" id="id">
		<p>用户名:<input type="text" disabled="true" name="username_edit" id="username_edit" class="textbox"></p>
		<p>密码:<input type="password" name="password_edit" id="password_edit" class="textbox"></p>
		<p>省份:<select name="provinceId" id="province_edit">
			<option value="0">--请选择省份--</option>
		</select></p>
		<p>市区:<select name="cityId" id="city_edit">
			<option value="0">--请选择市区--</option>
		</select></p>
		<p>街道:<select name="streetId" id="street_edit">
			<option value="0">--请选择街道--</option>
		</select></p>
		<p>生日:<input name="birthday" type="date" id="birthday_edit"></p>
	</form>
	
<script type="text/javascript" src="js/manager.js"></script>
<script type="text/javascript">
	$(function(){
		//初始化省
		$.post("initProvince.do",
				null,
				function(data){
					$.each(data,function(i,n){
						$("#province").append('<option value="'+n.id+'">'+n.name+'</option>');
					})
				},
				"json")
		//初始化市
		$("#province").on("change",function(){
			var provinceId = $(this).val();
			$("#city").html('<option value="0">--请选择市区--</option>');
			$("#street").html('<option value="0">--请选择街道--</option>');
			
			if(provinceId==0){
				return;
			}
			
			$.post("initCityByProvince.do",
					{"provinceId":provinceId},
					function(data){
						$.each(data,function(i,n){
							$("#city").append('<option value="'+n.id+'">'+n.name+'</option>');
						})
					},
					"json")
		})
		//初始化街道
		$("#city").on("change",function(){
			var cityId = $(this).val();
			$("#street").html('<option value="0">--请选择街道--</option>')
			
			if(cityId==0){
				return;
			}
			
			$.post("initStreetByCity.do",
					{"cityId":cityId},
					function(data){
						$.each(data,function(i,n){
							$("#street").append('<option value="'+n.id+'">'+n.name+'</option>');
						})
					},
					"json")
		})
		
		//初始化修改省
		$.post("initProvince.do",
				null,
				function(data){
					$.each(data,function(i,n){
						$("#province_edit").append('<option value="'+n.id+'">'+n.name+'</option>');
					})
				},
				"json")
		//初始化修改市
		$("#province_edit").on("change",function(){
			var provinceId = $(this).val();
			$("#city_edit").html('<option value="0">--请选择市区--</option>');
			$("#street_edit").html('<option value="0">--请选择街道--</option>');
			
			if(provinceId==0){
				return;
			}
			
			$.post("initCityByProvince.do",
					{"provinceId":provinceId},
					function(data){
						$.each(data,function(i,n){
							$("#city_edit").append('<option value="'+n.id+'">'+n.name+'</option>');
						})
					},
					"json")
		})
		//初始化街道
		$("#city_edit").on("change",function(){
			var cityId = $(this).val();
			$("#street_edit").html('<option value="0">--请选择街道--</option>')
			
			if(cityId==0){
				return;
			}
			
			$.post("initStreetByCity.do",
					{"cityId":cityId},
					function(data){
						$.each(data,function(i,n){
							$("#street_edit").append('<option value="'+n.id+'">'+n.name+'</option>');
						})
					},
					"json")
		})
	})
</script>
</body>
</html>
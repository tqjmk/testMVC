<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改界面</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>

</head>
<body>
	<form action="updateUserInfo.do" method="post" id="form">
		用户名:<input type="text" name="username" id="username" value=${userInfo.username }>
		<span id="usernamemessage"></span><br/>
		密码:<input type="password" name="password" id="password" value=${userInfo.password }>
		<span id="passwordmessage"></span><br/>
		省份:<select name="provinceId" id="province" >
			<option value="0">--请选择省份--</option>
		</select><br/>
		市区:<select name="cityId" id="city">
			<option value="0">--请选择市区--</option>
		</select><br/>
		街道:<select name="streetId" id="street">
			<option value="0">--请选择街道--</option>
		</select><br/>
		<input type="submit" value="更新信息">
	</form>
	
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
			
		$("#username").on("blur",function(){
			$("#usernamemessage").html("");
			var u_val = $(this).val();
			u_val = $.trim(u_val);
			if(u_val==''){
				$("#usernamemessage").html('<font color="red">用户名不能为空</font>');
			}
		})
		
		$("#password").on("blur",function(){
			$("#passwordmessage").html("");
			var p_val = $(this).val();
			if(p_val.length==0){
				$("#passwordmessage").html('<font color="red">密码不能为空</font>');
			}else if(p_val.length<6 || p_val.length>12){
				$("#passwordmessage").html('<font color="red">用户名必须是6-12位</font>');
			}
		})
		
		$("#form").submit(function(){
			var u_val = $("#username").val();
			var flag = 1;
			u_val = $.trim(u_val);
			if(u_val==''){
				$("#usernamemessage").html('<font color="red">用户名不能为空</font>');
				flag = 0;
			}
			
			var p_val = $("#password").val();
			if(p_val.length==0){
				$("#passwordmessage").html('<font color="red">密码不能为空</font>');
				flag = 0;
			}else if(p_val.length<6 || p_val.length>12){
				$("#passwordmessage").html('<font color="red">用户名必须是6-12位</font>');
				flag = 0;
			}
			
			if(flag==0){
				return false;
			}			
		})

		$("#province").val("${userInfo.provinceId}");
		$("#city").val("${userInfo.cityId}");
		$("#street").val("${userInfo.streetId}");
		
	})
	
</script>
</body>
</html>
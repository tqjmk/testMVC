$(function(){
	//登录界面
	$("#login").dialog({
		title:"登录界面",
		width:300,
		height:180,
		modal:true,
		buttons:"#btn"
	});
	
	//用户名
	$("#username").validatebox({
		required:true,
		missingMessage:"用户名不能为空",
	});
	
	//密码
	$("#password").validatebox({
		required:true,
		validType:"length[6,30]",
		missingMessage:"密码不能为空",
		invalidMessage:"用户密码在6-30位",
	});
	
	//加载页面时判断
	if(!$("#username").validatebox("isValid")){
		$("#username").focus();
	}else if(!$("password").validatebox("isValid")){
		$("#password").focus();
	}
	
	//登录按钮
	$("#btn a").on("click",function(){
		if(!$("#username").validatebox("isValid")){
			$("#username").focus();
		}else if(!$("#password").validatebox("isValid")){
			$("#password").focus();
		} else {
			//服务器提交
			$.ajax({
				url:"login.do",
				type:"POST",
				data:{
					username:$("#username").val(),
					password:$("#password").val(),
				},
				beforeSend:function(){
					$.messager.progress({
						text:"正在尝试登陆....",
					});
				},
				success:function(data){
					$.messager.progress("close");
					if(data>0){
						window.location.href="getUserInfo.do";
					}else{
						$.messager.alert("登陆失败!","用户名或密码错误!","warning",function(){
							$("#password").select();
						});
					}
				}
			})
		}
	});
})
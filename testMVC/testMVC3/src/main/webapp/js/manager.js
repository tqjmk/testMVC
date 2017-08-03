$(function(){
	$("#manager").datagrid({
		url:"getInfo.do",
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 10,
		pageList : [5,10,15,20],
		pageNumber : 1,
		sortName : 'id',
		sortOrder : 'desc',
		toolbar : '#manage_tool',
		columns:[[
			{
				field:"id",
				title:"序号",
				width:100,
				checkbox:true,
			},
			{
				field:"username",
				title:"用户名",
				width:100,
			},
			{
				field:"password",
				title:"密码",
				width:100,
			},
			{
				field:"provinceId",
				title:"省",
				width:100,
			},
			{
				field:"cityId",
				title:"市",
				width:100,
			},
			{
				field:"streetId",
				title:"街道",
				width:100,
			},
			{
				field:"birthday",
				title:"生日",
				width:100,
			},
		]]
	})
	
	$("#manage_add").dialog({
		width:350,
		title:"新增管理",
		modal:true,
		closed:true,
		buttons:[{
			text:"提交",
			iconCls:"icon-add",
			handler:function(){
				if($("#manage_add").form("validate")){
					$.ajax({
						url:"addUser.do",
						type:"POST",
						data:{
							username:$("#username").val(),
							password:$("#password").val(),
							provinceId:$("#province").val(),
							cityId:$("#city").val(),
							streetId:$("#street").val(),
							birthday:$("#birthday").val(),
						},
						beforeSend:function(){
							$.messager.progress({
								text:"正在新增中....",
							});
						},
						success:function(data){
							$.messager.progress("close");
							if(data>0){								
								$.messager.show({
									title:"提示",
									msg:"新增成功",
								});
								$("#manage_add").dialog("close").form("reset");
								$("#manager").datagrid("reload");
							}else{
								$.messager.alert("新增失败!","未知错误导致失败，请重试!","warning");
							}
						}
					})
				}
			},
		},{
			text:"取消",
			iconCls:"icon-redo",
			handler:function(){
				$("#manage_add").dialog("close").form("reset");
			},
		}]
	})
	
	$("#manage_edit").dialog({
		width:350,
		title:"修改管理",
		modal:true,
		closed:true,
		buttons:[{
			text:"提交",
			iconCls:"icon-edit",
			handler:function(){
				if($("#manage_edit").form("validate")){
					$.ajax({
						url:"updateUserInfo.do",
						type:"POST",
						data:{
							id:$("#id").val(),
							username:$("#username_edit").val(),
							password:$("#password_edit").val(),
							provinceId:$("#province_edit").val(),
							cityId:$("#city_edit").val(),
							streetId:$("#street_edit").val(),
							birthday:$("#birthday_edit").val(),
						},
						beforeSend:function(){
							$.messager.progress({
								text:"正在修改中....",
							});
						},
						success:function(data){
							$.messager.progress("close");
							if(data>0){								
								$.messager.show({
									title:"提示",
									msg:"修改成功",
								});
								$("#manage_edit").dialog("close").form("reset");
								$("#manager").datagrid("reload");
							}else{
								$.messager.alert("新增失败!","未知错误导致失败，请重试!","warning");
							}
						}
					})
				}
			},
		},{
			text:"取消",
			iconCls:"icon-redo",
			handler:function(){
				$("#manage_edit").dialog("close").form("reset");
			},
		}]
	})
	
	manage_tool = {
		add : function(){
			$("#manage_add").dialog("open");
			$('input[name="username"]').focus();
		},
		remove : function () {
			var rows = $("#manager").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var ids = [];
						for (var i = 0; i < rows.length; i ++) {
							ids.push(rows[i].id);
						}

						$.ajax({
							type : "POST",
							url : "deleteUserInfo.do",
							data : {
								ids : ids.join(","),
							},
							beforeSend : function () {
								$("#manager").datagrid("loading");
							},
							success : function (data) {
								if (data) {
									$("#manager").datagrid("loaded");
									$("#manager").datagrid("load");
									$("#manager").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data + "个用户被删除成功！",
									});
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function(){
			var rows = $("#manager").datagrid("getSelections");
			if(rows.length > 1){
				$.messager.alert("警告操作!","只能选定一条记录修改!","warning");
			} else if(rows.length == 1){
				$.ajax({
					url:"editUserInfo.do",
					type:"POST",
					data:{
						id : rows[0].id,
					},
					beforeSend:function(){
						$.messager.progress({
							text:"正在获取中....",
						});
					},
					success:function(data){
						$.messager.progress("close");
						if(data){
							$("#manage_edit").form("load",{
								id : data.id,
								username_edit : data.username,
								password_edit : data.password,
								provinceId : data.provinceId,
								cityId : data.cityId,
								streetId : data.streetId,
								birthday : data.birthday,
							}).dialog("open");
						}else{
							$.messager.alert("修改失败!","未知错误导致失败，请重试!","warning");
						}
					}
				})
			}else if(rows.length == 0){
				$.messager.alert("警告操作!","至少要选择一条记录!","warning");
			}
		},
		
		reload : function(){
			$("#manager").datagrid("reload");
		},
		
		redo : function(){
			$("#manager").datagrid("unselectAll");
		},
		
		search : function(){
			$("#manager").datagrid("load",{
				search_username: $("#search_username").val(),
				birthday_from: $("#birthday_from").val(),
				birthday_to: $("#birthday_to").val(),
			});
		}
	}
	
	
	//管理帐号
	$('input[name="username"]').validatebox({
		required : true,
		missingMessage : "用户名不能为空",
	});
	//管理密码
	$('input[name="password"]').validatebox({
		required : true,
		validType : "length[6,12]",
		missingMessage : "密码不能为空",
		invalidMessage : "密码必须是6-12位",
	});
	//修改密码
	$('input[name="password_edit"]').validatebox({
		required : true,
		validType : "length[6,12]",
		missingMessage : "密码不能为空",
		invalidMessage : "密码必须是6-12位",
	});
})
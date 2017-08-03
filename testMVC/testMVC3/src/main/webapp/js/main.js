$(function(){
	$("#nav").tree({
		url:"selectTree.do",
		lines:true,
		onLoadSuccess:function(node,data){
			if(data){
				$(data).each(function(index,value){
					$("#nav").tree("expandAll");
				})
			}
		},
		onClick:function(node){
			if(node.url){
				if($("#tabs").tabs("exists",node.text)){
					$('#tabs').tabs('select', node.text);
				}else{
					$("#tabs").tabs("add",{
						title:node.text,
						closable:true,
						iconCls:node.iconCls,
						href:node.url+".do",
					});
				}				
			}
		}
	});
	
	$("#tabs").tabs({
		fit : true,
		border : false,
	});
})
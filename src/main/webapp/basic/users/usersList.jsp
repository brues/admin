<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
    <title>用户列表页面</title>
    <jsp:include page="../../util/import.jsp"/>
    <script type="text/javascript">
    $(function(){
			//表单验证
		   $("#form1").validate({meta: "validate", 
		       submitHandler:function(form){
		       $(document).ready(
	              function() {  
                     var options = {  
                         url : "${pageContext.request.contextPath}/users/saveOrUpdateUsers.action",  
                         type : "post",  
                         dataType:"json",
                         success : function(data) { 
                        	 closeWin();
                        	 $("#tt").datagrid("clearSelections");//删除后取消所有选项
							 $("#tt").datagrid("reload"); //保存后重新加载列表
                         }
                     };  
                     $("#form1").ajaxSubmit(options); 
                  });
		       }
		   });
			
		   $("#tt").datagrid({//数据表格
				title:"管理员列表信息",
				iconCls:"icon-save", 
				width:"auto",
				height:"auto",
				fitColumns: true,//宽度自适应
				align:"center",
				loadMsg:"正在处理，请等待......",
				//nowrap: false,//true是否将数据显示在一行
				striped: true,//true是否把一行条文化
				url:"${pageContext.request.contextPath}/users/listUsers.action",
				idField:"usersId",//唯一性标示字段
				frozenColumns:[[//冻结字段
				    {field:"ck",checkbox:true}
				]],
				columns:[[//未冻结字段
		            {field:"userName",title:"管理员名称",width:120, formatter:function(value,rowData,rowIndex){  //function里面的三个参数代表当前字段值，当前行数据对象，行号（行号从0开始）
		                return "<a style='display:block;' id='"+rowData.usersId+"' onclick='showDetailInfo(this.id);'>"+rowData.userName+"</a>";  
		         	  }  
					}, 
					{field:"email",title:"邮箱",width:120},
					{field:"phone",title:"电话",width:120},
					{field:"trueName",title:"真实姓名",width:120}
				]],
				pagination:true,//显示分页栏
				rownumbers:true,//显示行号   
				singleSelect:false,//true只可以选中一行
				toolbar:[{//工具条
					text:"添加",
					iconCls:"icon-add",
					handler:function(){
						createWindow(700,'auto',"&nbsp;&nbsp;添加","icon-add",false,"addOrEditWin"); 
					}
				},"-",{
					text:"修改", 
					iconCls:"icon-edit",
					handler:function(){
						var rows = $("#tt").datagrid("getSelections");//找到所有选中的行
						if(rows.length==0){//没有选择修改项
							msgShow("系统提示", "<p class='tipInfo'>请选择修改项！</p>", "warning");
						}if(rows.length>1){//超过了一个选择项
							msgShow("系统提示", "<p class='tipInfo'>只能够修改一项！</p>", "warning");
						}else if(rows.length==1){
							createWindow(700,'auto',"&nbsp;&nbsp;修改","icon-edit",false,"addOrEditWin");
							$.ajax({
							   type: "POST", dataType: "JSON",
							   url: "${pageContext.request.contextPath}/users/getUsersObject.action",
							   data: {usersId:rows[0].usersId},
							   success: function(data){
								   $("#usersId").val(data.usersId);
								   $("#userName").val(data.userName);
								   $("#password").val(data.password);
								   $("#trueName").val(data.trueName);
								   $("#email").val(data.email);
								   $("#phone").val(data.phone);
								   $("#comments").val(data.comments);
								   $("#registerDate").val(data.registerDate);
							   }
							});
						}
					}
				},"-",{
					text:"删除",
					iconCls:"icon-remove",
					handler:function(){
						var rows = $("#tt").datagrid("getSelections");//找到所有选中的行
						if(rows.length<=0){
							msgShow("系统提示", "<p class='tipInfo'>请选择删除项！</p>", "warning");
						}else{
							$.messager.confirm("系统提示", "<p class='tipInfo'>你确定要删除吗?</p>",function(data){
								if(data){//判断是否删除
									if (rows){//判断是否找到当前行，找到后异步形式从数据库中删除当前记录
										var ids="";
										for(i=0;i<rows.length;i++){
											if(i==rows.length-1)ids+=rows[i].usersId;
											else ids+=rows[i].usersId+",";
										}
										$.ajax({
										   type: "POST",dataType: "JSON",
										   url: "${pageContext.request.contextPath}/users/deleteUsers.action",
										   data: {ids:ids},
										   success: function(data){
											   $("#tt").datagrid("clearSelections");//删除后取消所有选项
											   if(data.isSuccess=="true")$("#tt").datagrid("reload"); //删除后重新加载列表
										   }
										});
									}	
								}
							});
						}
					}
				},"-",{
					text:"维护管理员角色",
					iconCls:"icon-search",
					handler:function(){
						var rows = $("#tt").datagrid("getSelections");//找到所有选中的行
						if(rows.length==0){//没有选择修改项
							$.messager.alert("提示","请选择用户");  
						}if(rows.length>1){//超过了一个选择项
							$.messager.alert("提示","只能够选择一项"); 
						}else if(rows.length==1){
							location.href="${pageContext.request.contextPath}/usersActor/findActorListByUsersId.action?usersId="+rows[0].usersId;
						}
					}
				}]
			});
			pageSplit();//调用分页函数
		});
    
		function showDetailInfo(id){
			createWindow(700,'auto',"&nbsp;&nbsp;详细信息","icon-tip",false,"detailWin");
			$.ajax({
				   type: "POST",
				   url: "${pageContext.request.contextPath}/users/getUsersObject.action",
				   data: {usersId:id},
				   dataType: "JSON",
				   success: function(data){
					   $("#duserName").html(data.userName);
					   $("#dpassword").html(data.password);
					   $("#dtrueName").html(data.trueName);
					   $("#demail").html(data.email);
					   $("#dphone").html(data.phone);
					   $("#dcomments").html(data.comments);
					   $("#dregisterDate").html(data.registerDate);
				   }
			});
		}
    </script>
  </head>
  
  <body>
  		<table id="tt"></table>
  		<div id="win" style="display:none;overflow-y:auto;scrollbar-face-color:#C4E1FF;">
			 <!-- 添加或者修改 -->
		  <jsp:include page="addOrEditUsers.jsp"/>
		  <!-- 详情页 -->
		  <jsp:include page="detailUsers.jsp"/>
		</div>
  </body>
</html>

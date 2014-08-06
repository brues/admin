<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
    <title>管理员角色列表页面</title>
    <jsp:include page="../../util/import.jsp"/>
    <script type="text/javascript">
    $(function(){
			//表单验证
		   $(function(){//表单验证
		    $('#form1').form({
		       url:'${pageContext.request.contextPath}/usersActor/saveOrUpdateUsersActor.action',
		       onSubmit:function(){
		           return $(this).form('validate');
		       },
		       success:function(data){
		       	 window.location.reload(); //提交表单后重新刷新本页
		       }
		   }); 
		  })
			
		   $("#tt").datagrid({//数据表格
				title:"管理员角色列表信息",
				iconCls:"icon-save", 
				width:"auto",
				height:"auto",
				fitColumns: true,//宽度自适应
				align:"center",
				loadMsg:"正在处理，请等待......",
				//nowrap: false,//true是否将数据显示在一行
				striped: true,//true是否把一行条文化
				url:"${pageContext.request.contextPath}/usersActor/listUsersActorByUsersId.action?usersId=${usersId}",
				idField:"userActorId",//唯一性标示字段
				frozenColumns:[[//冻结字段
				    {field:"ck",checkbox:true}
				]],
				columns:[[//未冻结字段
					{field:"actorId",title:"角色编号",width:120},
					{field:"actorName",title:"角色名称",width:120}
				]],
				pagination:true,//显示分页栏
				rownumbers:true,//显示行号   
				singleSelect:false,//true只可以选中一行
				toolbar:[{//工具条
					text:"添加",
					iconCls:"icon-add",
					handler:function(){
						createWindow(750,'auto',"&nbsp;&nbsp;添加","icon-add",false,"addOrEditWin");
						$("#form1").css("display","");
						getActorList();//获取商品信息
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
											if(i==rows.length-1)ids+=rows[i].userActorId;
											else ids+=rows[i].userActorId+",";
										}
										$.ajax({
										   type: "POST",dataType: "JSON",
										   url: "${pageContext.request.contextPath}/usersActor/deleteUsersActor.action",
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
				},"-",{//工具条
					text:"返回管理员列表",
					iconCls:"icon-back",
					handler:function(){
						location.href = "${pageContext.request.contextPath}/users/gotoUsersPage.action";//获取商品信息
					}
				}]
			});
			pageSplit();//调用分页函数
		});
    
    	function getActorList(){
			 var actorName=$("#actorName").val();
			 $.ajax({//获取MES牌号信息
				   type: "POST",
				   url: "${pageContext.request.contextPath}/usersActor/listActorInfo.action",
				   data: {actorName:actorName},
				   dataType: "JSON",
				   success: function(data){
					   var htmlStr="<tr style='background-color: #C4E1FF;font-weight: bolder;'><td width='8px' align='left'><input type='checkbox' onclick='checkedAll(this)'></td><td width='250px' align='left'>&nbsp;&nbsp;角色名称</td></tr>";
					   for(i=0;i<data.length;i++){
						   htmlStr+="<tr><td width='8px' align='left'><input type='checkbox' onclick='checkedOne(this)' class='actorInfos'  id='"+i+"' name='actorInfos' value='"+data[i].actorId+"_"+data[i].actorName+"'></td>"+
						   "<td width='250px' align='left'>&nbsp;&nbsp;"+data[i].actorName+"</td>";
					   }
					   $("#subTalbe").html(htmlStr);
				   }
			});
		 }
    	// 选择所有
		function checkedAll(obj){//选中所有或者去掉所有选中的
			var isChecked=obj.checked;
		    if(isChecked){
		    	$(".actorInfos").each(function() {
		    	    $(this).attr("checked", true);
		    	    var idIndex=$(this).attr("id");
		    	});
		    }else{
		    	$(".actorInfos").each(function() {
		    	    $(this).attr("checked", false);
		    	    var idIndex=$(this).attr("id");
		    	});
		    }
		}
    	// 选择一个
		function checkedOne(obj){
			var idIndex=obj.id;
			var isOneChedcked=obj.checked;
			if(isOneChedcked){
		    }else{
		    }
		}
    	$(function(){
		    $('#btn1').linkbutton({plain:true});   
		 });
    </script>
<%--    <style type="text/css">--%>
<%--   	.querybtn a{height:28px; font-size:14px; margin-top: 5px;width:70px;border: 1px #4F9D9D solid; background:#ECF5FF;font-weight: bolder;color:#003D79;}--%>
<%--    </style>--%>
  </head>
  <body >
  		<table id="tt"></table>
  		<div id="win" style="display:none;">
  			<form id="form1" action="post">
  				<input id="usersId" type="hidden" name="usersActor.usersId" value="${usersId}">
  				<table align="center" class="addOrEditTable">
  					<tr>
  						<td align="right"width="100px;">角色信息：</td>
  						<td align="left" height="10px;">
  							<div style="margin:10px 10px 0px 10px">
  								角色名称：<input type="text" name="actorName"  id="actorName"/>
  							 &nbsp;&nbsp;<span class="querybtn"><a href="javascript:getActorList();" id="btn1" iconCls="icon-search" >查询</a></span>
  							</div>
  							<div style="margin:0px 10px 10px 10px;">
				         		<table id="subTalbe" class="addOrEditTable" width="600px"></table>
			    		 	</div>
  						</td>
  					</tr>
  				</table>
  				 <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;">
					<input type="submit" id="save" class="button_save"  value=""/>&nbsp;
					<input type="button" id="close" class="button_close" onclick="closeWin()" value=""/>&nbsp;
				</div>
  			</form>
		</div>
  </body>
</html>

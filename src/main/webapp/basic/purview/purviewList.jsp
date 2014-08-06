<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
pageContext.setAttribute("basePath",basePath);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>权限分类</title>
		<jsp:include page="../../util/import.jsp"/>
		<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/cms/css/tree.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/common/cms/js/jquery.simple.purview.tree.js"></script>
		<script type="text/javascript">
		var simpleTreeCollection;
		var name="";
		var id="";
		$(document).ready(function(){

		simpleTreeCollection = $('.simpleTree').simpleTree({
			autoclose: true,
			afterClick:function(node){
				//alert("text-"+$('span:first',node).text()+$('span:first',node).attr("pid"));
				name=('span:first',node).text();
				id=$('span:first',node).attr("pid");
				
			},
			afterDblClick:function(node){
				
			},
			afterMove:function(destination, source, pos){
				
			},
			afterAjax:function()
			{
				//alert('Loaded');
			},
			animate:true
			//,docToFolderConvert:true
			});
		});
		function addPurview(id){
			//准备初始数据 ,父亲分类 
			createWindow(700,"auto","&nbsp;&nbsp;添加","icon-add",false,"win");
			$("#addOrEditWin").css("display","");
			$("#detailWin").css("display","none");//隐藏修改窗口
			$("#parentId").val(id);
		}
		//编辑
		function editPurview(id){
			$.ajax({
				   type: "POST",
				   dataType: "JSON",
				   url: "${pageContext.request.contextPath}/purview/getPurviewObject.action",
			       data: {purviewId:id},
				   success: function(data){
			    	   //显示 
					    createWindow(700,"auto","&nbsp;&nbsp;编辑","icon-edit",false,"win");
						$("#addOrEditWin").css("display","");
						$("#detailWin").css("display","none");//隐藏修改窗口
			    	    $("#purviewId").val(data.purviewId);
			    	    $("#parentId").val(data.parentId);
			    	    $("#purviewName").val(data.purviewName);
			    	    $("#url").val(data.url);
					}
				});
		}
		//详情
		function getPurviewInfo(id){
			$.ajax({
				   type: "POST",
				   dataType: "JSON",
				   url: "${pageContext.request.contextPath}/purview/getPurviewObject.action",
			       data: {purviewId:id},
				   success: function(data){
						//显示 
						createWindow(700,"auto","&nbsp;&nbsp;详情","icon-add",false,"win");
					    $("#addOrEditWin").css("display","none");
					    $("#detailWin").css("display","");
					    $("#dpurviewName").html(data.purviewName);
						$("#durl").html(data.url);
				     }
				});
		}
		//删除一个分类 
		function deletePurview(id){
			$.messager.confirm('提示框', '确定删除此分类吗？', function(r){
                if (r){
				 	$.ajax({
					   type: "POST",
					   dataType: "JSON",
					   url: "${pageContext.request.contextPath}/purview/delPurview.action",
				       data: {ids:id},
					   success: function(data){
				    	     if(data.isSuccess=="true"){
				    	    	 $.messager.alert("删除提示","删除成功！");
				    	    	 location.reload();
				    	     }else{
				    	    	 $.messager.alert("删除提示" ,"此分类下面还有子分类，请先删除子分类！");
				    	     }
					    }
					});
                }
            });
		}
		//取消 
		function cancel(){
			$("#addOrEditWin").css("display","none");
		}
		
		//提交 
		function tijiao(){
			var purviewId = $("#purviewId").val();
			var parentId = $("#parentId").val();
			var purviewName = $("#purviewName").val();
			var url = $("#url").val();
			$.ajax({
			   type: "POST",
			   dataType: "JSON",
			   url: "${pageContext.request.contextPath}/purview/saveOrEditPurview.action",
		       data: {"purview.purviewId":purviewId,"purview.parentId":parentId,"purview.purviewName":purviewName,"purview.url":url},
			   success: function(data){
				    location.reload();
				    //location.href="${pageContext.request.contextPath}/category/getNodes.action?id="+categoryId;
			     }
				});
		}
		
		function createDetailWindow(title,iconCls,inline,winId){
			$('#win').css("display","");
			$('#win').window({
				title:title,iconCls:iconCls,minimizable:false,maximizable:true,closable:true,shadow:false,
				closed:true,draggable:true,resizable:true,inline:inline,width:900,height:'500',modal:true,top:30
			}).window('open');
		}
	</script>
	</head>
	<body>
	<div style="width: 100%">
		<div style="float: left; padding-left: 20px;width: 100%">
			<form action="a" target="Index" method="post">
				<ul class="simpleTree">
					<li class="root" id='1'>
						<ul>
							<li id='2'>
								<span>权限分类</span> 
							     <a href="#" onclick="addPurview(1)">
							                   添加一级分类
								 </a>
								<ul class="ajax">
									<li id='3'>
										{url:${basePath}purview/getNodes.action?id=1}  
										
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</form>
		</div>
  <!-- 新增分类  -->
	  <div id="win" style="display:none;overflow-y:auto;scrollbar-face-color:#C4E1FF;">
		  <!-- 添加或者修改 -->
			  <jsp:include page="addOrEditor.jsp"/>
			  <!-- 详情页 -->
			  <jsp:include page="detail.jsp"/>
	  </div>
    </div>
	</body>
</html>

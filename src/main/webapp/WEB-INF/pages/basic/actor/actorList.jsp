<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/demo/demo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/color.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/easyloader.js"></script>

    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>

    <script type="text/javascript">
        var url;
        function newActor(){
            $('#dlg').dialog('open').dialog('setTitle','添加角色');
            $('#fm').form('clear');
            url = '${pageContext.request.contextPath}/basic/saveOrUpdateActor.action';
        }
        function editActor(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','Edit Actor');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/basic/saveOrUpdateActor.action';
            }
        }
        function saveActor(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    $('#dlg').dialog('close');
                    dataLoads();
                }
            });
        }
        function destroyActor(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/basic/deleteActorById.action",
                            data:{id:row.id},
                            success:function(data){
                                dataLoads();
                            },
                            error:function(){
                                dataLoads();
                            }
                        });
                    }
                });
            }
        }
    </script>


    <script type="text/javascript">
        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findActorList.action",
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }

        function doPurview(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlgs').dialog('open').dialog('setTitle','添加权限');
            }
        }

        function saveActorPurview(){
            var row = $('#dg').datagrid('getSelected');
            var id=row.id;
            deleteActorPurview(id);
        }

        function saveActorPurviewss(actorId,purviewId){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/saveOrUpdateActorPurview.action",
                data:{actorId:actorId,purviewId:purviewId}
            });
        }

        function deleteActorPurview(id){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/deleteByActorId.action",
                data:{actorId:id},
                success:function(data){
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    var checks = zTree.getCheckedNodes(true);
                    for(i=0;i<checks.length;i++){
                        saveActorPurviewss(id,checks[i].id);
                    }
                    $('#dlgs').dialog('close');
                },
                error:function(){
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    var checks = zTree.getCheckedNodes(true);
                    for(i=0;i<checks.length;i++){
                        saveActorPurviewss(id,checks[i].id);
                    }
                    $('#dlgs').dialog('close');
                }
            });
        }
    </script>




    <link rel="stylesheet" href="/common/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="/common/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="/common/ztree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="/common/ztree/js/jquery.ztree.excheck-3.5.js"></script>


    <SCRIPT type="text/javascript">
        <!--
        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            }
        };

        var zNodes =[];

        var code;

        function setCheck() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                    py = "p",
                    sy = "s",
                    pn = "p",
                    sn = "s",
                    type = { "Y":py + sy, "N":pn + sn};
            zTree.setting.check.chkboxType = type;
            showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
        }
        function showCode(str) {
            if (!code) code = $("#code");
            code.empty();
            code.append("<li>"+str+"</li>");
        }

        $(document).ready(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findPurviewList.action",
                dataType:"json",
                success:function(data){
                    var arr=data.purviewList;
                    for(i=0;i<arr.length;i++){
                        zNodes[zNodes.length]={id:arr[i].id, pId:arr[i].parentId, name:arr[i].purviewName,open:true};
                    }
                    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                    setCheck();
                    $("#py").bind("change", setCheck);
                    $("#sy").bind("change", setCheck);
                    $("#pn").bind("change", setCheck);
                    $("#sn").bind("change", setCheck);
                }
            });
        });
        //-->
    </SCRIPT>
</head>
<body>
<h2>角色管理</h2>
<p></p>

<table id="dg" title="角色列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="id" width="50" align="center">角色ID</th>
        <th field="actorName" width="50" align="center">角色名称</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newActor()">添加角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editActor()">编辑角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyActor()">删除角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doPurview()">分配权限</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle">角色信息</div>
    <form id="fm" method="post" name="actor">
        <div class="fitem" style="display: none;">
            <label>角色ID:</label>
            <input name="id" class="easyui-textbox"  >
        </div>
        <div class="fitem">
            <label>角色名称:</label>
            <input name="actorName" class="easyui-textbox">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveActor()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<div id="dlgs" class="easyui-dialog" style="width:400px;height:600px;padding:10px 20px" closed="true" buttons="#dlgs-buttons">
    <div class="ftitle">权限列表</div>
    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
</div>
<div id="dlgs-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveActorPurview()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgs').dialog('close')" style="width:90px">Cancel</a>
</div>

</body>
</html>
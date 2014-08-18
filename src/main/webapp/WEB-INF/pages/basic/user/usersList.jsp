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
        function newUser(){
            $('#dlg').dialog('open').dialog('setTitle','添加用户');
            $('#fm').form('clear');
            url = '${pageContext.request.contextPath}/basic/saveOrUpdateUser.action';
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','Edit User');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/basic/saveOrUpdateUser.action?id='+row.id;
            }
        }
        function saveUser(){
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
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/basic/deleteUserById.action",
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

        function userActor(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                var row = $('#dg').datagrid('getSelected');
                $("#userActorHidden").val(row.id);
                $.ajax({
                    url:"${pageContext.request.contextPath}/basic/findActorByUserId.action?userId="+row.id,
                    dataType:"json",
                    success:function(data){
                        var len=$("#actorSelect option").length;
                        for(i=0;i<len;i++){
                            var va=$("#actorSelect option:eq("+i+")").val();
                            if(parseInt(va)==parseInt(data.actorId)){
                                $("#actorSelect option:eq("+i+")").attr("selected","selected");
                            }
                        }
                        $('#actorDg').dialog('open').dialog('setTitle','分配角色');
                    }
                });

            }
        }

        function saveUserActor(){
            $('#actorDgForm').form('submit',{
                url: "${pageContext.request.contextPath}/basic/saveOrUpdateUserActor.action",
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    $('#actorDg').dialog('close');
                    dataLoads();
                    $("#actorSelect option:eq(0)").attr("selected","selected");
                }
            });
        }
    </script>


    <script type="text/javascript">

        $(document).ready(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findActorList.action",
                dataType:"json",
                success:function(data){
                    for(var i=0;i<data.map.rows.length;i++){
                        $("#actorSelect").append("<option value='"+data.map.rows[i].id+"'>"+data.map.rows[i].actorName+"</option>");
                    }
                }
            });
        });

        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findUserList.action",
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })

                }
            });
        }

        function userActorList(){
            window.location.href="${pageContext.request.contextPath}/basic/userActorList.action";
        }
    </script>
</head>
<body>
<h2>用户管理</h2>
<p></p>

<table id="dg" title="用户列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="userName" width="50" align="center">用户名</th>
        <th field="trueName" width="50" align="center">真实姓名</th>
        <th field="phone" width="50" align="center">电话</th>
        <th field="email" width="50" align="center">邮箱</th>
        <th field="comments" width="50" align="center">备注</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="userActor()">分配角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="userActorList()">角色列表</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:320px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">用户信息</div>
    <form id="fm" method="post" name="user">
        <div class="fitem" style="display: none;" >
            <label>id:</label>
            <input name="id" class="easyui-textbox"  >
        </div>
        <div class="fitem">
            <label>用户名:</label>
            <input name="userName" class="easyui-textbox" required="true" >
        </div>
        <div class="fitem" style="display: none;">
            <label>密码:</label>
            <input name="password" class="easyui-textbox"  >
        </div>
        <div class="fitem">
            <label>真实姓名:</label>
            <input name="trueName" class="easyui-textbox">
        </div>
        <div class="fitem">
            <label>电话:</label>
            <input name="phone" class="easyui-textbox">
        </div>
        <div class="fitem">
            <label>邮箱:</label>
            <input name="email" class="easyui-textbox">
        </div>
        <div class="fitem" style="display: none;">
            <label>注册日期:</label>
            <input name="registerDate" class="easyui-textbox">
        </div>
        <div class="fitem">
            <label>备注:</label>
            <input name="comments" class="easyui-textbox">
        </div>
    </form>
</div>

<div id="actorDg" class="easyui-dialog" style="width:300px;height:200px;padding:10px 20px" closed="true" buttons="#actorDg-buttons">

    <form id="actorDgForm" method="post">
        <input type="hidden" name="userId" id="userActorHidden" />
        <select id="actorSelect" name="actorId">
            <option value="0">-请选择角色-</option>
        </select>
    </form>
</div>
<div id="actorDg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUserActor()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#actorDg').dialog('close')" style="width:90px">Cancel</a>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>


</body>
</html>
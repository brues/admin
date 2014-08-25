<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户角色管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/demo/demo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/color.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/easyloader.js"></script>

    <style type="text/css">
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>

    <script type="text/javascript">
        function destroyUserActor(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/basic/deleteUserActorById.action",
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
                url:"${pageContext.request.contextPath}/basic/findUserActorList.action",
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }

        function userList(){
            window.location.href="${pageContext.request.contextPath}/basic/userList.action";
        }

    </script>
</head>
<body>
<h2>用户角色管理</h2>
<p></p>

<table id="dg" title="用户角色列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="userName" width="50" align="center">用户</th>
        <th field="actorName" width="50" align="center">角色</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUserActor()">删除用户角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="userList()">用户列表</a>
</div>

</body>
</html>
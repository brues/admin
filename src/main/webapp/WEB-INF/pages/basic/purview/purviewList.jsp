<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<HTML>
<HEAD>
    <TITLE>权限管理</TITLE>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
        function newPurview(){
            $('#dlg').dialog('open').dialog('setTitle','添加权限');
            $('#fm').form('clear');
            url = '${pageContext.request.contextPath}/basic/saveOrUpdatePurview.action?parentId='+$("#paramId").val();
        }
        function editPurview(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑权限');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/basic/saveOrUpdatePurview.action?parentId='+$("#paramId").val();
            }
        }
        function savePurview(){
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
        function destroyPurview(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/basic/deletePurviewById.action",
                            data:{id:row.id,parentId:$("#paramId").val()},
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

        function seeChilds(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                window.location.href="${pageContext.request.contextPath}/basic/purviewList.action?id="+row.id;
            }

        }

        function seeParent(){
            window.location.href="${pageContext.request.contextPath}/basic/purviewList.action?id=0";
        }


    </script>


    <script type="text/javascript">
        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findListByParentId.action?parentId="+$("#paramId").val(),
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }


        $(document).ready(function(){
            if($("#paramId").val()!=0){
                $("#seeChildA").css("display","none");
            }else{
                $("#seeParentA").css("display","none");
            }
        });


    </script>
</head>
<body>
<input type="hidden" id="paramId" value="${id}" />
<h2>权限管理</h2>
<p></p>

<table id="dg" title="权限列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="purviewName" width="50" align="center">权限名称</th>
        <th field="url" width="50" align="center">url</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newPurview()">添加权限</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPurview()">编辑权限</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyPurview()">删除权限</a>
    <a id="seeChildA" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="seeChilds()">查看子权限</a>
    <a id="seeParentA" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="seeParent()">查看父权限</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:500px;height:250px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">权限信息</div>
    <form id="fm" method="post" name="purview">
        <div class="fitem" style="display: none;">
            <label>权限Id:</label>
            <input name="id" class="easyui-textbox"  >
        </div>
        <div class="fitem">
            <label>权限名称:</label>
            <input name="purviewName" style="width: 250px;" class="easyui-textbox" required="true" >
        </div>
        <div class="fitem">
            <label>url:</label>
            <input name="url" style="width: 250px;" class="easyui-textbox">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="savePurview()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>


</body>
</html>
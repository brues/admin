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
    <title>问题备注</title>
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
        function newRemark(){
            $('#dlg').dialog('open').dialog('setTitle','添加问题备注');
            $('#fm').form('clear');
            $("#questionIdDlg").val($("#questionId").val());
            url = '${pageContext.request.contextPath}/que/saveOrUpdateRemark.action';
        }
        function editRemark(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','Edit Remark');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/que/saveOrUpdateRemark.action';
            }
        }
        function saveRemark(){
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
        function destroyRemark(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/que/deleteRemarkById.action",
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
                url:"${pageContext.request.contextPath}/que/findRemarkList.action",
                data:{questionId:$("#questionId").val()},
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }
    </script>

</head>
<body>
<input type="hidden" id="questionId" value="${questionId}" />
<h2>问题备注管理</h2>
<p></p>

<table id="dg" title="问题备注列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="content" width="50" align="center">问题备注</th>
        <%--<th field="questionId" width="50" align="center">问题id</th>--%>
        <th field="remarkPer" width="50" align="center">备注人</th>
        <th field="remmarkTime" width="50" align="center">备注时间</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRemark()">添加问题备注</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRemark()">编辑问题备注</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyRemark()">删除问题备注</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="history.go(-1)">返回</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle">问题备注信息</div>
    <form id="fm" method="post" name="remark">
        <div class="fitem" style="display: none;">
            <label>id:</label>
            <input name="id" class="easyui-textbox" >
        </div>
        <div class="fitem">
            <label>问题备注:</label>
            <input name="content" class="easyui-textbox" required="true" >
        </div>
        <div class="fitem" style="display: none;">
            <label>问题ID:</label>
            <input id="questionIdDlg" name="questionId" class="easyui-textbox">
        </div>
        <div class="fitem" style="display: none;">
            <label>备注人:</label>
            <input name="remarkPer" class="easyui-textbox">
        </div>
        <div class="fitem" style="display: none;">
            <label>备注时间:</label>
            <input name="remmarkTime" class="easyui-textbox">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRemark()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
</body>
</html>
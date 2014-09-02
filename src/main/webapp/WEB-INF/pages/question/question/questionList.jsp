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
    <title>问题</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/demo/demo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/color.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/easyloader.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/ueditor/ueditor.all.js"></script>


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
        $.ajax({
            url:"${pageContext.request.contextPath}/que/findTypeList.action",
            success:function(data){
                for(i=0;i<data.map.rows.length;i++){
                    $("#selectTypeId").append("<option value='"+data.map.rows[i].id+"'>"+data.map.rows[i].name+"</option>");
                }
            }
        });

        $.ajax({
            url:"${pageContext.request.contextPath}/que/findAnsShapeList.action",
            success:function(data){
                for(i=0;i<data.map.rows.length;i++){
                    $("#selectAnsShapeId").append("<option value='"+data.map.rows[i].id+"'>"+data.map.rows[i].shape+"</option>");
                }
            }
        });



        function newQuestion(){
            $('#dlg').dialog('open').dialog('setTitle','添加问题');
            $('#fm').form('clear');
            url = '${pageContext.request.contextPath}/que/saveOrUpdateQuestion.action';
        }
        function editQuestion(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑问题');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/que/saveOrUpdateQuestion.action';
            }
        }
        function saveQuestion(){
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
        function destroyQuestion(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/que/deleteQuestionById.action",
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

        function searchQuestionReamrk(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                window.location.href="${pageContext.request.contextPath}/que/remarkList.action?questionId="+row.id;
            }
        }

        function searchQuestionKeyWord(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                window.location.href="${pageContext.request.contextPath}/que/keyWordList.action?questionId="+row.id;
            }
        }

        function searchQuestionReplaceWord(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                window.location.href="${pageContext.request.contextPath}/que/wordReplaceList.action?questionId="+row.id;
            }
        }
    </script>


    <script type="text/javascript">
        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/que/findQuestionList.action",
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
<h2>问题管理</h2>
<p></p>

<table id="dg" title="问题列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="caseTitle" width="50" align="center">案例主题</th>
        <th field="clientName" width="50" align="center">客户名称</th>
        <th field="dqsfsy" width="50" align="center">当前是否适用</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newQuestion()">添加问题</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editQuestion()">编辑问题</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyQuestion()">删除问题</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchQuestionReamrk()">查看问题备注</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchQuestionKeyWord()">查看问题关键字</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchQuestionReplaceWord()">查看问题替换字</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:900px;height:500px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle">问题信息</div>
    <form id="fm" method="post" name="question">
        <div class="fitem" style="display: none;">
            <label>问题ID:</label>
            <input name="id" class="easyui-textbox" />
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label >案例编号:</label>
            <input name="caseNum" class="easyui-textbox" style="width: 260px;height: 30px;" >
            <label style="margin-left: 30px;width: 100px;">案例主题:</label>
            <input name="caseTitle" class="easyui-textbox" style="width: 260px;height: 30px;">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>客户名称:</label>
            <input name="clientName" class="easyui-textbox" style="width: 260px;height: 30px;" >
            <label style="margin-left: 30px;width: 100px;">问题来源:</label>
            <select name="typeId" id="selectTypeId" style="width: 260px;height: 30px;" class="easyui-select">
            </select>
        </div>

        <div class="fitem" style="margin-bottom: 15px;">
            <label>问题内容:</label>
            <script type="text/javascript">
                var ue = UE.getEditor('container').setHeight(300);
            </script>
            <!-- 加载编辑器的容器 -->
            <script id="container" name="question" style="width:750px;" type="text/plain"> </script>
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>回复内容:</label>
            <script type="text/javascript">
                var ue = UE.getEditor('container2').setHeight(300);
            </script>
            <!-- 加载编辑器的容器 -->
            <script id="container2" name="answer" style="width:750px;" type="text/plain"> </script>
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label >法律依据:</label>
            <script type="text/javascript">
                var ue = UE.getEditor('container3').setHeight(300);
            </script>
            <!-- 加载编辑器的容器 -->
            <script id="container3" name="legalBasis" style="width:750px;" type="text/plain"> </script>
        </div>

        <div class="fitem" style="margin-bottom: 15px;">
            <label >负责人:</label>
            <input name="pcharge" class="easyui-textbox" style="width: 260px;height: 30px;" >
            <label style="margin-left: 30px;width: 100px;">当前是否适用:</label>
            <select name="dqsfsy" style="width: 260px;height: 30px;" >
                <option value="1" selected="selected">适用</option>
                <option value="0">不适用</option>
            </select>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQuestion()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>
</body>
</html>
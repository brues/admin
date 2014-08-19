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
    <title>问题搜索</title>
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
        function editQuestion(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','查看问题');
                $('#fm').form('load',row);
            }
        }
        <%-- function newQuestion(){
             $('#dlg').dialog('open').dialog('setTitle','添加问题');
             $('#fm').form('clear');
             url = '${pageContext.request.contextPath}/que/saveOrUpdateQuestion.action';
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
     </script>--%>


        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/que/searchResultList.action",
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }

        function qsearch(){
            $.ajax({
                url:"${pageContext.request.contextPath}/que/searchResultList.action",
                data:{key:$("#key").val()},
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
<h2>问题搜索</h2>
<p></p>

<table id="dg" title="问题列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="caseTitle" width="50" align="center">问题主题</th>
        <th field="clientName" width="50" align="center">问题内容</th>
    </tr>
    </thead>
</table>
<%--<div id="pp" class="easyui-pagination" style="background:#efefef;border:1px solid #ccc;"
     data-options="total:2000,pageSize:10">
</div>--%>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="editQuestion()">查看问题详情</a>
    <span>关键字:</span>
    <input id="key" style="line-height:20px;border:1px solid #ccc;width: 250px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="qsearch()">搜索</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:900px;height:600px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle">问题信息</div>
    <form id="fm" method="post" name="question">
        <div class="fitem" style="display: none;">
            <label>问题ID:</label>
            <input name="id" class="easyui-textbox"  />
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label >案例编号:</label>
            <input name="caseNum" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">案例主题:</label>
            <input name="caseTitle" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>客户名称:</label>
            <input name="clientName" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">客户电话:</label>
            <input name="clientPhone" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>客户地址:</label>
            <input name="clientAddress" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
            <label style="margin-left: 30px;width: 100px;">提问时间:</label>
            <input name="askTime" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>发件人:</label>
            <input name="sender" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">发件人部门:</label>
            <input name="senderDept" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>发件人传真:</label>
            <input name="senderFax" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">问题来源:</label>
            <input name="typeName" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>问题内容:</label>
            <textarea name="question" class="easyui-textarea" style="width: 660px;height: 100px;" readonly="readonly"></textarea>
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>回复内容:</label>
            <textarea name="answer" class="easyui-textarea" style="width: 660px;height: 100px;" readonly="readonly"></textarea>
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label >法律依据:</label>
            <textarea name="legalBasis" class="easyui-textarea" style="width: 660px;height: 100px;" readonly="readonly"></textarea>
        </div>

        <div class="fitem" style="margin-bottom: 15px;">
            <label >负责人:</label>
            <input name="pcharge" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">回复人员:</label>
            <input name="answerPeo" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>负责人电话:</label>
            <input name="chargePhone" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">收件人:</label>
            <input name="addressee" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>回复形式:</label>
            <input name="shapeName" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">回答时间:</label>
            <input name="answerTime" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label>复核人:</label>
            <input name="fhr" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">复核人意见:</label>
            <input name="revComment" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label style="width: 100px;" >咨询总监复核人:</label>
            <input name="zxzjfhr" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">合伙人审核:</label>
            <input name="hhrshr" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
        <div class="fitem" style="margin-bottom: 15px;">
            <label >收件人传真:</label>
            <input name="addresseeFax" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;"  readonly="readonly">
            <label style="margin-left: 30px;width: 100px;">当前是否适用:</label>
            <input name="shiyongName" class="easyui-textbox" style="width: 260px;height: 30px;border: 0;" readonly="readonly" >
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <%--<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQuestion()" style="width:90px">Save</a>--%>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
</div>
</body>
</html>
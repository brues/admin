<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>中翰税务</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.easyui.min.js"></script>
    <style>
        html,body{width:100%;height:100%;margin:0;padding:0;}
    </style>
    <script>

        $(document).ready(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/que/findNoticeList.action",
                dataType:"json",
                success:function(data){
                    if(data.map.rows.length>0){
                        $.messager.show({
                            title:'通告',
                            msg:data.map.rows[data.map.rows.length-1].notice,
                            showType:'show'
                        });
                    }else{
                        $.messager.show({
                            title:'通告',
                            msg:'近期无通告！',
                            showType:'show'
                        });
                    }
                }
            });


        });

        function addPanel(id) {

            $.ajax({
                url:"${pageContext.request.contextPath}/basic/findPurviewById.action",
                data:{"id":id},
                dataType:"json",
                success:function(data){
                    setPanel(data.purview.purviewName,data.purview.url,"");
                }
            });

        }

        function setPanel(text, url, parameter) {
            var param = "";
            if (parameter != null) {
                param = parameter;
            }

            var html = "<div title='" + text + "' data-options='closable:true' style='padding:2px'>";
            html += "<iframe src='${pageContext.request.contextPath}" + url + param + "' width='100%' height='100%' style='border-width: 0px;'/>";
            html += "</div>";

            $('#main-tabs').tabs('add', {
                title: text,
                content: html,
                closable: true
            });
        }
    </script>



</head>
    <body>
        <div class="easyui-layout" style="width:100%;height:100%;">
            <div data-options="region:'north',split:true" title=""  style="width:100%;height:7%;text-align: right;padding-right: 15px;padding-top: 10px;">
                <label>用户：</label><span style="margin-right: 20px;">${admin_user.userName}</span>
                <a href="${pageContext.request.contextPath}/login/login.action">退出</a>
            </div>
            <div data-options="region:'south',split:true" title=""  style="width:100%;height:5%;">
            </div>
            <%--<div data-options="region:'east',split:true" title="最近浏览" style="width:13%;"></div>--%>
            <div id="divtreecaidian" data-options="region:'west'" title="菜单" style="width:13%;">
                <div class="easyui-accordion" data-options="fit:true,border:false">
                    <s:property value="treeString" escape="false"/>
                </div>
            </div>
            <div data-options="region:'center'" >
                <div id="main-tabs"  class="easyui-tabs" data-options="fit:true,border:false,plain:true">
                    <div title="欢迎" style="padding:10px;width:auto;">
                        <p style="font-size:14px">欢迎进入中翰顾问问题搜索系统</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
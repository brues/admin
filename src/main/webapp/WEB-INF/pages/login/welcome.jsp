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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>中翰税务</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/jquery-easyui/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/jquery-easyui/jquery.easyui.min.js"></script>
    <script>
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

            var html = "<div title='" + text + "' data-options='closable:true' style='padding:2px'>" +
                    "   <iframe src='${pageContext.request.contextPath}" + url + param + "' width='100%' height='100%' style='border-width: 0px;'/>" +
                    "</div>";

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
   <%-- <div data-options="region:'north'" style="height:20px;padding:2px;">
    </div>--%>
    <div id="divtreecaidian" data-options="region:'west',split:false,collapsible:false" title="菜单" style="width:250px;padding:2px;">
        <ul class="easyui-tree">
            <s:property value="treeString" escape="false"/>
        </ul>
    </div>
    <div id="main-tabs" class="easyui-tabs" data-options="region:'center'" style="width:100%;">
        <div title="Welcome" style="padding:10px;width:100%;">
            <p style="font-size:14px">欢迎进入中翰税务内部问答数据查询系统</p>
        </div>
    </div>
</div>

</body>
</html>
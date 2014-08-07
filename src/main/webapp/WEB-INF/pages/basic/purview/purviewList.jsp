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
        <title>权限分类</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/ztree/css/demo.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/ztree/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/ztree/js/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/ztree/js/jquery.ztree.excheck-3.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/ztree/js/jquery.ztree.exedit-3.5.js"></script>
        <SCRIPT type="text/javascript">
            <!--
            var setting = {
                view: {
                    addHoverDom: addHoverDom,
                    removeHoverDom: removeHoverDom,
                    selectedMulti: false
                },
                edit: {
                    enable: true
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    beforeDrag: beforeDrag,
                    beforeEditName: beforeEditName,
                    beforeRemove: beforeRemove,
                    beforeRename: beforeRename,
                    onRemove: onRemove,
                    onRename: onRename
                }
            };

            var zNodes = [{id:0,name:"根节点"}];



            var log, className = "dark";
            function beforeDrag(treeId, treeNodes) {
                return false;
            }
            function beforeEditName(treeId, treeNode) {
                className = (className === "dark" ? "":"dark");
                showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.selectNode(treeNode);
                return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
            }
            function beforeRemove(treeId, treeNode) {
                className = (className === "dark" ? "":"dark");
                showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.selectNode(treeNode);
                return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
            }
            function onRemove(e, treeId, treeNode) {
                showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            }
            function beforeRename(treeId, treeNode, newName, isCancel) {
                className = (className === "dark" ? "":"dark");
                showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
                if (newName.length == 0) {
                    alert("节点名称不能为空.");
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    setTimeout(function(){zTree.editName(treeNode)}, 10);
                    return false;
                }
                return true;
            }
            function onRename(e, treeId, treeNode, isCancel) {
                showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
            }
            function showRemoveBtn(treeId, treeNode) {
                return !treeNode.isFirstNode;
            }
            function showRenameBtn(treeId, treeNode) {
                return !treeNode.isLastNode;
            }
            function showLog(str) {
                if (!log) log = $("#log");
                log.append("<li class='"+className+"'>"+str+"</li>");
                if(log.children("li").length > 8) {
                    log.get(0).removeChild(log.children("li")[0]);
                }
            }
            function getTime() {
                var now= new Date(),
                        h=now.getHours(),
                        m=now.getMinutes(),
                        s=now.getSeconds(),
                        ms=now.getMilliseconds();
                return (h+":"+m+":"+s+ " " +ms);
            }

            var newCount = 1;
            function addHoverDom(treeId, treeNode) {
                var sObj = $("#" + treeNode.tId + "_span");
                if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
                var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                        + "' title='add node' onfocus='this.blur();'></span>";
                sObj.after(addStr);
                var btn = $("#addBtn_"+treeNode.tId);
                if (btn) btn.bind("click", function(){
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                    return false;
                });
            };

            function addOneHoverDom(treeId, treeNode) {
                zNodes[zNodes.length]={id:(parseInt(zNodes[zNodes.length-1].id)+1),pId:0,name:"new one"};
                $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            };
            function removeHoverDom(treeId, treeNode) {
                $("#addBtn_"+treeNode.tId).unbind().remove();
            };
            function selectAll() {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
            }

            $(document).ready(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/basic/findPurviewList.action",
                    dataType:"json",
                    success:function(data){
                        for(i=0;i<data.purviewList.length;i++){
                            zNodes[i]={id:data.purviewList[i].id,pId:data.purviewList[i].parentId,name:data.purviewList[i].purviewName};
                        }
                        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                        $("#selectAll").bind("click", selectAll);
                    }
                });

            });
            //-->
        </SCRIPT>
        <style type="text/css">
            .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
        </style>
    </HEAD>

    <BODY>
        <div class="content_wrap">
            <div class="zTreeDemoBackground">
                <span>权限分类</span>
                <a href="javascript:addOneHoverDom()">
                    添加一级分类
                </a>
                <ul id="treeDemo" class="ztree"></ul>
            </div>
        </div>
    </BODY>
</HTML>
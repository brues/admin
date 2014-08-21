<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/easyui/demo/demo.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/jquery/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/common/easyui/plugins/jquery.validatebox.js"></script>
        <style>
            html,body{width:100%;height:100%;margin:0;padding:0;}
        </style>
        <script type="text/javascript">
            function login(){
                if($("#username").val()==null||$("#username").val()==""){
                    $.messager.alert('提示框','用户名不能为空！','warning');
                }else if($("#password").val()==null||$("#password").val()==""){
                    $.messager.alert('提示框','密码不能为空！','warning');
                }else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/login/findUserByUserNameAndPassword.action",
                        data:{userName:$("#username").val(),password:$("#password").val()},
                        dataType:"json",
                        success:function(data){
                            if(data.userList.length==0){
                                $.messager.alert('提示框','该用户不存在！','warning');
                            }else if(data.userList.length==1){
                                $("#loginForm").attr("action","${pageContext.request.contextPath}/login/welcome.action");
                                $("#loginForm").submit();
                            }else{

                            }
                        }
                    });
                }
            }
        </script>
        <script type="text/javascript">
            document.onkeydown = function(e)
            {
                var theEvent = window.event || e;
                var code = theEvent.keyCode || theEvent.which;
                if (code == 13)
                {
                    login();
                }
            }
        </script>
    </head>
    <body>
        <div class="easyui-window" title="中翰顾问问题搜索系统" style="width:500px;padding:30px 70px 20px 70px" resizable="false" draggable="false" minimizable="false" maximizable="false" data-options="collapsible:false,closable:false">
            <form method="post" id="loginForm">
                <div style="margin-bottom:10px">
                    <input class="easyui-textbox" type="text" id="username" name="userName"  style="width:100%;height:40px;padding:12px" data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" id="password" type="password" name="password"  style="width:100%;height:40px;padding:12px" data-options="prompt:'密码',iconCls:'icon-lock',iconWidth:38">
                </div>
                <div style="margin-bottom:20px">
                    <input type="checkbox" checked="checked">
                    <span>记住我</span>
                </div>
                <div>
                    <a href="javascript:login()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
                        <span style="font-size:14px;">登录</span>
                    </a>
                </div>
            </form>
        </div>
    </body>
</html>










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
    <body style="height:100%;width:100%;overflow:hidden;border:none;visibility:visible;padding-left: 100px;" >
        <div class="easyui-window" style="width:500px;height:250px;background:#fafafa;overflow:hidden;"
             title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中翰顾问问题搜索系统"
             border="false" resizable="false" draggable="false" minimizable="false" maximizable="false" data-options="collapsible:false,closable:false">

            <div style="padding:60px 0;">
                <form method="post" id="loginForm">
                    <div style="padding-left:150px;">
                        <table cellpadding="0" cellspacing="3">
                            <tr>
                                <td>登录帐号</td>
                                <td><input id="username" name="userName"  /></td>
                            </tr>
                            <tr>
                                <td>登录密码</td>
                                <td><input id="password" type="password" name="password"  /></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a class="easyui-linkbutton" onclick="javascript:login()">登 录</a>
                                    <a class="easyui-linkbutton" onclick="javascript:document.getElementById('loginForm').reset();">重 置</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>










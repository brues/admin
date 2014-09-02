<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
        <title>中翰顾问</title>
        <style>
            html,body,div{
                width: 100%;
                margin: 0;
                padding: 0;
            }
            .sousuo{
                cursor: pointer;
                width: 102px;
                height: 35px;
                padding: 0;
                border: 0;
                background-color: #38f;
                font-size: 16px;
                color: white;
                font-family: arial, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', '宋体', \5b8b\4f53, Tahoma, Arial, Helvetica, STHeiti;
                align-items: flex-start;
                text-align: center;
                box-sizing: border-box;
                -webkit-appearance: push-button;
                -webkit-user-select: none;
                white-space: pre;
                letter-spacing: normal;
                word-spacing: normal;
                text-transform: none;
                text-indent: 0px;
                text-shadow: none;
                display: inline-block;
                -webkit-writing-mode: horizontal-tb;

            }
        </style>
    </head>
    <body>
        <div>
            <img src="/common/admin/front/img/main.jpg" width="100%"/>
        </div>
        <div style="text-align: center;background-color:cornflowerblue;height: 60px;vertical-align: middle;padding-top: 15px;">
            <form action="/que/frontList.action" >
                <input type="text" name="keyWord" style="height:35px;width:368px;"/><input type="submit" value="搜索" class="sousuo" />
            </form>
        </div>
        <div style="padding-top: 50px;text-align: center;width: 50%;padding-left: 25%;">啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦</div>
    </body>
</html>

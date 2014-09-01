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
                font-family: arial, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', '宋体', \5b8b\4f53, Tahoma, Arial, Helvetica, STHeiti
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
        <div style="text-align: center;background-color:cornflowerblue;height: 60px;vertical-align: middle;padding-top: 15px;">
            <form action="/que/frontList.action" >
                <input type="text" name="keyWord" style="height:35px;width:368px;"/><input type="submit" value="搜索" class="sousuo" />
            </form>
        </div>
        <div style="padding-left: 50px;padding-top: 50px;">
            <span style="font-size: 20;"><a href="${pageContext.request.contextPath}/que/detailQue.action">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
            <span style="font-size: 20;"><a href="javascript:void(0)">按时发生的法师打发士大夫</a></span>
            <p>阿斯顿发送到发送到发送到发是的发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到发送到 </p>
        </div>
        <div style="padding-left: 50px;padding-top: 10px;margin-bottom: 100px;">
            <span style="margin-right: 30px;"><a href="javascript:void(0)">首页</a></span>
            <span style="margin-right: 30px;"><a href="javascript:void(0)">上一页</a></span>
            <span style="margin-right: 30px;">第1/10页</span>
            <span style="margin-right: 30px;"><a href="javascript:void(0)">下一页</a></span>
            <span><a href="javascript:void(0)">尾页</a></span>
        </div>
    </body>
</html>

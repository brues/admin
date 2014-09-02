<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
        <title>问题详情</title>
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
        <div style="text-align: center;background-color:cornflowerblue;height: 60px;vertical-align: middle;padding-top: 15px;">
            <form action="/que/frontList.action" >
                <input type="text" name="keyWord" style="height:35px;width:368px;"/><input type="submit" value="搜索" class="sousuo" />
            </form>
        </div>
        <div style="padding-left: 50px;padding-top: 50px;padding-bottom: 50px;">
            <span>标题：</span>${questions.caseTitle}
            <br/><br/><br/><br/>
            <span>问题内容：</span>
            <pre width="80%" style="width:80%;">${questions.question}</pre>
            <br/><br/><br/><br/>
            <span>回复内容：</span>
            <pre style="width:80%;">${questions.answer}</pre>
            <br/><br/><br/><br/>
            <span>法规依据：</span>
            <pre style="width:80%;">${questions.legalBasis}</pre>
            <br/><br/><br/><br/>
            <span style="margin-bottom: 50px;">是否适用：</span>${questions.dqsfsy}
        </div>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
        <title>中翰顾问</title>
        <script type="text/javascript" src="/common/jquery/jquery.js"></script>
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
        <script type="text/javascript">
            function shouye(){
                toPage(1);
            }

            function weiye(){
                toPage($("#hiddenTotalPage").val());
            }

            function shangyiye(){
                var page=parseInt($("#hiddenCurrentPage").val());
                if(page-1<=0){
                    toPage(1);
                }else{
                    toPage(page-1);
                }
            }

            function xiayiye(){
                var page=parseInt($("#hiddenCurrentPage").val());
                var totalPage=parseInt($("#hiddenTotalPage").val());
                if(page+1>=totalPage){
                    toPage(totalPage);
                }else{
                    toPage(page+1);
                }
            }

            function toPage(num){
                window.location.href="${pageContext.request.contextPath}/que/frontList.action?keyWord="+$("#keyWord").val()+"&currentPage="+num;
            }
        </script>
    </head>
    <body style="background-color: #f1f1f1;">
        <div style="text-align: center;background-color:cornflowerblue;height: 50px;vertical-align: middle;padding-top: 15px;">
            <form action="/que/frontList.action" >
                <input id="keyWord" type="text" name="keyWord" value="${map.keyWord}" style="height:35px;width:368px;"/><input type="submit" value="搜索" class="sousuo" />
            </form>
        </div>
        <div style="padding-left: 50px;padding-top: 50px;">
            <c:forEach var="que"  items="${map.rows}">
                <span style="font-size: 20;"><a href="${pageContext.request.contextPath}/que/detailQue.action?id=${que.id}">${que.caseTitle}</a></span>
                <pre style="width:80%;margin-bottom: 30px;">${que.question}</pre>
            </c:forEach>
        </div>
        <div style="padding-left: 50px;padding-top: 10px;margin-bottom: 100px;">
            <span style="margin-right: 30px;"><a href="javascript:shouye()">首页</a></span>
            <span style="margin-right: 30px;"><a href="javascript:shangyiye()">上一页</a></span>
            <span style="margin-right: 30px;">第${map.currentPage}/${map.totalPage}页</span>
            <span style="margin-right: 30px;"><a href="javascript:xiayiye()">下一页</a></span>
            <span><a href="javascript:weiye()">尾页</a></span>
            <input id="hiddenCurrentPage" type="hidden" value="${map.currentPage}" />
            <input id="hiddenTotalPage" type="hidden" value="${map.totalPage}" />
        </div>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>问题关键字</title>
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
        var url;
        function newKeyWord(){
            $("#anp1").css("display","block");
            $("#anp2").css("display","block");
            $("#anp3").css("display","block");
            $("#anp4").css("display","block");
            $('#dlg').dialog('open').dialog('setTitle','添加关键字');
            $('#fm').form('clear');
            url = '${pageContext.request.contextPath}/que/saveOrUpdateKeyWord.action?questionId='+$("#questionId").val();
        }
        function editKeyWord(){
            $("#anp1").css("display","none");
            $("#anp2").css("display","none");
            $("#anp3").css("display","none");
            $("#anp4").css("display","none");
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑关键字');
                $('#fm').form('load',row);
                url = '${pageContext.request.contextPath}/que/saveOrUpdateKeyWord.action?questionId='+$("#questionId").val();
            }
        }
        function saveKeyWord(){

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
        function destroyKeyWord(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('提示框','确定删除此记录吗?',function(r){
                    if (r){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/que/deleteKeyWordById.action",
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
    </script>


    <script type="text/javascript">
        $(function(){
            dataLoads();
        });

        function dataLoads(){
            $.ajax({
                url:"${pageContext.request.contextPath}/que/findKeyWordList.action?questionId="+$("#questionId").val(),
                dataType:"json",
                success:function(data){
                    $('#dg').datagrid({
                        data:data.map

                    })
                }
            });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function(){

        });

        function changes(){
            if($("#selectTypeChange").val()=='0'){
                $("#anshuizhong").css("display","block");
                $("#anredianwenti").css("display","none");
                $("#qita").css("display","none");
            }else if(($("#selectTypeChange").val()=='1'){
                $("#anshuizhong").css("display","none");
                $("#anredianwenti").css("display","block");
                $("#qita").css("display","none");
            }else{
                $("#anshuizhong").css("display","none");
                $("#anredianwenti").css("display","none");
                $("#qita").css("display","block");
            }
        }
    </script>

</head>
<body>
<h2>关键字管理</h2>
<p></p>
<input type="hidden" id="questionId" value="${questionId}" />
<table id="dg" title="关键字列表" class="easyui-datagrid" style="width:900px;height:400px" toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="questionId" width="50" align="center">问题ID</th>
        <th field="keyWord" width="50" align="center">关键字</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newKeyWord()">添加关键字</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editKeyWord()">编辑关键字</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyKeyWord()">删除关键字</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="history.go(-1)">返回</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
    <div class="ftitle">关键字信息</div>
    <form id="fm" method="post" name="keyWord">
        <div class="fitem" style="display: none;">
            <label>关键字ID:</label>
            <input name="id" class="easyui-textbox">
        </div>
        <div>
            <select id="selectTypeChange" style="display: none;">
                <option value="0">按税种</option>
                <option value="1">按热点问题</option>
                <option value="2">其他</option>
            </select>

            <p id="anp1" style="">按税种：</p>
            <p id="anp2">
                <input name="anshuizhong"  type="checkbox" value="增值税" />增值税<input name="anshuizhong" value="消费税" type="checkbox"/>消费税<input name="anshuizhong" value="营业税" type="checkbox"/>营业税
                <input name="anshuizhong" value="企业所得税" type="checkbox"/>企业所得税<input name="anshuizhong" value="个人所得税" type="checkbox"/>个人所得税<input name="anshuizhong" value="资源税" type="checkbox"/>资源税
                <input name="anshuizhong" value="城镇土地使用税" type="checkbox"/>城镇土地使用税<input name="anshuizhong" value="房产税" type="checkbox"/>房产税<input name="anshuizhong" value="城市维护建设税" type="checkbox"/>城市维护建设税<br/>
                <input name="anshuizhong" value="耕地占用税" type="checkbox"/>耕地占用税<input name="anshuizhong" value="土地增值税" type="checkbox"/>土地增值税<input name="anshuizhong" value="车辆购置税" type="checkbox"/>车辆购置税
                <input name="anshuizhong" value="车船税" type="checkbox"/>车船税<input name="anshuizhong" value="印花税" type="checkbox"/>印花税<input name="anshuizhong" value="契税" type="checkbox"/>契税
                <input name="anshuizhong" value="烟叶税" type="checkbox"/>烟叶税<input name="anshuizhong" value="关税" type="checkbox"/>关税<input name="anshuizhong" value="船舶吨税" type="checkbox"/>船舶吨税
            </p>


            <p id="anp3">按热点问题：</p>
            <p id="anp4">
                <input name="anredianwenti" value="纳税申报" type="checkbox"/>纳税申报<input name="anredianwenti" value="税务稽查" type="checkbox"/>税务稽查<input name="anredianwenti" value="税务评估" type="checkbox"/>税务评估
                <input name="anredianwenti" value="政策口径" type="checkbox"/>政策口径<input name="anredianwenti" value="营业税改征增值税" type="checkbox"/>营业税改征增值税<input name="anredianwenti" value="对外投资分红" type="checkbox"/>对外投资分红
                <input name="anredianwenti" value="债务重组" type="checkbox"/>债务重组<input name="anredianwenti" value="房地产" type="checkbox"/>房地产<input name="anredianwenti" value="股权转让" type="checkbox"/>股权转让<br/>
                <input name="anredianwenti" value="税收优惠" type="checkbox"/>税收优惠<input name="anredianwenti" value="资产重组" type="checkbox"/>资产重组<input name="anredianwenti" value="政府补助" type="checkbox"/>政府补助
                <input name="anredianwenti" value="发票" type="checkbox"/>发票<input name="anredianwenti" value="工资薪金" type="checkbox"/>工资薪金<input name="anredianwenti" value="融资租赁" type="checkbox"/>融资租赁
                <input name="anredianwenti" value="个人所得税" type="checkbox"/>个人所得税<input name="anredianwenti" value="对外付汇" type="checkbox"/>对外付汇<input name="anredianwenti" value="涉税鉴证" type="checkbox"/>涉税鉴证

            </p>
            <div class="fitem">
                <label>自定义关键字:</label>
                <input name="keyWord" class="easyui-textbox">
            </div>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveKeyWord()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>

</body>
</html>
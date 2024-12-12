<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>你好</title>

    <script type="text/javascript" src="../../resources/js/jquery/jquery-3.6.4.js"></script>
    <script type="text/javascript" src="../../resources/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../resources/js/locale/easyui-lang-zh_CN.js"></script>
    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="../../resources/js/themes/icon.css">
    <%-- 导入默认模块的css文件   --%>
    <link rel="stylesheet" type="text/css" href="../../resources/css/easyui.css">
</head>
<body>
<%--使用class加载easyui组件的方式--%>
<div class="easyui-window" data-options="title:'标题', width:200, height:80">a simple div</div>

<%--使用js方式初始化easyui--%>
<div id="myDiv"></div>
<script type="text/javascript">
    $(function(){
        $("#myDiv").window({
            title: "js方式标题",
            onClick:function (){
                window.alert("hello");
            }
        });
    });
</script>
</body>
</html>

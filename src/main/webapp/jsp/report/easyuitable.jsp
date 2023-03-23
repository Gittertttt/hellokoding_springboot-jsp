<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2023/3/22
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="colNum">2</c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>表格转换为数据表格 - jQuery EasyUI组件功能在线演示</title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/easyui.css">
    <script type="text/javascript" src="../../resources/js/jquery/jquery-3.6.4.js"></script>
    <script type="text/javascript" src="../../resources/js/jquery.easyui.min.js"></script>
</head>
<body>
<h2>表格转换为数据表格</h2>
<p>从现有的未格式化html表转换数据表格。</p>
<div style="margin:20px 0;">
    <a href="#" class="easyui-linkbutton" onclick="transform()">Transform</a>
</div>
<table id="dg" style="width:800px;height:auto;border:1px solid #ccc;">
    <%--    固定头--%>
    <thead data-options="frozen:true">
    <tr>
        <th data-options="field:'itemid', width:240">Item ID</th>
    </tr>
    </thead>
    <%--    活动头--%>
    <thead>
    <tr>
        <c:forEach var="i" begin="1" end="${colNum}">
            <th data-options="colspan:2, halign:'left'">产品序号${i}</th>
        </c:forEach>
        <th data-options="field:'attr1', width:480, rowspan:2">Attribute</th>
    </tr>
    <tr>
        <c:forEach var="i" begin="1" end="${colNum}">/th>
            <th data-options="field:'productid${i}', width:200">Product</th>
            <th data-options="field:'listprice${i}',halign:'left', align:'right', width:200">List Price</th>
        </c:forEach>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>EST-1</td>
        <c:forEach var="i" begin="1" end="${colNum}">
            <td>FI-SW-0${i}</td>
            <td>36.50 + ${i - 1}</td>
        </c:forEach>
        <td>Large</td>
    </tr>
<%--    <tr>--%>
<%--        <td>EST-10</td>--%>
<%--        <td>K9-DL-01</td>--%>
<%--        <td>18.50</td>--%>
<%--        <td>Spotted Adult Female</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>EST-11</td>--%>
<%--        <td>RP-SN-01</td>--%>
<%--        <td>28.50</td>--%>
<%--        <td>Venomless</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>EST-12</td>--%>
<%--        <td>RP-SN-01</td>--%>
<%--        <td>26.50</td>--%>
<%--        <td>Rattleless</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>EST-13</td>--%>
<%--        <td>RP-LI-02</td>--%>
<%--        <td>35.50</td>--%>
<%--        <td>Green Adult</td>--%>
<%--    </tr>--%>
    </tbody>
</table>

<script>
    function transform() {
        console.log("开始转换")
        $('#dg').datagrid({
            // frozenColumns: 'itemid'
        });
    }
</script>
</body>
</html>

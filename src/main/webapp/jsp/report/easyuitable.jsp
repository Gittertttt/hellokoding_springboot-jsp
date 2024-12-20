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
<c:set var="rowNum">5</c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>表格转换为数据表格 - jQuery EasyUI组件功能在线演示</title>

    <script type="text/javascript" src="../../resources/js/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../../resources/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../resources/js/locale/easyui-lang-zh_CN.js"></script>
    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="../../resources/js/themes/icon.css">
    <%-- 导入默认模块的css文件   --%>
    <link rel="stylesheet" type="text/css" href="../../resources/css/easyui.css">
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
        <th data-options="field:'attr1', width:80, rowspan:2">Attribute</th>
    </tr>
    <tr>
        <c:forEach var="i" begin="1" end="${colNum}">/th>
            <th data-options="field:'productid${i}', width:160">Product</th>
            <th data-options="field:'listprice${i}',halign:'left', align:'right', width:100">List Price</th>
        </c:forEach>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="rowItem" begin="1" end="${rowNum}">
        <tr>
            <td>EST-${rowItem}</td>
            <c:forEach var="i" begin="1" end="${colNum}">
                <td>
                    <input id="FI${i}" value="FI-SW-0${i}" onblur="inputChange(${i})">
                    <input id="hid_FI${i}" type="hidden" value="FI-SW-0${i}">
                </td>
                <td>36.50 + ${i - 1}</td>
            </c:forEach>
            <td>Large</td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="3">COUNT</td>
    </tr>
    </tbody>
</table>

<script>
    function inputChange(index) {
        var newInput = $("#FI" + index).val();
        var hiddenInput =  $("#hid_FI" + index).val();
        $("#hid_FI" + index).val(newInput);
        console.log(newInput + " & " + $("#hid_FI" + index).val());
    }
    $("#dg").hide();
    $("#dg").datagrid({
        onLoadSuccess: function(){
            //datagrid头部 table 的第一个tr 的td们，即columns的集合
            var headerTds = $(".datagrid-header-inner table tr:first-child").children();
            //datagrid主体 table 的第一个tr 的td们，即第一个数据行
            var bodyTds = $(".datagrid-body table tr:first-child").children();
            var totalWidth = 0; //合计宽度，用来为datagrid头部和主体设置宽度
            //循环设置宽度
            bodyTds.each(function (i, obj) {
                var headerTd = $(headerTds.get(i));
                var bodyTd = $(bodyTds.get(i));
                $("div:first-child", headerTds.get(i)).css("text-align", "center");
                var headerTdWidth = headerTd.width(); //获取第i个头部td的宽度
                //这里加5个像素 是因为数据主体我们取的是第一行数据，不能确保第一行数据宽度最宽，预留5个像素。有兴趣的朋友可以先判断最大的td宽度都在进行设置
                var bodyTdWidth = bodyTd.width() + 5;
                var width = 0;
                //如果头部列名宽度比主体数据宽度宽，则它们的宽度都设为头部的宽度。反之亦然
                if (headerTdWidth > bodyTdWidth) {
                    width = headerTdWidth;
                    bodyTd.width(width);
                    headerTd.width(width);
                    totalWidth += width;
                } else {
                    width = bodyTdWidth;
                    headerTd.width(width);
                    bodyTd.width(width);
                    totalWidth += width;
                }
            });
            var headerTable = $(".datagrid-header-inner table:first-child");
            var bodyTable = $(".datagrid-body table:first-child");
            //循环完毕即能得到总得宽度设置到头部table和数据主体table中
            headerTable.width(totalWidth);
            bodyTable.width(totalWidth);
            bodyTds.each(function (i, obj) {
                var headerTd = $(headerTds.get(i));
                var bodyTd = $(bodyTds.get(i));
                var headerTdWidth = headerTd.width();
                bodyTd.width(headerTdWidth);
            });
        }
    });

    function transform() {
        console.log("开始转换")
        $('#dg').datagrid({
            autoRowHeight: false,
            loadMsg: "暂停",
            onLoadSuccess: function () {
                $("#dg").datagrid("reload");
                $('#dg').datagrid("options").view.onBeforeRender = function (target, rows) {
                    console.log("1.渲染前操作");
                    alert("1.渲染前完成");
                };
                $('#dg').datagrid("options").view.onAfterRender = function (target, rows) {
                    console.log("2.渲染后操作");
                    alert("2.渲染后完成");
                };
            }
        });
    }

    // $('#dg').datagrid("options").view.onBeforeRender = function (target, rows) {
    //     console.log("渲染前操作2");
    //     alert("渲染前完成2");
    // };
    //
    // $('#dg').datagrid("options").view.onAfterRender = function (target, rows) {
    //     console.log("渲染后操作");
    //     alert("渲染后完成");
    // };
</script>
</body>
</html>

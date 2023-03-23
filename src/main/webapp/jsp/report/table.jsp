<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2023/3/14
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <title>表格</title>
    <style>
        .fixed-table-box{
            width: auto;
            margin: 100px auto;
        }
        .fixed-table-box>.fixed-table_body-wraper{/*内容了表格主体内容有纵向滚动条*/
            max-height: 260px;
        }

        .fixed-table_fixed>.fixed-table_body-wraper{/*为了让两侧固定列能够同步表格主体内容滚动*/
            max-height: 240px;
        }

        <%-- 表格滚动 --%>
        /*table {*/
        /*    table-layout: fixed;*/
        /*    width: 100%;*/
        /*    !* 取消每个框之间分离 *!*/
        /*    !*border-collapse: separate;*!*/
        /*    !*border-spacing: 0;*!*/
        /*}*/

        <%-- 设置 行内内容长度 --%>
        th td {
            /*box-sizing: border-box;*/
            /*overflow: hidden;*/
            /*white-space: nowrap;*/
            /*text-overflow: ellipsis;*/
        }

        <%--   表头固定     --%>
        thead tr th {
            /*position: sticky;*/
            /*top: 0;*/
            /*其他*/
            background: burlywood;
            height: 30px;
        }

        <%-- 首列固定 --%>
        /*th:first-child,*/
        /*td:first-child {*/
        /*    position: sticky;*/
        /*    left: 0;*/
        /*    !*首列居中*!*/
        /*    text-align: center;*/
        /*    width: 60px;*/
        /*    background: burlywood;*/
        /*}*/

        /*th:first-child {*/
        /*    z-index: 3;*/
        /*}*/
    </style>
    <link rel="stylesheet" href="../../resources/css/fixed-table.css">
    <script type="text/javascript" src="../../resources/js/jquery/jquery-3.6.4.js"></script>
    <script src="../../resources/js/jquery/fixed-table.js"></script>
</head>

<body>
<c:set var="rowNum">20</c:set>
<div class="fixed-table-box row-col-fixed fileds[{}]">
    <%-- 表头 --%>
    <div class="fixed-table_header-wraper">
        <table class="fixed-table_header"><colgroup></colgroup>
            <thead>
            <tr>
                <th rowspan="2" data-fixed="true" data-width="60px">
                    <div class="">序号</div>
                </th>
                <c:forEach var="i" begin="1" end="${colNum}" step="1">
                <th>
                    <div class="table-cell">标题${i}</div>
                </th>
                </c:forEach>
                <th>
                    <div class="table-cell">操作</div>
                </th>
            </tr>
            </thead>
        </table>
    </div>
    <%-- 表头 --%>

    <%-- 表体 --%>
    <div class="fixed-table_body-wraper">
        <table class="fixed-table_body">
            <c:forEach var="i" begin="1" end="${rowNum}" step="1">
            <tr>
                <td>
                    <div class="table-cell">${i}
                    </div>
                </td>
                <c:forEach var="j" begin="1" end="${colNum}" step="1">
                <td>
                    <div class="table-cell">内容${j}</div>
                </td>
                </c:forEach>
                <td>
                    <div class="table-cell"><a href="#">修改</a></div>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>

    <!-- 固定列 start -->
    <div class="fixed-table_fixed fixed-table_fixed-left no-shadow">
        <div class="fixed-table_header-wraper">
            <table class="fixed-table_header">
                <thead>
                <tr>
                    <th rowspan="2" data-fixed="true" data-width="60px">
                        <div class="" style="background: darkred">序号</div>
                    </th>
                </tr>
                </thead>
            </table>
        </div>

        <div class="fixed-table_body-wraper">
            <table class="fixed-table_body">
                <tbody>
                <c:forEach var="i" begin="1" end="${rowNum}" step="1">
                <tr class="">
                    <td>
                        <div class="table-cell">序号${i}
                        </div>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 固定列 start -->

        <!-- 固定最右列 start -->
        <div class="fixed-table_fixed fixed-table_fixed-right no-shadow">
            <div class="fixed-table_header-wraper">
                <table class="fixed-table_header" style="width: 60px">
                    <thead>
                    <tr>
                        <th>
                            <div class="table-cell">操作</div>
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- 固定列 start -->
</div>

<script>
    $(".fixed-table-box").fixedTable();
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2023/3/14
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表格</title>
    <style>
        .table_wrap {
            width: 100%;
            height: 1000px;
            /*overflow: auto;*/
            border-bottom:1px solid #61dafb;
        }

        table {
            table-layout: fixed;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border: 1px solid #DDDDDD;
        }

        /* 表格th/td样式 */
        td,th {
            width: 150px;
            box-sizing: border-box;
            border-right: 1px solid #DDDDDD;
            border-bottom: 1px solid #DDDDDD;
            /*超出长度...*/
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            height: 30px;

        }

        /* 表头固定 */
        thead tr th {
            position: sticky;
            top: 0;
            background: #F4F4F5;
            height: 30px;
        }

        /* 首列固定*/
        th:first-child,
        td:first-child {
            position: sticky;
            left: 0;
            background: #F4F4F5;
            text-align: center;
            right: 0px;
            border-left: 1px solid #DDDDDD ;
            width: 100px;
        }

        /* 表头首列强制最顶层 */
        th:first-child {
            z-index: 3;
            /*左上角单元格z-index，切记要设置，不然表格纵向横向滚动时会被该单元格右方或者下方的单元格遮挡*/
            background: #F4F4F5;
        }
    </style>
</head>
<body>
<div class="table_wrap">
    <table>
        <%-- 表头 --%>
        <thead>
            <tr>
                <th>序号</th>
                <th>标题1</th>
                <th>标题2</th>
                <th>标题3</th>
                <th>标题4</th>
                <th>标题5</th>
                <th>操作</th>
            </tr>
        </thead>
        <%-- 表体 --%>
        <tbody>
            <% for(int i = 0; i<20; i++) { %>
            <tr>
                <td><%=i+1%></td>
                <td>内容1</td>
                <td>内容2</td>
                <td>内容3</td>
                <td>内容4</td>
                <td>内容5</td>
                <td><a href="#">修改</a></td>
            </tr>
            <% } %>

        </tbody>
    </table>
</div>

</body>
</html>

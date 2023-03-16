<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2023/3/14
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>表格</title>
    <style>
        .fixed-table-box{
            /*width: 800px;*/
            margin: 50px auto;
        }
        .fixed-table-box>.fixed-table_body-wraper{/*内容了表格主体内容有纵向滚动条*/
            max-height: 260px;
        }

        .fixed-table_fixed>.fixed-table_body-wraper{/*为了让两侧固定列能够同步表格主体内容滚动*/
            max-height: 240px;
        }

        .table_self_define {
            width: 1800px;
            height: 1000px;
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
            /*width: 80px;*/
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
    <%--<script type="text/javascript">--%>
    <%--    // 判断浏览器是否支持sticky 属性--%>
    <%--    var sticky = (function () {--%>
    <%--        var vendorList = ['', '-webkit-', '-ms-', '-moz-', '-o-'],--%>
    <%--            vendorListLength = vendorList.length,--%>
    <%--            stickyElement = document.createElement('div');--%>
    <%--        for (var i = 0; i < vendorListLength; i++) {--%>
    <%--            stickyElement.style.position = vendorList[i] + 'sticky';--%>
    <%--            console.log('stickyElement',stickyElement)--%>
    <%--            if (stickyElement.style.position !== '') {--%>
    <%--                return true;--%>
    <%--            }--%>
    <%--        }--%>
    <%--        return false;--%>
    <%--    })();--%>

    <%--    // 设置元素的fiexd属性--%>
    <%--    function divFixedTop (ele,top) {--%>
    <%--        let scrollTop = $(window).scrollTop() + top;  //滚动条的位置加上当前元素的fixed的top值(用来动态设置fixed的top值的触发点)--%>
    <%--        let parentTop = $(ele).parent().height() + $(ele).parent().offset().top;   //获取当前元素的父元素距离文档的top值加上父元素的高度(用来限制子元素在父元素的底部活动范围)--%>
    <%--        let eleRelativePosition = $(ele).parent().height() - $(ele).height(); //获取fixed后子元素在父元素里面的活动范围(超出则改变子元素的fixed属性为relative,并赋值给子元素的relative的top上)--%>
    <%--        let thisTop = $(ele).data("top");  //获取当前元素存储在元素属性当前的top值--%>
    <%--        let margin_top = $(ele).data("margin-top").slice(0,$(ele).data("margin-top").length - 2);  //获取当前元素存储在元素dom属性上的margin-top值并截取掉除px的值--%>
    <%--        let left = $(ele).offset().left;  //获取元素静态时距离页面左边的偏移量,用来设置fixed的left值--%>
    <%--        if (scrollTop >= thisTop - margin_top) {--%>
    <%--            $(ele).css({--%>
    <%--                'position': 'fixed',--%>
    <%--                'bottom': 'auto',--%>
    <%--                'margin-top': '0px',--%>
    <%--                'top': top + 'px',--%>
    <%--                'left': left + 'px'--%>
    <%--            })--%>
    <%--        } else if (scrollTop <= thisTop + margin_top){--%>
    <%--            $(ele).css({--%>
    <%--                'position': 'static',--%>
    <%--                'margin-top': margin_top + 'px',  //精确fixed的top值--%>
    <%--                'top': '',--%>
    <%--                'left': ''--%>
    <%--            })--%>
    <%--        }--%>
    <%--        if ((parentTop - $(ele).height()) <= scrollTop) {--%>
    <%--            $(ele).css({--%>
    <%--                'position': 'relative',--%>
    <%--                'margin-top': '0px',--%>
    <%--                'top': eleRelativePosition,--%>
    <%--                'left': ''--%>
    <%--            })--%>
    <%--        }--%>
    <%--    };--%>

    <%--    //如果当前浏览器不兼容position: sticky,属性--%>
    <%--    if (!sticky) {--%>
    <%--        //每次滚动就监测调用divViewHeight()方法,判断是否到达触发点--%>
    <%--        $(window).on('scroll',function() {--%>
    <%--            divFixedTop('.table_self_define',0);--%>
    <%--        })--%>
    <%--    }--%>
    <%--</script>--%>
</head>

<body>
<div class="fixed-table-box row-col-fixed">
    <%-- 表头 --%>
    <div class="fixed-table_header-wraper">
        <table class="fixed-table_header">
            <thead>
            <tr>
                <th data-fixed="true">
                    <div class="table-cell">序号</div>
                </th>
                <th>
                    <div class="table-cell">标题1</div>
                </th>
                <th>
                    <div class="table-cell">标题2</div>
                </th>
                <th>
                    <div class="table-cell">标题3</div>
                </th>
                <th>
                    <div class="table-cell">标题4</div>
                </th>
                <th>
                    <div class="table-cell">标题5</div>
                </th>
                <th>
                    <div class="table-cell">标题6</div>
                </th>
                <th>
                    <div class="table-cell">标题7</div>
                </th>
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
            <% for (int i = 0; i < 20; i++) { %>
            <tr>
                <td>
                    <div class="table-cell"><%=i + 1%>
                    </div>
                </td>
                <td>
                    <div class="table-cell">内容1</div>
                </td>
                <td>
                    <div class="table-cell">内容2</div>
                </td>
                <td>
                    <div class="table-cell">内容3</div>
                </td>
                <td>
                    <div class="table-cell">内容4</div>
                </td>
                <td>
                    <div class="table-cell">内容5</div>
                </td>
                <td>
                    <div class="table-cell">内容6</div>
                </td>
                <td>
                    <div class="table-cell">内容7</div>
                </td>
                <td>
                    <div class="table-cell"><a href="#">修改</a></div>
                </td>
            </tr>
            <% } %>
        </table>
    </div>

    <!-- 固定列 start -->
    <div class="fixed-table_fixed fixed-table_fixed-left no-shadow">
        <div class="fixed-table_header-wraper">
            <table class="fixed-table_header">
                <thead>
                <tr>
                    <th>
                        <div class="table-cell">序号</div>
                    </th>
                </tr>
                </thead>
            </table>
        </div>

        <div class="fixed-table_body-wraper">
            <table class="fixed-table_body">
                <tbody>
                <% for (int i = 0; i < 20; i++) { %>
                <tr class="">
                    <td>
                        <div class="table-cell">序号<%=i + 1%>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
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

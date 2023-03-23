<%--
  Created by IntelliJ IDEA.
  User: yq
  Date: 2023/3/17
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表格的冻结列实现</title>
    <script src="../../resources/js/jquery/jquery-3.6.4.js" type="text/javascript"></script>
</head>
<body>
<!--如果冻结列不好使，给tableDiv也设置一个position:relative;-->
<div id="tableDiv" style="width:500px;overflow-x:auto;">
    <table style="width:720px;">
        <thead>
        <tr>
            <td rowspan="2" style="width:200px;">迭代名称</td>
            <td style="width:80px;">得分</td>
            <td style="width:100px;">代码覆盖率</td>
            <td style="width:120px;">新需求个数</td>
            <td style="width:160px;">通过的需求个数</td>
            <td style="width:160px;">未通过的需求个数</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>迭代一</td>
            <td>45</td>
            <td>56%</td>
            <td>450</td>
            <td>12</td>
            <td>90</td>
        </tr>
        <tr>
            <td>迭代五</td>
            <td>36</td>
            <td>78%</td>
            <td>216</td>
            <td>97</td>
            <td>12</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        <tr>
            <td>迭代三</td>
            <td>37</td>
            <td>91%</td>
            <td>404</td>
            <td>17</td>
            <td>34</td>
        </tr>
        </tbody>
    </table>
</div>
<script>
    $("#tableDiv").scroll(function () {//给table外面的div滚动事件绑定一个函数
        var left = $("#tableDiv").scrollLeft();//获取滚动的距离
        var trs = $("#tableDiv table tr");//获取表格的所有tr
        trs.each(function (i) {//对每一个tr（每一行）进行处理
//获得每一行下面的所有的td，然后选中下标为0的，即第一列，设置position为相对定位
//相对于父div左边的距离为滑动的距离，然后设置个背景颜色，覆盖住后面几列数据滑动到第一列下面的情况
//如果有必要也可以设置一个z-index属性
            $(this).children().eq(0).css({
                "position": "relative",
                "top": "0px",
                "left": left,
                "background-color": "red"
            });
        });
    });
</script>
</body>
</html>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>你好</title>
</head>
<body>
<h>Hello ${name}</h>
<form id="pageForm">
    <input type="button" id="toBaidu" value="跳转">
</form>
</body>
</html>

<script type="text/javascript" src="resources/js/jquery/jquery-3.6.4.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#toBaidu").click(function () {
            alert("准备跳转到页面");
            windows.location.href = "www.baidu.com";
        });
    });
</script>
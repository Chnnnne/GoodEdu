<%--
  Created by IntelliJ IDEA.
  User: 95266
  Date: 2020/11/5
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>郑州大学欢迎您</title>
</head>
<body>
<%--导航条--%>
<%@ include file="TeaNavbar.jsp"%>
<%--视频--%>
<div align="center">
    <video  width="640" height="480" autoplay="autoplay" controls="controls">

        <source src="video/zzu.mp4" type="video/mp4"></source>

    </video>
</div>
<br> <br>
<%--下载--%>
<button type="button" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <a href="video/zzu.mp4">下载视频</a>
</button>
<%--底部--%>
<%@ include file="info.jsp"%>
</body>
</html>

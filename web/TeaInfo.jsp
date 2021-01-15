<%@ page import="cn.itcast.domain.User" %>
<%@ page import="cn.itcast.dao.UserDao_Tea" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 95266
  Date: 2020/10/30
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>
<%--导航条--%>
<%@ include file="TeaNavbar.jsp"%>

<%
    User user = (User) session.getAttribute("user");
    UserDao_Tea userDao_tea = new UserDao_Tea();
    Map<String, Object> stringObjectMap = userDao_tea.SelectInfo(user);
    String Dname=userDao_tea.SelectDname(user);
    Iterator<Map.Entry<String, Object>> iterator = stringObjectMap.entrySet().iterator();

%>
<h1  align="center"><font size="10">我的信息</font></h1>
<h3>我的头像</h3>
<%--展示头像--%>
<img width="11%" class="img-circle" src="jpgFromClient/<%=user.getUsername()%>.jpg?timestamp=<%=new Date().getTime()%>" alt="您未上传过图片">

<%--上传头像--%>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
    <input type="file" name="MyFile">

    <button type="button" class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-upload" aria-hidden="true"></span> <input type="submit" value="上传">
    </button>
    <hr>
    <br>
    <h4>${msg}</h4>

</form>
<%--展示信息--%>
<table class="table table-bordered table-hover table-condensed table-responsive table-striped" style="width: 70%">
    <h1>我的信息：</h1><br><br>
    <tr>
        <td>用户名</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>教师工号</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>姓名</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>性别</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>生日</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>职位</td>
        <td><%=iterator.next().getValue()%></td>
    </tr>
    <tr>
        <td>所属院系</td>
        <td><%=Dname%></td>
    </tr>




</table>
</body>
</html>

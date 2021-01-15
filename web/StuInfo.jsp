<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>


<body>
<%--导航条--%>
<%@ include file="StuNavbar.jsp"%>

<%

    User user = (User)session.getAttribute("user");
    UserDao1_login_Stu userDao1_loginStu = new UserDao1_login_Stu();
    List<Map<String, Object>> list = userDao1_loginStu.SelectInfo(user);

    ArrayList<Object> valuelist=new ArrayList<>();
    
    for (Map<String, Object> stringObjectMap : list) {
        for (String s : stringObjectMap.keySet()) {
           valuelist.add(stringObjectMap.get(s));
        }
    }

%>
<h1  align="center"><font size="10">我的信息</font></h1>
<h3>我的头像</h3>
<%--显示头像--%>
<img width="11%" class="img-circle" src="jpgFromClient/<%=user.getUsername()%>.jpg?timestamp=<%=new Date().getTime()%>" alt="头像">
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
<%--展示表格信息--%>
<table style="width:600px " class="table table-bordered table-hover table-condensed table-responsive table-striped">
    <tr>
        <td>用户名</td>
        <td><%=valuelist.get(0)%></td>
    </tr>
    <tr>
        <td>学号</td>
        <td><%=valuelist.get(1)%></td>
    </tr>
    <tr>
        <td>姓名</td>
        <td><%=valuelist.get(2)%></td>
    </tr>
    <tr>
        <td>性别</td>
        <td><%=valuelist.get(3)%></td>
    </tr>
    <tr>
        <td>生日</td>
        <td><%=valuelist.get(4)%></td>
    </tr>
    <tr>
        <td>入学时间</td>
        <td><%=valuelist.get(5)%></td>
    </tr>
    <tr>
        <td>专业</td>
        <td><%=valuelist.get(6)%></td>
    </tr>




</table>
<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

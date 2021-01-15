<%--
  Created by IntelliJ IDEA.
  User: 95266
  Date: 2020/10/15
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>注册页面</title>
</head>
<body>
<%--表单--%>
<div class="box">
    <h2>Register</h2>
<form action="/test/RegisterServlet" method="post">

    <div class="box1">
        账号
        <input type="text" name="username" >
    </div>
    <div class="box1">
        密码
        <input type="password" name="password" >
    </div>
    <div class="box1">
        学号/工号
        <input type="text">
    </div>
    性别：
        <input type="radio" name="gender" value="male" checked>男
        <input type="radio" name="gender" value="female">女 <br><br>

    选择家乡:
    <select name="hometowen" id="hometown">
        <option value="shanghai">上海</option>
        <option value="">北京</option>
        <option value="">南京</option>
        <option value="">武汉</option>
        <option value="">深圳</option>
        <option value="">广州</option>
    </select>
    <br>
    <br>
    <br>

    我的爱好:
    <select name="hobby" id="hobby" multiple size="2">
        <option value="">篮球</option>
        <option value="">羽毛球</option>
        <option value="">乒乓球</option>
        <option value="">击剑</option>
        <option value="">游泳</option>
    </select>
    <div class="box2">
        <input type="submit"value="欢迎加入X-Edu" />
    </div>
</form>
</div>



</body>
</html>

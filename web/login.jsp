<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎来到X-Edu教务系统</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script>
        function refresh() {
            LoginForm1.img1.src="/test/checkCodeServlet?time="+Math.random();
        }
        function refresh2(){
            LoginForm2.img2.src="/test/checkCodeServlet?time="+Math.random();
        }
    </script>

    <style>
        div{
            color: white;
        }
    </style>

</head>
<body>
<%--cookie验证是否保存登录--%>
<%
    boolean flag1=false;
    boolean flag2=false;
    String user=null;
    String password=null;
    Cookie[] cookies = request.getCookies();
    if(cookies!=null)
    {
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals("username"))
            {
                user=cookie.getValue();
                flag1=true;
            }
            if(cookie.getName().equals("password"))
            {
                password=cookie.getValue();
                flag2=true;
            }
            if(flag1&&flag2)
                break;
        }

    }
    if(flag1&&flag2)
    {%>
<!-- 以下是记录登录状态对应的--->
<h2>记住</h2>
<div class="box">
    <h2>Login</h2>

    <form name="LoginForm2" action="${pageContext.request.contextPath}/loginServlet" method="post">

        <div class="box1">
            <img src="img/user.png" />&nbsp;&nbsp;
            <input type="text" placeholder="账号" name="username" value="<%=user%>" />
        </div>

        <div class="box1">
            <img src="img/password.png" />&nbsp;&nbsp;
            <input type="password" placeholder="密码" name="password" value="<%= password %>"  />
        </div>

        <div class="box1">
            <img src="img/password.png" />&nbsp;&nbsp;
            <input type="text" placeholder="验证码" name="checkCode1" />
        </div>
        <img name="img2" id="img2" src="/test/checkCodeServlet" onclick="refresh2()">

        <br>
            <input type="checkbox" name="remember" value="true" checked> 记住我的登录状态(10min内有效)
        <br>
        <a href="register.jsp">注册</a>
        <div class="box2">
            <input type="submit"value="Login" />
        </div>

    </form>
    <div><%=request.getAttribute("cc_error") == null ? "" : request.getAttribute("cc_error")%></div>
    <div><%=request.getAttribute("login_error") == null ? "" : request.getAttribute("login_error") %></div>
</div>
<%
}
else{
%>
<!-- 以下是没记录登录状态对应的--->
<h2>没记住</h2>
<div class="box">
    <h2>Login</h2>
    <form name="LoginForm1" action="${pageContext.request.contextPath}/loginServlet" method="post">

        <div class="box1">
            <img src="./img/user.png" />&nbsp;&nbsp;
            <input type="text" placeholder="账号" name="username" />
        </div>

        <div class="box1">
            <img src="img/password.png" />&nbsp;&nbsp;
            <input type="password" placeholder="密码"name="password"/>
        </div>

        <div class="box1">
            <img src="img/password.png" />&nbsp;&nbsp;
            <input type="text" placeholder="验证码" name="checkCode1"/>
        </div>
            <img name="img1" id="img1" src="/test/checkCodeServlet" onclick="refresh()">
        <br>
            <input type="checkbox" name="remember" value="true"> 记住我的登录状态(10min内有效)
        <br>

        <a href="register.jsp">注册</a>

        <div class="box2">
            <input type="submit"value="Login"  />
        </div>
        <br>
        <a href="Admin_Book.jsp"><font color="#f0f8ff">教材管理员入口</font></a>
    </form>

    <div><%=request.getAttribute("cc_error") == null ? "" : request.getAttribute("cc_error")%></div>
    <div><%=request.getAttribute("login_error") == null ? "" : request.getAttribute("login_error") %></div>

</div>
<%
    }
%>

<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

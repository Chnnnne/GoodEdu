<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.alibaba.druid.util.JdbcUtils" %>
<%@ page import="cn.itcast.util.JDBCUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 95266
  Date: 2020/10/28
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选课系统</title>

</head>


<body>
<%--导航条--%>
<%@ include file="StuNavbar.jsp"%>

<%
    User user = (User)session.getAttribute("user");
    String username = user.getUsername();
    String sql="Select C.Courses From ChooseCourses C,Students S where C.Sno=S.Sno and S.Username='"+username+"'";
    Connection connection = JDBCUtils.getConnection();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(sql);

    Object isRepeat = session.getAttribute("isRepeat");
    if(isRepeat!=null){
        if((Boolean)isRepeat){
            session.removeAttribute("isRepeat");
%>
<script>
    window.alert("不能重复选课！！！");
</script>
<%
        }
    }
%>
<h1 style="text-align: center">欢迎来到郑州大学选课系统!</h1><br><br>
<h2>大二学年选课目录</h2>

<table style="width:600px" class="table table-bordered table-hover table-condensed table-responsive table-striped">
    <form action="ChooseCorsServlet">
    <tr>
        <td>大学物理</td>
        <td>选修</td>
        <input type="hidden" name="Cname" value="大学物理">
        <td><input type="submit" value="选课"></td>
    </tr>
    </form>
    <form action="ChooseCorsServlet">
    <tr>
        <td>微积分</td>
        <td>选修</td>
        <input type="hidden" name="Cname" value="微积分">
        <td><input  type="submit" value="选课"></td>
    </tr>
    </form>
    <form action="ChooseCorsServlet">
    <tr>
        <td>线性代数</td>
        <td>选修</td>
        <input type="hidden" name="Cname" value="线性代数">
        <td><input  type="submit" value="选课"></td>
    </tr>
    </form>
</table>

</form>
<br><br>
<hr><br>



<h1>我所选的课</h1>
<table style="width:600px" class="table table-bordered table-hover table-condensed table-responsive table-striped">
<%


    while (resultSet.next())
    {
        String string = resultSet.getString(1);
        %>
    <form action="DeleteCorsServlet">
    <tr>
        <td><%=string%></td>
        <input type="hidden" name="Cname" value="<%=string%>">
        <td><input type="submit" value="退课"></td>
    </tr>
    </form>

    <%
    }
%>

</table>

<%@ include file="info.jsp"%>
</body>
</html>

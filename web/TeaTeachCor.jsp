<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.itcast.util.JDBCUtils" %>
<%@ page import="jdk.nashorn.api.tree.WhileLoopTree" %>
<%@ page import="static jdk.javadoc.internal.doclets.formats.html.markup.RawHtml.nbsp" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: 95266
  Date: 2020/10/30
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我所教授的课程</title>
</head>


<%
    User user = (User) session.getAttribute("user");

    Connection conn = null;
    Statement statement=null;
    PreparedStatement pstmt = null;
    ResultSet resultSet=null;
    try {
        String sql1="Select Cname,TCscore " +
                "from Teachers T,Teaches TS,Courses C " +
                "Where Username='"+user.getUsername()+"'" +
                "and T.Tno=TS.Tno" +
                " and TS.Cno=C.Cno";
        conn= JDBCUtils.getConnection();
        statement = conn.createStatement();
        resultSet = statement.executeQuery(sql1);
%>

<body>
<%--导航条--%>
<%@ include file="TeaNavbar.jsp"%>
<h1>我所教授的课程</h1>

<table class="table table-bordered table-hover table-condensed table-responsive table-striped" style="width: 60%">
    <tr>
        <th>课程名</th>
        <th colspan="2">教学评分</th>
    </tr>
<%
    while(resultSet.next()){
        String Cname = resultSet.getString(1);
        int TCscore=resultSet.getInt(2);
%>
    <tr>
        <td><%=Cname%></td>
        <td><%=TCscore%></td>
        <td><a href="TeaCorStu_2.jsp?Cname=<%=Cname%>">查看更多信息</a></td>
    </tr>
<%
        }


    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        //6. 释放资源
        JDBCUtils.close(resultSet,pstmt,statement,conn);
    }
%>
</table>
<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

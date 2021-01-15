<%@ page import="cn.itcast.domain.User" %>
<%@ page import="cn.itcast.util.JDBCUtils" %>

<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.net.URLDecoder" %>

<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%!int countNormal=0;
    int countFail=0;
    int countGood=0;%>
<%
    User user = (User) session.getAttribute("user");
    String Cname = request.getParameter("Cname");
    Connection conn = null;
    Statement statement=null;
    PreparedStatement pstmt = null;
    ResultSet resultSet=null;
    try {
        String sql="Select S.Sno,S.Sname,SC.Grade " +
                "from Teachers T,Teaches Te,Courses C,SC,Students S " +
                "where T.Username='"+user.getUsername() +"' " +
                "and C.Cname='"+ Cname+"' " +
                "and T.Tno=Te.Tno " +
                "and Te.Cno=C.Cno " +
                "and C.Cno=SC.Cno " +
                "and SC.Sno=S.Sno " +
                "ORDER BY SC.Grade DESC ";


        conn= JDBCUtils.getConnection();
        statement = conn.createStatement();
        resultSet = statement.executeQuery(sql);

%>
<head>
    <title><%=Cname%>的详细信息</title>
    <script>
        function yanzheng(){
            alert("您是否要从该课程中移除该学生！！！")
        }
    </script>
</head>
<body>
<%--导航条--%>
<%@ include file="TeaNavbar.jsp"%>
<h1>《<%=Cname%>》课程所有的学生及其成绩</h1><br><br><br>
<%--表格信息--%>
<div>
<%--    <form action="">--%>
<table class="table table-bordered table-hover table-condensed table-responsive " style="width: 60%">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>成绩</th>
        <th>操作</th>
    </tr>



    <%
        while (resultSet.next())
        {
            int Grade = resultSet.getInt(3);
            if(Grade>=90){ countGood++;

    %>
            <tr class="success">
                <td><%=resultSet.getString(1)%></td>
                <td><%=resultSet.getString(2)%></td>
                <td><%=resultSet.getInt(3)%></td>
<%--                <td><a href="TeaModifyStuServlet?Do=delete&Sno=<%=resultSet.getString(1)%>&Cname=<%=Cname%>" onclick="yanzheng()">删除</a>&nbsp;&nbsp; </td>--%>
<%--                <td>输入成绩：<input type="text"></td>--%>
            </tr>
    <%
    }
    else if (Grade<60){ countFail++;
    %>
    <tr class="danger">
        <td><%=resultSet.getString(1)%></td>
        <td><%=resultSet.getString(2)%></td>
        <td><%=resultSet.getInt(3)%></td>

<%--        <td><a href="TeaModifyStuServlet?Do=delete&Sno=<%=resultSet.getString(1)%>&Cname=<%=Cname%>" onclick="yanzheng()">删除</a>&nbsp;&nbsp; </td>--%>
<%--        <td>输入成绩：<input type="text"></td>--%>
    </tr>
    <%
    }
    else { countNormal++;
    %>
    <tr>
        <td><%=resultSet.getString(1)%></td>
        <td><%=resultSet.getString(2)%></td>
        <td><%=resultSet.getInt(3)%></td>
<%--        <td><a href="TeaModifyStuServlet?Do=delete&Sno=<%=resultSet.getString(1)%>&Cname=<%=Cname%>" onclick="yanzheng()" >删除</a>&nbsp;&nbsp; </td>--%>
<%--        <td>输入成绩：<input type="text"></td>--%>
            </tr>
    <%
        }
    }

    %>


</table>
<%--        <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交成绩"></h3>--%>
<%--    </form>--%>




<%
    }catch (Exception e) {
        e.printStackTrace();
    }finally {
        //6. 释放资源
        JDBCUtils.close(resultSet,pstmt,statement,conn);
    }
%>
</div>

<%--饼状图--%>
<h1 style="text-align: center">数据分析</h1>
<div align id="container" style="height: 60%"></div>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};

    app.title = '环形图';

    var option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        color:['#41ee78','#ee5416','#2d39ac'],
        legend: {
            orient: 'horizontal',
            x: 'center',
            y:'bottom',
            data: ['优秀', '不及格',  '中等']
        },
        series: [{
            name: '访问来源',
            type: 'pie',
            radius: ['30%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data: [{
                value: <%=countGood%>,
                name: '优秀'
            },
                {
                    value: <%=countFail%>,
                    name: '不及格'
                },
                {
                    value: <%=countNormal%>,
                    name: '中等'
                }
            ]
        }]
    };
    if(option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>




<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

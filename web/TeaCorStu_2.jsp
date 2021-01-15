<%@ page import="cn.itcast.domain.User" %>
<%@ page import="cn.itcast.util.JDBCUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="cn.itcast.dao.UserDao_Tea" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%!int countNormal=0;
    int countFail=0;
    int countGood=0;%>
<%
    User user = (User) session.getAttribute("user");
    String Cname = request.getParameter("Cname");

    UserDao_Tea dao = new UserDao_Tea();
    List<Map<String, Object>> lists = dao.GetStuScore(user, Cname);
    request.setAttribute("lists",lists);
%>
<head>
    <title><%=Cname%>的详细信息</title>
</head>
<body>

<%--导航条--%>
<%@ include file="TeaNavbar.jsp"%>

<h1>《<%=Cname%>》课程所有的学生及其成绩</h1><br><br><br>
<%--表格信息--%>

<c:if test="${not empty lists}">
<form action="TeaModifyStuServlet?Do=update&Cname=<%=Cname%>" method="post">

<table class="table table-bordered table-hover table-condensed table-responsive " style="width: 60%">
    <tr>
        <th>序号</th>
        <th>学号</th>
        <th>姓名</th>
        <th>成绩</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${lists}" var="maps" varStatus="s">
        <c:if test="${maps['Grade']>=90}">
        <%countGood++;%>
            <tr class="success">
                <td>${s.count}</td>
                <td>${maps["Sno"]}</td>
                <td>${maps["Sname"]}</td>
                <td>${maps["Grade"]}</td>
                <td>输入成绩<input type="text" name="score"></td>
                <input type="hidden" name="hide" value="${maps["Sno"]}">
            </tr>
        </c:if>
        <c:if test="${maps['Grade']>=60 and maps['Grade']<90}">
            <%countNormal++;%>
            <tr>
                <td>${s.count}</td>
                <td>${maps["Sno"]}</td>
                <td>${maps["Sname"]}</td>
                <td>${maps["Grade"]}</td>
                <td>输入成绩<input type="text" name="score"></td>
                <input type="hidden" name="hide" value="${maps["Sno"]}">
            </tr>
        </c:if>
        <c:if test="${maps['Grade']<60}">
            <%countFail++;%>
            <tr class="danger">
                <td>${s.count}</td>
                <td>${maps["Sno"]}</td>
                <td>${maps["Sname"]}</td>
                <td>${maps["Grade"]}</td>
                <td>输入成绩<input type="text" name="score"></td>
                <input type="hidden" name="hide" value="${maps["Sno"]}">
            </tr>
        </c:if>
    </c:forEach>

</table>
    <input type="submit">
</form>
</c:if>










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

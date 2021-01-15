<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.lang.invoke.VarHandle" %>
<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的成绩</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap HelloWorld</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>


<body>
<%--导航条--%>
<%@ include file="StuNavbar.jsp"%>

<%
    try {
        User user = (User)session.getAttribute("user");
        UserDao1_login_Stu userDao1_loginStu = new UserDao1_login_Stu();
        Map<String, Integer> map = userDao1_loginStu.SelectScore(user);
        Iterator<Map.Entry<String, Integer>> iterator = map.entrySet().iterator();

%>
<h1>我的成绩</h1>

<h3>第一学期</h3>
<table style="width:600px" class="table table-bordered table-hover table-condensed table-responsive table-striped">
    <tr>
        <th>科目</th>
        <th>成绩</th>
    </tr>
  <%
      int i=0;
      while (iterator.hasNext())
      {
          Map.Entry<String, Integer> next = iterator.next();
          String key = next.getKey();
          kemu[i]=key;
          Integer value = next.getValue();
          fenshu[i]=value;
          i++;
          %>
    <%!
      String kemu[]=new String[100];
      Integer fenshu[]=new Integer[100];
    %>
    <tr>
        <td><%=key%></td>
        <td><%=value%></td>
    </tr>
    <%
      }
        }catch (Exception e)
        {
            System.out.println("error");
        }
  %>

</table>


<%--饼状图--%>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '我的成绩统计'
        },
        tooltip: {},
        legend: {
            data:['分数']
        },
        xAxis: {
            data: ["<%=kemu[0]%>","<%=kemu[1]%>","<%=kemu[2]%>","<%=kemu[3]%>"]
        },
        yAxis: {},
        series: [{
            name: '分数',
            type: 'bar',
            data: [<%=fenshu[0]%>, <%=fenshu[1]%>, <%=fenshu[2]%>, <%=fenshu[3]%>]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

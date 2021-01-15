<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员端</title>
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
</head>
<%
    UserDao1_login_Stu dao = new UserDao1_login_Stu();
    List<Map<String, Object>> maps = dao.Admin_Book();
    for (Map<String, Object> map : maps) {
        for (String s : map.keySet()) {
            System.out.println(s+" "+map.get(s));
        }
    }
    request.setAttribute("list",maps);

    String str = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒").format(new Date());
%>
<body>
<h1>欢迎光临！管理员！</h1>
<br><br><br>
<c:if test="${not empty list}">
    <h3>截止到<%=str%> <br>订书表单如下所示，请您及时采购，并发放到学生手中</h3>
    <br><br>
<table style="width:600px" class="table table-bordered table-hover">
    <tr>
        <th>书名</th>
        <th>数量</th>
    </tr>

    <c:forEach items="${list}" var="map" varStatus="s">
        <tr>
                <td>${map["书名"]}</td>
                <td>${map["数量"]}</td>
        </tr>

    </c:forEach>
</table>
</c:if>
<c:if test="${empty list}">
    <h2>当前还没有学生采购书籍哦</h2>

</c:if>




</body>
</html>

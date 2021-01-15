<%@ page import="cn.itcast.dao.UserDao1_login_Stu" %>
<%@ page import="cn.itcast.domain.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎选购图书</title>
</head>
<%
    UserDao1_login_Stu dao = new UserDao1_login_Stu();
    List<Book> books = dao.GetAllBooks();
    request.setAttribute("books",books);

    User user = (User)session.getAttribute("user");
    List<Book> shoppingcar = dao.GetShoppingList(user);
    request.setAttribute("shoppingcar",shoppingcar);

    double TotalPrize=0;
    for (Book book : shoppingcar) {
        TotalPrize+=book.getPrize()*book.getNum();
    }
    DecimalFormat df = new DecimalFormat( "0.00"); //设置double类型小数点后位数格式
    TotalPrize=Double.parseDouble(df.format(TotalPrize));

    Date date = new Date();

    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日  HH时mm分ss秒");
    String str = simpleDateFormat.format(date);
%>

<body>

<%--导航条--%>
<%@ include file="StuNavbar.jsp"%>



<%--展示购物车--%>
<hr>
<c:if test="${not empty shoppingcar}">
    <h1>我的购物车：</h1>
    <table class="table table-hover table-bordered">
        <tr>
            <th>序号</th>
            <th>书名</th>
            <th>单价</th>
            <th>数量</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>

        <c:forEach items="${shoppingcar}" var="book" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${book.bname}</td>
                <td>${book.prize}</td>
                <td>${book.num}</td>
                <td class="success"><a href="BookServlet?action=inc&&bno=${book.bno}">增加</a></td>
                <td class="danger"><a href="BookServlet?action=dec&&bno=${book.bno}">减少</a></td>
                <td class="danger"><a href="BookServlet?action=del&&bno=${book.bno}">删除</a></td>
                <br>
            </tr>
        </c:forEach>
    <tr>
        <td colspan="5"><h3 align="right">总价：<%=TotalPrize %></h3></td>
        <td colspan="2"><h3 align="left"><font color="#ff7f50"><b>点击支付</b></font></h3></td>
    </tr>
    </table>
</c:if>
<c:if test="${empty shoppingcar}">
    <h3>现在的时间是<%=str%></h3>
    <h1><font color="#ff7f50">当前购物车为空，快去选购教材吧！读书人！</font></h1>
</c:if>

<br><br>
<%--展示书籍列表--%>
<c:if test="${not empty requestScope.books}">
    <h1> 教材列表:</h1>
    <table class="table table-bordered table-hover">
        <tr>
            <th>序号</th>
            <th>书名</th>
            <th>书号</th>
            <th>作者</th>
            <th>出版社</th>
            <th>价格</th>
            <th>操作</th>
        </tr>

    <c:forEach items="${books}" var="book" varStatus="s">
        <tr>
                <td>${s.count}</td>
                <td>${book.bname}</td>
                <td>${book.bno}</td>
                <td>${book.author}</td>
                <td>${book.press}</td>
                <td>${book.prize}</td>
                <td><a href="BookServlet?action=inc&&bno=${book.bno}">添加至购物车</a></td>
        </tr>


    </c:forEach>
    </table>
</c:if>



</body>
</html>

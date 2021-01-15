<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp" %>
<html>
<head>
    <title>GoodEdu学生端</title>

    <style>
        #slidershow{
            width: 1000px;
            height: 600px;
            margin: 100px auto;
        }
        img{
            width: 1000px;
            height: 440px;
        }
    </style>
</head>
<body>
<%--导航条--%>
<%@ include file="StuNavbar.jsp"%>

<%--利用Cookie上次访问时间--%>
<%
    User user = (User)session.getAttribute("user");
    if(user != null){
        System.out.println("用户通过url直接访问该网页！！");

    }

    //设置响应的消息体的数据格式以及编码
    response.setContentType("text/html;charset=utf-8");
    Cookie[] cookies = request.getCookies();
    boolean flag = false;//没有cookie为lastTime
    if(cookies != null && cookies.length > 0){
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            if("lastTime".equals(name)){
                flag = true;//有lastTime的cookie
                String value = cookie.getValue();
                value= URLDecoder.decode(value,"utf-8");

                out.print("<h1>欢迎回来，读书人！  您上次访问时间为:"+value+"</h1>");
                Date date  = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
                String str_date = sdf.format(date);
                //URL编码
                str_date = URLEncoder.encode(str_date,"utf-8");
                cookie.setValue(str_date);
                //设置cookie的存活时间
                cookie.setMaxAge(60 * 60 * 24 * 30);//一个月
                response.addCookie(cookie);
                break;

            }
        }
    }

    if(cookies == null || cookies.length == 0 || flag == false){
        //第一次访问
        //设置Cookie的value
        //获取当前时间的字符串，重新设置Cookie的值，重新发送cookie
        Date date  = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String str_date = sdf.format(date);
        str_date = URLEncoder.encode(str_date,"utf-8");

        Cookie cookie = new Cookie("lastTime",str_date);
        //设置cookie的存活时间
        cookie.setMaxAge(60 * 60 * 24 * 30);//一个月
        response.addCookie(cookie);

        out.print("<h1>您好，读书人！欢迎您的首次访问！！</h1>");
    }


%>

<!-- 轮播图 -->
<div id="slidershow" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#slidershow" data-slide-to="0" class="active"></li>
        <li data-target="#slidershow" data-slide-to="1"></li>
        <li data-target="#slidershow" data-slide-to="2"></li>
        <li data-target="#slidershow" data-slide-to="3"></li>
        <li data-target="#slidershow" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="img/zd_landscape01.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <div class="item">
            <img src="img/zd_landscape02.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <div class="item">
            <img src="img/zd_landscape03.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <div class="item">
            <img src="img/zd_landsacpe04.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <div class="item">
            <img src="img/zd_landscape05.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
    </div>

    <!--左右按钮-->
    <a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<%--利用AJAX实现显示学校地址    参考：https://www.runoob.com/ajax/ajax-examples.html--%>
<div align="center">
<script>
    function loadXMLDoc()
    {
        var xmlhttp;
        if (window.XMLHttpRequest)
        {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp=new XMLHttpRequest();
        }
        else
        {
            // IE6, IE5 浏览器执行代码
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","info_AJAX.jsp",true);
        xmlhttp.send();
    }
</script>
    <br><br><br>
<div id="myDiv"><h2>（该部分内容将会被替代）</h2></div>
<button type="button" onclick="loadXMLDoc()">点击查看郑州大学地址</button>
    <br><br><br><br><br><br><br><br>
</div>

<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

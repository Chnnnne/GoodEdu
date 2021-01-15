<%@ page import="cn.itcast.domain.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GoodEdu教师端</title>

    <%--设置轮播图的大小--%>
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
<%@ include file="TeaNavbar.jsp"%>

<%--上次登录时间--%>
<%
    User user = (User)session.getAttribute("user");
    if(user != null){

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

                out.print("<h1>欢迎回来，教书人！您上次访问时间为:"+value+"</h1>");
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
        //没有，第一次访问
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

        out.print("<h1 style=\"text-align:center;\">您好，欢迎您首次访问</h1>");
    }
//    ShowLastTime(request,response);

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

<%--底部信息--%>
<%@ include file="info.jsp"%>
</body>
</html>

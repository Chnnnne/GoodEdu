package cn.itcast.web.servlet;

import cn.itcast.dao.UserDao1_login_Stu;
import cn.itcast.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkCode = request.getParameter("checkCode1")==null?request.getParameter("checkCode2"):request.getParameter("checkCode1");
        User loginUser = new User();
        loginUser.setUsername(username);
        loginUser.setPassword(password);

        //user用于创建user对象并封装用户名和密码
        // dao对象只是用于连接数据库 和验证操作，
        // loginUser是实际对象
        UserDao1_login_Stu dao = new UserDao1_login_Stu();
        User user = dao.login(loginUser);

        HttpSession session = request.getSession();
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        session.removeAttribute("checkCode_session");

        if (checkCode_session != null && checkCode_session.equalsIgnoreCase(checkCode)) {
            if (user != null) {
                //登录成功！
                String remember = request.getParameter("remember");
                if (remember==null)//下面负责cookie的创建和销毁
                {
                    Cookie[] cookies = request.getCookies();
                    for (Cookie cookie : cookies) {
                        if(cookie.getName().equals("username"))
                        {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                        if (cookie.getName().equals("password"))
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                    }
                }
                else{
                    Cookie cookie1 = new Cookie("username", username);
                    cookie1.setMaxAge(60*10);
                    Cookie cookie2 = new Cookie("password", password);
                    cookie2.setMaxAge(60*10);
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                }
                session.setAttribute("user", loginUser);//设置session
                UserDao1_login_Stu dao3=new UserDao1_login_Stu();
                if(dao3.isTeacher(loginUser))
                {
                    System.out.println("跳转到老师界面");
                    response.sendRedirect("/test/TeacherHome.jsp");
                }
                else {
                    System.out.println("跳转到学生界面");
                    response.sendRedirect("/test/StudentHome.jsp");
                }
            } else {
                request.setAttribute("login_error", "用户名或密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }


        } else {
            //验证码错误！
            request.setAttribute("cc_error", "验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}




/*
package cn.itcast.web.servlet;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.设置编码
        req.setCharacterEncoding("utf-8");
       */
/* //2.获取请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        //3.封装user对象
        User loginUser = new User();
        loginUser.setUsername(username);
        loginUser.setPassword(password);*//*

        //2.获取所有请求参数
        Map<String, String[]> map = req.getParameterMap();
        //3.创建User对象
        User loginUser = new User();
        //3.2使用BeanUtils封装
        try {
            BeanUtils.populate(loginUser,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


        //4.调用UserDao的login方法
        UserDao dao = new UserDao();
        User user = dao.login(loginUser);

        //5.判断user
        if(user == null){
            //登录失败
            req.getRequestDispatcher("/failServlet").forward(req,resp);
        }else{
            //登录成功
            //存储数据
            req.setAttribute("user",user);
            //转发
            req.getRequestDispatcher("/successServlet").forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
*/

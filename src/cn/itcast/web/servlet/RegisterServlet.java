package cn.itcast.web.servlet;

import cn.itcast.dao.UserDao1_login_Stu;
import cn.itcast.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author WangChen
 * @create 2020-10-15 15:13
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User loginUser = new User();
        loginUser.setUsername(username);
        loginUser.setPassword(password);

        //user用于创建user对象并封装用户名和密码
        // dao对象只是用于连接数据库 和验证操作，
        // loginUser是实际对象
        UserDao1_login_Stu dao = new UserDao1_login_Stu();
        int flag = dao.register(loginUser);
        if(flag==1)
        {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        else
        {
            System.out.println("注册失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

package cn.itcast.web.servlet;

import cn.itcast.dao.UserDao1_login_Stu;
import cn.itcast.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author WangChen
 * @create 2020-10-29 17:29
 */
@WebServlet("/ChooseCorsServlet")
public class ChooseCorsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cname = request.getParameter("Cname");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        UserDao1_login_Stu userDao1_loginStu = new UserDao1_login_Stu();
        boolean flag = userDao1_loginStu.ChooseCor(user, cname);
        if(!flag)
            session.setAttribute("isRepeat",true);
        else
            session.setAttribute("isRepeat",false);



        response.sendRedirect("StuChooseCourses.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

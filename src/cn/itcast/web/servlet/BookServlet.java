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
 * @create 2020-11-26 19:09
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String bno = request.getParameter("bno");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        UserDao1_login_Stu dao = new UserDao1_login_Stu();

        if (action.equals("inc")){
            boolean b = dao.IncBook(user, bno);
            if(!b){
                System.out.println("添加失败");
            }
        }
        else if(action.equals("dec")){
            boolean b = dao.DecBook(user, bno);
            if(!b){
                System.out.println("减少失败");
            }
        }
        else if(action.equals("del")){
            boolean b = dao.DelBook(user, bno);
            if(!b){
                System.out.println("删除失败");
            }
        }else {
            System.out.println("出错");
        }
        response.sendRedirect("StuBuyBook.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

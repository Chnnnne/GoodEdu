package cn.itcast.web.servlet;

import cn.itcast.dao.UserDao_Tea;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.rmi.server.ServerNotActiveException;

/**
 * @author WangChen
 * @create 2020-11-05 15:42
 */
@WebServlet("/TeaModifyStuServlet")
public class TeaModifyStuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aDo = request.getParameter("Do");
        String cname = request.getParameter("Cname");
        System.out.println(aDo+cname);

        UserDao_Tea userDao_tea = new UserDao_Tea();
         if("update".equals(aDo)){
            System.out.println("zheshiupdate");
            String[] scores = request.getParameterValues("score");
            String[] hides = request.getParameterValues("hide");
             for (int i = 0; i < hides.length; i++) {
                 userDao_tea.UpdateScore(cname,hides[i],Integer.parseInt(scores[i]));
             }
        }

        response.setContentType("text/html;charset=utf-8");
        response.sendRedirect("TeaCorStu_2.jsp?Cname="+ URLEncoder.encode(cname,"utf-8"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

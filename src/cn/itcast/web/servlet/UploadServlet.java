package cn.itcast.web.servlet;

import cn.itcast.domain.User;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author WangChen
 * @create 2020-10-31 12:35
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SmartUpload smartUpload=new SmartUpload();
        ServletConfig config=this.getServletConfig();
        smartUpload.initialize(config,request,response);
        //根据Session中的user来获取 上传头像的人的用户名来命名上传图片的名字
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        try {
            smartUpload.upload();
            File smartFile=smartUpload.getFiles().getFile(0);
//            System.out.println(smartFile.getFieldName());
            smartFile.saveAs("D:\\Idea_Workplace\\Project02_html&css\\day14_test\\web\\jpgFromClient\\"+ user.getUsername()+".jpg",
                    smartUpload.SAVE_PHYSICAL);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
        String msg="Upload Success!";
        request.setAttribute("msg",msg);
        String referer = request.getHeader("referer");
        System.out.println(referer);
        System.out.println("ssss");
        if(referer.contains("Tea"))
        {
            System.out.println("来自于老师网站");
            request.getRequestDispatcher("/TeaInfo.jsp").forward(request,response);
//            response.sendRedirect("/test/TeaInfo.jsp");
        }
        else{
            System.out.println("来自于学生端");
//            response.sendRedirect("/test/StuInfo.jsp");
            request.getRequestDispatcher("/StuInfo.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

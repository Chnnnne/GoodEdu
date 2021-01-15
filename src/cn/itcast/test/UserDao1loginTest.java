package cn.itcast.test;

import cn.itcast.dao.UserDao1_login_Stu;
import cn.itcast.domain.User;
import org.junit.Test;

public class UserDao1loginTest {



    @Test
    public void testLogin(){
        User loginuser = new User();
        loginuser.setUsername("superbaby");
        loginuser.setPassword("123111");


        UserDao1_login_Stu dao = new UserDao1_login_Stu();
        User user = dao.login(loginuser);

        System.out.println(user);
    }
}

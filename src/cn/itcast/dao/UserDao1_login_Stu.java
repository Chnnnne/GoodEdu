package cn.itcast.dao;

import cn.itcast.domain.Book;
import cn.itcast.domain.Student;
import cn.itcast.domain.User;
import cn.itcast.util.JDBCUtils;
import jdk.nashorn.api.tree.ReturnTree;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.spi.CalendarNameProvider;

/**
 * 操作数据库中User表的类
 */
public class UserDao1_login_Stu {
    //声明JDBCTemplate对象共用
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());


    //登录方法 user包含用户全部数据,没有查询到，返回null
    public User login(User loginUser){
        try {
            User user = new User();
            //1.编写sql
            String sql = "select * from Users where U_username = ? and U_password = ?";
            //2.调用query方法
            Map<String, Object> stringObjectMap = template.queryForMap(sql, loginUser.getUsername(), loginUser.getPassword());
            if(stringObjectMap==null)
                return null;
            else
            {

                user.setUsername((String) stringObjectMap.get("U_username"));
                user.setPassword((String)stringObjectMap.get("U_password"));
                return user;
            }

          /*  User user = template.queryForObject(sql,
                    new BeanPropertyRowMapper<User>(User.class),
                    loginUser.getUsername(),
                    loginUser.getPassword());*/

        } catch (DataAccessException e) {
            e.printStackTrace();//记录日志
            return null;
        }
    }
    //判断是老师还是学生
    public boolean isTeacher(User user){
        String sql="select * from Teachers where Username = ?";
        List<Map<String, Object>> list = template.queryForList(sql, user.getUsername());
        if (list.size()==0)
        {
            System.out.println("ssss");
            return false;
        }
        else
        return true;

    }
    //返回一个学生的所有信息
    public List<Map<String, Object>> SelectInfo(User user) {
        String sql="Select * from Students where Username=?";
        return template.queryForList(sql, user.getUsername());
    }
    public Student SelectInfo_Obj(User user){
        String sql="Select * from Students where Username='"+user.getUsername()+"'";
        List<Student> query = template.query(sql, new BeanPropertyRowMapper<Student>(Student.class));
        Student student = query.get(0);
        System.out.println(student);
        return student;
    }
    //返回科目-成绩信息
    public Map<String, Integer> SelectScore(User user) {
        Connection conn = null;
        Statement statement=null;
        ResultSet resultSet=null;
        PreparedStatement pstmt = null;
        try {
            //1.获取连接
            Map<String, Integer> map=new HashMap<String, Integer>();
            conn = JDBCUtils.getConnection();
            String sql = "Select Cname,Grade from Students S ,SC,Courses C where S.Username='"+user.getUsername()+
                    "' and S.Sno=SC.Sno and SC.Cno=C.Cno ";

            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next())
            {
                map.put(resultSet.getString(1),resultSet.getInt(2));
            }
            return map;

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //6. 释放资源
            JDBCUtils.close(resultSet,pstmt,statement,conn);
        }


        return null;
    }
    //选课
    public boolean ChooseCor(User user,String cname){
        Connection conn = null;
        Statement statement=null;
        PreparedStatement pstmt = null;
        ResultSet resultSet=null;
        try {
            String sql1="Select Sno from Students Where Username='"+user.getUsername()+"'";
            conn=JDBCUtils.getConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql1);
            resultSet.next();
            String sno = resultSet.getString("Sno");

            String sql2="Insert into ChooseCourses values("+sno+",'"+ cname +"')";
            int i = statement.executeUpdate(sql2);
            if(i==0)
                return false;
            else

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            //6. 释放资源
            JDBCUtils.close(resultSet,pstmt,statement,conn);
        }

        return false;
    }
    //退课
    public boolean DeleteCor(User user,String cname){
        Connection conn = null;
        Statement statement=null;
        PreparedStatement pstmt = null;
        ResultSet resultSet=null;
        try {
            String sql1="Select Sno from Students Where Username='"+user.getUsername()+"'";
            conn=JDBCUtils.getConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql1);
            resultSet.next();
            String sno = resultSet.getString("Sno");

            String sql2="delete from ChooseCourses where Courses='"+cname+"' and Sno='"+sno+"'";
            int i = statement.executeUpdate(sql2);
            if(i==0)
                return false;
            else

                return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            //6. 释放资源
            JDBCUtils.close(resultSet,pstmt,statement,conn);
        }

        return false;
    }
    //注册
    public int register(User loginUser){
        try {
            //1.编写sql
            String sql = "insert into Users values (?,?,?)";
            //2.调用query方法
            int update = template.update(sql, null,loginUser.getUsername(), loginUser.getPassword());
            return update;
        } catch (DataAccessException e) {
            e.printStackTrace();//记录日志
            return -1;
        }
    }
    //返回所有书籍信息
    public List<Book> GetAllBooks(){
        String sql="select * from books";
        List<Book> query = template.query(sql, new BeanPropertyRowMapper<Book>(Book.class));
        return query;
    }
    //返回用户的书籍购物车
    public List<Book> GetShoppingList(User user){
        String sql1="select Sno from students where Username='" + user.getUsername()+"'";
        Map<String, Object> map = template.queryForMap(sql1);
        String sno = (String) map.get("Sno");
        String sql2="select Books.Bno,Bname,Prize,Author,Press,num from Books,sb where Books.Bno=sb.Bno and Sno='"+sno+"'";
        List<Book> query = template.query(sql2, new BeanPropertyRowMapper<Book>(Book.class));
        return query;
    }

    //书籍增加
    public boolean IncBook(User user,String bno){
        String sql1="select Sno from students where Username='" + user.getUsername()+"'";
        Map<String, Object> map = template.queryForMap(sql1);
        String sno = (String) map.get("Sno");

        String sql3="select bno from sb where sno='"+sno +"' and bno='"+bno+"'";
        List<Map<String, Object>> maps = template.queryForList(sql3);
        if(maps.isEmpty()){
            System.out.println("该学生第一次买这本书，现在数据库中插入");
            String sql="Insert into sb values('"+sno+"','"+bno+"',1)";
            template.update(sql);
            return true;
        }

        String sql2="update sb set num=num+1 where sno='"+sno +"' and bno='"+bno+"'";
        int update = template.update(sql2);
        if (update>0)
            return true;
        else
            return false;
    }

    public boolean DecBook(User user,String bno){
        String sql1="select Sno from students where Username='" + user.getUsername()+"'";
        Map<String, Object> map = template.queryForMap(sql1);
        String sno = (String) map.get("Sno");

        String sql3="select num from sb where sno='"+sno +"' and bno='"+bno+"'";
        Map<String, Object> map1 = template.queryForMap(sql3);
        if ((int)map1.get("num")==1){
            System.out.println("学生去掉最后一本书，直接在数据库中删除");
            String sql="delete from sb where sno='"+sno +"' and bno='"+bno+"'";
            template.update(sql);
            return true;
        }

        String sql2="update sb set num=num-1 where sno='"+sno +"' and bno='"+bno+"'";
        int update = template.update(sql2);
        if (update>0)
            return true;
        else
            return false;
    }
    public boolean DelBook(User user,String bno){
        String sql1="select Sno from students where Username='" + user.getUsername()+"'";
        Map<String, Object> map = template.queryForMap(sql1);
        String sno = (String) map.get("Sno");

        String sql2="delete from sb where sno='"+sno +"' and bno='"+bno+"'";
        int update = template.update(sql2);
        if(update>0)
            return true;
        else
            return false;
    }

    public List<Map<String, Object>> Admin_Book(){
        String sql="SELECT Bname 书名,SUM(num) 数量\n" +
                "FROM books\n" +
                "INNER JOIN sb\n" +
                "ON books.`Bno`=sb.`Bno`\n" +
                "GROUP BY sb.`Bno`,books.`Bname`\n";
        List<Map<String, Object>> maps = template.queryForList(sql);
        if(!maps.isEmpty())
        {
            return maps;
        }
        return null;
    }

}

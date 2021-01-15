package cn.itcast.dao;

import cn.itcast.domain.User;
import cn.itcast.util.JDBCUtils;
import cn.itcast.web.servlet.UploadServlet;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

/**
 * @author WangChen
 * @create 2020-10-30 12:29
 */
public class UserDao_Tea {
    //声明JDBCTemplate对象共用
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    //返回老师的所有信息
    public Map<String,Object> SelectInfo(User user){
        String sql="Select * from Teachers where Username='"+user.getUsername()+"'";
        Map<String, Object> stringObjectMap = template.queryForMap(sql);

        return stringObjectMap;
    }
    //返回院系
    public String SelectDname(User user){
        String sql="select Dname from Departments D, Teachers T where D.Dno=T.Dno and T.Username='"+user.getUsername()+"'";
        Map<String, Object> stringObjectMap = template.queryForMap(sql);
        String dname = (String) stringObjectMap.get("Dname");
        return dname;
    }
    //删除学生信息
    public boolean DeleteStu(String Sno,String Cname){
        String SQL="Select Cno from Courses where Cname='"+Cname+"'";
        Map<String, Object> stringObjectMap = template.queryForMap(SQL);
        String cno = (String) stringObjectMap.get("Cno");
        String Sql="Delete from sc" +
                " where Sno='"+Sno+"'" +
                " and Cno='"+cno+"' ";
        int update = template.update(Sql);
        if(update==1)
            return true;
        else
            return false;

    }
    public List<Map<String, Object>> GetStuScore(User user,String Cname){
        String sql="Select S.Sno,S.Sname,SC.Grade " +
                "from Teachers T,Teaches Te,Courses C,SC,Students S " +
                "where T.Username='"+user.getUsername() +"' " +
                "and C.Cname='"+ Cname+"' " +
                "and T.Tno=Te.Tno " +
                "and Te.Cno=C.Cno " +
                "and C.Cno=SC.Cno " +
                "and SC.Sno=S.Sno " +
                "ORDER BY SC.Grade DESC ";
        List<Map<String, Object>> maps = template.queryForList(sql);
        if(maps.isEmpty()){
            System.out.println("查询失败");
            return null;
        }
        return maps;
    }
    public boolean UpdateScore(String Cname,String Sno,int Grade){
        String sql="select Cno from Courses where Cname='"+Cname+"'";
        Map<String, Object> map = template.queryForMap(sql);
        String cno = (String) map.get("Cno");
        String sql2="update SC "+
                "set Grade="+Grade+
                " where Cno='"+cno+"' and " +
                "Sno='"+Sno+"'";
        int update = template.update(sql2);
        if(update>0)
            return true;
        else
            return false;
    }

}

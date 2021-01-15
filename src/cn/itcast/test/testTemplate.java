package cn.itcast.test;

import cn.itcast.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

/**
 * @author WangChen
 * @create 2020-11-27 17:58
 */
public class testTemplate {
    public static void main(String[] args) {
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql3="select bno from sb where sno='"+"201801001" +"' and bno='"+"201801001"+"'";
        List<Map<String, Object>> maps = template.queryForList(sql3);
        if(maps.isEmpty()){
            System.out.println("kong");
        }
        System.out.println(maps);
        System.out.println("aaa");
    }
}

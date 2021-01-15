package cn.itcast.domain;

import java.util.Date;

/**
 * @author WangChen
 * @create 2020-11-12 14:51
 */
public class Teacher {
    private String Username;
    private String Sno;
    private String Sname;
    private String Sex;
    private Date Birthday;
    private String Department;

    public Teacher() {
    }

    public Teacher(String username, String sno, String sname, String sex, Date birthday, String department) {
        Username = username;
        Sno = sno;
        Sname = sname;
        Sex = sex;
        Birthday = birthday;
        Department = department;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getSno() {
        return Sno;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String sex) {
        Sex = sex;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date birthday) {
        Birthday = birthday;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }
}

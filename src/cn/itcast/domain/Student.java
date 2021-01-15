package cn.itcast.domain;

import java.util.Date;

/**
 * @author WangChen
 * @create 2020-11-12 14:47
 */
public class Student {
    private String Username;
    private String Sno;
    private String Sname;
    private String Sex;
    private Date Birthday;
    private String Enrollyear;
    private String Speciality;

    public Student() {
    }

    public Student(String username, String sno, String sname, String sex, Date birthday, String enrollyear, String speciality) {
        Username = username;
        Sno = sno;
        Sname = sname;
        Sex = sex;
        Birthday = birthday;
        Enrollyear = enrollyear;
        Speciality = speciality;
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

    public String getEnrollyear() {
        return Enrollyear;
    }

    public void setEnrollyear(String enrollyear) {
        Enrollyear = enrollyear;
    }

    public String getSpeciality() {
        return Speciality;
    }

    public void setSpeciality(String speciality) {
        Speciality = speciality;
    }

    @Override
    public String toString() {
        return "Student{" +
                "Username='" + Username + '\'' +
                ", Sno='" + Sno + '\'' +
                ", Sname='" + Sname + '\'' +
                ", Sex='" + Sex + '\'' +
                ", Birthday=" + Birthday +
                ", Enrollyear='" + Enrollyear + '\'' +
                ", Speciality='" + Speciality + '\'' +
                '}';
    }
}

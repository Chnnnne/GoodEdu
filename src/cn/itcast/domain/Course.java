package cn.itcast.domain;

/**
 * @author WangChen
 * @create 2020-11-12 14:52
 */
public class Course {
    private String Cno;
    private String Cname;
    private Integer Credit;

    public Course() {
    }

    public Course(String cno, String cname, Integer credit) {
        Cno = cno;
        Cname = cname;
        Credit = credit;
    }

    public String getCno() {
        return Cno;
    }

    public void setCno(String cno) {
        Cno = cno;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public Integer getCredit() {
        return Credit;
    }

    public void setCredit(Integer credit) {
        Credit = credit;
    }
}

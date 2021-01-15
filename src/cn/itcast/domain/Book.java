package cn.itcast.domain;

/**
 * @author WangChen
 * @create 2020-11-26 17:34
 */
public class Book {
    private String bno;
    private String bname;
    private float prize;
    private String author;
    private String press;
    private int num;

    public Book() {
    }

    public Book(String bno, String bname, float prize, String author, String press, int num) {
        this.bno = bno;
        this.bname = bname;
        this.prize = prize;
        this.author = author;
        this.press = press;
        this.num = num;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public float getPrize() {
        return prize;
    }

    public void setPrize(float prize) {
        this.prize = prize;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}

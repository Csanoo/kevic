package main.java.admin.satelite.kr;

public class RssVO {

    private Integer sn;
    public Integer getSn() {
        return sn;
    }
    public void setSn(Integer sn) {
        this.sn = sn;
    }

    private String title="";
    public void setTitle(String title) {
        this.title = title;
    }
    public String getTitle() {
        return title;
    }

    private String url="";
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }

    private String regDate;
    public String getRegDate(){return regDate;}
    public void setRegDate(String regDate){this.regDate = regDate;}

}

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

    private String regUser="";
    public String getRegUser() {
        return regUser;
    }
    public void setRegUser(String regUser) {
        this.regUser = regUser;
    }

    private String uptDate="";
    public String getUptDate() {
        return uptDate;
    }
    public void setUptDate(String uptDate) {
        this.uptDate = uptDate;
    }

    private String uptUser="";
    public String getUptUser() {
        return uptUser;
    }
    public void setUptUser(String uptUser) {
        this.uptUser = uptUser;
    }


}

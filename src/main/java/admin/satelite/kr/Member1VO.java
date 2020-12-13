package main.java.admin.satelite.kr;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Member1VO {
	
	private List<MultipartFile> uploadfile;

	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	private String contcnt = "";
	
	private String mxwdt = "";
	
	public String getMxwdt() {
		return mxwdt;
	}

	public void setMxwdt(String mxwdt) {
		this.mxwdt = mxwdt;
	}

	private String fucheck = "";
	
	public String getFucheck() {
		return fucheck;
	}
	public void setFucheck(String fucheck) {
		this.fucheck = fucheck;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	private String category = "";
	private String imgfile = "";
	public String getContcnt() {
		return contcnt;
	}
	public void setContcnt(String contcnt) {
		this.contcnt = contcnt;
	}
	public String getTimecnt() {
		return timecnt;
	}
	public void setTimecnt(String timecnt) {
		this.timecnt = timecnt;
	}
	public String getTodaycnt() {
		return todaycnt;
	}
	public void setTodaycnt(String todaycnt) {
		this.todaycnt = todaycnt;
	}
	public String getUsercnt() {
		return usercnt;
	}
	public void setUsercnt(String usercnt) {
		this.usercnt = usercnt;
	}
	private String timecnt = "";
	private String todaycnt = "";
	private String usercnt = "";

	
	private String looktime = "";
	
	public String getLooktime() {
		return looktime;
	}
	public void setLooktime(String looktime) {
		this.looktime = looktime;
	}
	private String code1memo="";
	
	public String getCode1memo() {
		return code1memo;
	}
	public void setCode1memo(String code1memo) {
		this.code1memo = code1memo;
	}
	private String userid="";
	
	private String ccnt="";
	
	public String getCcnt() {
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	private String sn="";
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getCode1() {
		return code1;
	}
	public void setCode1(String code1) {
		this.code1 = code1;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	private String code1="";

	private String url="";
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	private String code2="";
	private String title="";
	private String memo="";
	
	
	private String mobile="";
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	private String email="";
	private String wdate="";
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	private String userpw="";
	private String username="";
	private String usertype="";

	private String regdate;

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	private String state ="";
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
    
}

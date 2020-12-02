package main.java.admin.satelite.kr;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AppMain3VO {
	private String creatorimg = "";
	
	public String getCreatorimg() {
		return creatorimg;
	}
	public void setCreatorimg(String creatorimg) {
		this.creatorimg = creatorimg;
	}
	
	private String fucheck = "";

	private String appkind = "";

	public String getAppkind() {
		return appkind;
	}
	public void setAppkind(String appkind) {
		this.appkind = appkind;
	}
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

	private String category = "";

	private List<MultipartFile> uploadfile;

	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}

	private String filecnt;

	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	private String type1;

	public String getText1() {
		return text1;
	}

	public void setText1(String text1) {
		this.text1 = text1;
	}

	public String getText2() {
		return text2;
	}

	public void setText2(String text2) {
		this.text2 = text2;
	}

	private String text1;
	private String text2;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUmemo() {
		return umemo;
	}

	public void setUmemo(String umemo) {
		this.umemo = umemo;
	}

	private String uname;

	private String umemo;


	public String getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(String filecnt) {
		this.filecnt = filecnt;
	}
	private String id = "";
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	private String imgfile="";
	private String link="";


	private String userid="";

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

}

package main.java.admin.satelite.kr;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BannerVO {
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

	private String category = "";

	private List<MultipartFile> uploadfile;

	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}


	private List<MultipartFile> uploadfile1;

	public List<MultipartFile> getUploadfile1() {
		return uploadfile1;
	}

	public void setUploadfile1(List<MultipartFile> uploadfile) {
		this.uploadfile1 = uploadfile1;
	}

	private List<MultipartFile> uploadfile2;

	public List<MultipartFile> getUploadfile2() {
		return uploadfile2;
	}

	public void setUploadfile2(List<MultipartFile> uploadfile2) {
		this.uploadfile2 = uploadfile2;
	}

	private List<MultipartFile> uploadfile3;

	public List<MultipartFile> getUploadfile3() {
		return uploadfile3;
	}

	public void setUploadfile3(List<MultipartFile> uploadfile3) {
		this.uploadfile3 = uploadfile3;
	}

	private List<MultipartFile> uploadfile4;

	public List<MultipartFile> getUploadfile4() {
		return uploadfile4;
	}

	public void setUploadfile4(List<MultipartFile> uploadfile4) {
		this.uploadfile4 = uploadfile4;
	}

	private List<MultipartFile> uploadfile5;

	public List<MultipartFile> getUploadfile5() {
		return uploadfile5;
	}

	public void setUploadfile5(List<MultipartFile> uploadfile5) {
		this.uploadfile5 = uploadfile5;
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

	private Integer sn;
	public Integer getSn() {
		return sn;
	}
	public void setSn(Integer sn) {
		this.sn = sn;
	}

	private Integer bannersn;
	public Integer getBannersn() {
		return bannersn;
	}
	public void setBannersn(Integer bannersn) {
		this.bannersn = bannersn;
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

	private String sdate = "";
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	private String edate = "";
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}

	private String displayType = "";
	public String getDisplayType() {
		return displayType;
	}
	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}

	private String linkTarget = "";
	public String getLinkTarget() {
		return linkTarget;
	}
	public void setLinkTarget(String linkTarget) {
		this.linkTarget = linkTarget;
	}


	private String state = "";
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	private Integer projectSn;
	public Integer getProjectSn() {
		return projectSn;
	}
	public void setProjectSn(Integer projectSn) {
		this.projectSn = projectSn;
	}

	private String project = "";
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}

	private String regDate = "";
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	private String updateDate = "";
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	private Integer sort = 0;
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}

	private String imgBanner = "";
	public String getImgBanner() {
		return imgBanner;
	}
	public void setImgBanner(String imgBanner) {
		this.imgBanner = imgBanner;
	}

}

package main.java.admin.satelite.kr;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class ProjectVO {

    private String [] strArray;
    public String [] getStrArray(){
        return strArray;
    }
    public void setStrArray(String [] strArray){ this.strArray = strArray;}

    private Integer sn;
    public Integer getSn() {
        return sn;
    }
    public void setSn(Integer sn) {
        this.sn = sn;
    }

    private String userid ="";
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }

    private Integer sort;
    public Integer getSort() {
        return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
    }


    private String category="";
    public String category() {return category;}
    public void setCategory(String category) {
        this.category = category;
    }
    public String getCategory() {
        return category;
    }

    private String title ="";
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    private String ctName;
    private Integer ctPrice;
    private String ctType;
    private String department;
    private String hName;
    private String corpName;
    private String cAgency;
    private Integer gdPrice;
    private String cGroup;
    private String dNumber;
    private String dType;
    private String dwDate;
    private String ddDate;
    private String chkDate;

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public String getcAgency() {
        return cAgency;
    }

    public void setcAgency(String cAgency) {
        this.cAgency = cAgency;
    }

    public String getcGroup() {
        return cGroup;
    }

    public void setcGroup(String cGroup) {
        this.cGroup = cGroup;
    }

    public String getdNumber() {
        return dNumber;
    }

    public void setdNumber(String dNumber) {
        this.dNumber = dNumber;
    }

    public String getdType() {
        return dType;
    }

    public void setdType(String dType) {
        this.dType = dType;
    }

    public String getChkDate2() {
        return chkDate2;
    }

    public void setChkDate2(String chkDate2) {
        this.chkDate2 = chkDate2;
    }

    public String getChkfDate() {
        return chkfDate;
    }

    public void setChkfDate(String chkfDate) {
        this.chkfDate = chkfDate;
    }

    public String getChkfDate2() {
        return chkfDate2;
    }

    public void setChkfDate2(String chkfDate2) {
        this.chkfDate2 = chkfDate2;
    }

    public String getChgPriceDate() {
        return chgPriceDate;
    }

    public void setChgPriceDate(String chgPriceDate) {
        this.chgPriceDate = chgPriceDate;
    }

    public String getReqDate() {
        return reqDate;
    }

    public void setReqDate(String reqDate) {
        this.reqDate = reqDate;
    }

    public String getProDate() {
        return proDate;
    }

    public void setProDate(String proDate) {
        this.proDate = proDate;
    }

    public String getFmDate() {
        return fmDate;
    }

    public void setFmDate(String fmDate) {
        this.fmDate = fmDate;
    }

    public String getGetmDate() {
        return getmDate;
    }

    public void setGetmDate(String getmDate) {
        this.getmDate = getmDate;
    }

    public String getAccDate() {
        return accDate;
    }

    public void setAccDate(String accDate) {
        this.accDate = accDate;
    }

    public String getDraftDate() {
        return draftDate;
    }

    public void setDraftDate(String draftDate) {
        this.draftDate = draftDate;
    }

    public String getStockDate() {
        return stockDate;
    }

    public void setStockDate(String stockDate) {
        this.stockDate = stockDate;
    }

    public Integer getFirPrice() {
        return firPrice;
    }

    public void setFirPrice(Integer firPrice) {
        this.firPrice = firPrice;
    }

    public Integer getReqPrice() {
        return reqPrice;
    }

    public void setReqPrice(Integer reqPrice) {
        this.reqPrice = reqPrice;
    }

    public Integer getAccPrice() {
        return accPrice;
    }

    public void setAccPrice(Integer accPrice) {
        this.accPrice = accPrice;
    }

    public Integer getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(Integer payPrice) {
        this.payPrice = payPrice;
    }

    public String getConfirmMemo() {
        return confirmMemo;
    }

    public void setConfirmMemo(String confirmMemo) {
        this.confirmMemo = confirmMemo;
    }

    public String getFinishChk() {
        return finishChk;
    }

    public void setFinishChk(String finishChk) {
        this.finishChk = finishChk;
    }

    private String chkDate2;
    private String chkfDate;
    private String chkfDate2;
    private String chgPriceDate;
    private String reqDate;
    private String proDate;
    private String fmDate;
    private String getmDate;
    private String accDate;
    private String draftDate;
    private String stockDate;
    private Integer firPrice;
    private Integer reqPrice;
    private Integer accPrice;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    private Integer payPrice;
    private String confirmMemo;
    private String state;
    private String finishChk;


    private String regDate="";
    public String getRegDate() {
        return regDate;
    }
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    private String regUser="";
    public String getRegUser() {
        return regUser;
    }
    public void setRegUser(String regUser) {
        this.regUser = regUser;
    }

    private String code1="";
    public String getCode1() {
        return code1;
    }
    public void setCode1(String code1) {
        this.code1 = code1;
    }
    private String code2="";
    public String getCode2() {
        return code2;
    }
    public void setCode2(String code2) {
        this.code2 = code2;
    }

    private String code1memo="";
    public String getCode1memo() {
        return code1memo;
    }
    public void setCode1memo(String code1memo) {
        this.code1memo = code1memo;
    }

    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }

    private String url="";

    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }


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


    private String project="";
    public String getProject() { return project;}
    public void setProject(String project) {this.project = project;}

    private String projectcd="";
    public String getProjectcd() {return projectcd; }
    public void setProjectcd(String projectcd) {
        this.projectcd = projectcd;
    }

    private String comment="";
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }

    private List<MultipartFile> uploadfile;

    public List<MultipartFile> getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(List<MultipartFile> uploadfile) {
        this.uploadfile = uploadfile;
    }

    private String mnguser = "";

    public String getMnguser() {
        return mnguser;
    }
    public void setMnguser(String mnguser) {
        this.mnguser = mnguser;
    }

    private String logoimg = "";

    public String getLogoimg() {
        return logoimg;
    }

    public void setLogoimg(String logoimg) {
        this.logoimg = logoimg;
    }


    private String basictitle ="";

    public String getBasictitle() {
        return basictitle;
    }

    public void setBasictitle(String basictitle) {
        this.basictitle = basictitle;
    }

    private String projectSn ="";

    public String getProjectSn() {
        return projectSn;
    }

    public void setProjectSn(String projectSn) {
        this.projectSn = projectSn;
    }

    private String depth ="";

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }


    private String catecode ="";
    public String getCatecode() {
        return catecode;
    }
    public void setCatecode(String catecode) {
        this.catecode = catecode;
    }

    private String bannerImg = "";
    public String getBannerImg() {
        return bannerImg;
    }
    public void setBannerImg(String bannerImg) {
        this.catecode = bannerImg;
    }

    private String iconImg = "";
    public String getIconImg() {
        return catecode;
    }
    public void setIconImg(String catecode) {
        this.catecode = catecode;
    }

    private String adinfo = "";
    public String getAdinfo() {
        return adinfo;
    }
    public void setAdinfo(String adinfo) {
        this.adinfo = adinfo;
    }

    private Integer adtime=0;
    public Integer getAdtime() {
        return adtime;
    }
    public void setAdtime(Integer adtime) {
        this.sn = adtime;
    }

    private String adTag = "";
    public String getAdTag() {
        return adTag;
    }
    public void setAdTag(String adTag) {
        this.adTag = adTag;
    }

    private String keyword = "";
    public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    private Integer pCate;
    public Integer getpCate() {
        return pCate;
    }
    public void setpCate(Integer pCate) {
        this.pCate = pCate;
    }

    private String basicTitle="";
    public String getBasicTitle() {
        return basicTitle;
    }
    public void setBasicTitle(String basicTitle) {
        this.basicTitle = basicTitle;
    }

    private Integer category01;
    public Integer getCategory01() {
        return category01;
    }
    public void setCategory01(Integer category01) {
        this.category01 = category01;
    }

    private Integer category02;
    public Integer getCategory02() {
        return category02;
    }
    public void setCategory02(Integer category02) {
        this.category02 = category02;
    }

    private Integer ct;
    public Integer getCt() {
        return ct;
    }
    public void setCt(Integer ct) {
        this.ct = ct;
    }

    private Integer puse;
    public Integer getPuse() {
        return puse;
    }
    public void setPuse(Integer puse) {
        this.puse = puse;
    }

    private String userType;
    public String getUserType() {
        return userType;
    }
    public void setUserType(String userType) {
        this.userType = userType;
    }

    private String username;
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }


    private Integer adNum;
    public Integer getAdNum(){return adNum;}
    public void setAdNum(Integer adNum){this.adNum = adNum;}

    private Integer like;
    public Integer getLike(){return like;}
    public void setLike(Integer like){this.like = like;}

    private String msg;
    public String getMsg(){return msg;}
    public void setMsg(String msg){this.msg = msg;}

    private Integer msgCt;
    public Integer getMsgCt(){return msgCt;}
    public void setMsgCt(Integer msgCt){this.msgCt = msgCt;}

    private String regid;
    public String getRegid(){return regid;}
    public void setRegid(String regid){this.regid = regid;}


    private String projectTitle;
    public String getProjectTitle(){return projectTitle;}
    public void setProjectTitle(String projectTitle){this.projectTitle = projectTitle;}

    private String category01Title;
    public String getCategory01Title(){return category01Title;}
    public void setCategory01Title(String category01Title){this.category01Title = category01Title;}

    private String category02Title;
    public String getCategory02Title(){return category02Title;}
    public void setCategory02Title(String category02Title){this.category02Title = category02Title;}

    private String suggest;
    public String getSuggest(){return suggest;}
    public void setSuggest(String suggest){this.suggest = suggest;}




    /**
     * get field
     *
     * @return ctName
     */
    public String getCtName() {
        return this.ctName;
    }

    /**
     * set field
     *
     * @param ctName
     */
    public void setCtName(String ctName) {
        this.ctName = ctName;
    }

    /**
     * get field
     *
     * @return ctPrice
     */
    public Integer getCtPrice() {
        return this.ctPrice;
    }

    /**
     * set field
     *
     * @param ctPrice
     */
    public void setCtPrice(Integer ctPrice) {
        this.ctPrice = ctPrice;
    }

    /**
     * get field
     *
     * @return ctType
     */
    public String getCtType() {
        return this.ctType;
    }

    /**
     * set field
     *
     * @param ctType
     */
    public void setCtType(String ctType) {
        this.ctType = ctType;
    }

    /**
     * get field
     *
     * @return department
     */
    public String getDepartment() {
        return this.department;
    }

    /**
     * set field
     *
     * @param department
     */
    public void setDepartment(String department) {
        this.department = department;
    }

    /**
     * get field
     *
     * @return hName
     */
    public String getHName() {
        return this.hName;
    }

    /**
     * set field
     *
     * @param hName
     */
    public void setHName(String hName) {
        this.hName = hName;
    }

    /**
     * get field
     *
     * @return corpName
     */
    public String getCorpName() {
        return this.corpName;
    }

    /**
     * set field
     *
     * @param corpName
     */
    public void setCorpName(String corpName) {
        this.corpName = corpName;
    }

    /**
     * get field
     *
     * @return cAgency
     */
    public String getCAgency() {
        return this.cAgency;
    }

    /**
     * set field
     *
     * @param cAgency
     */
    public void setCAgency(String cAgency) {
        this.cAgency = cAgency;
    }

    /**
     * get field
     *
     * @return gdPrice
     */
    public Integer getGdPrice() {
        return this.gdPrice;
    }

    /**
     * set field
     *
     * @param gdPrice
     */
    public void setGdPrice(Integer gdPrice) {
        this.gdPrice = gdPrice;
    }

    /**
     * get field
     *
     * @return cGroup
     */
    public String getCGroup() {
        return this.cGroup;
    }

    /**
     * set field
     *
     * @param cGroup
     */
    public void setCGroup(String cGroup) {
        this.cGroup = cGroup;
    }

    /**
     * get field
     *
     * @return dNumber
     */
    public String getDNumber() {
        return this.dNumber;
    }

    /**
     * set field
     *
     * @param dNumber
     */
    public void setDNumber(String dNumber) {
        this.dNumber = dNumber;
    }

    /**
     * get field
     *
     * @return dType
     */
    public String getDType() {
        return this.dType;
    }

    /**
     * set field
     *
     * @param dType
     */
    public void setDType(String dType) {
        this.dType = dType;
    }

    /**
     * get field
     *
     * @return dwDate
     */
    public String getDwDate() {
        return this.dwDate;
    }

    /**
     * set field
     *
     * @param dwDate
     */
    public void setDwDate(String dwDate) {
        this.dwDate = dwDate;
    }

    /**
     * get field
     *
     * @return ddDate
     */
    public String getDdDate() {
        return this.ddDate;
    }

    /**
     * set field
     *
     * @param ddDate
     */
    public void setDdDate(String ddDate) {
        this.ddDate = ddDate;
    }

    /**
     * get field
     *
     * @return chkDate
     */
    public String getChkDate() {
        return this.chkDate;
    }

    /**
     * set field
     *
     * @param chkDate
     */
    public void setChkDate(String chkDate) {
        this.chkDate = chkDate;
    }

    /**
     * get field
     *
     * @return pCate
     */
    public Integer getPCate() {
        return this.pCate;
    }

    /**
     * set field
     *
     * @param pCate
     */
    public void setPCate(Integer pCate) {
        this.pCate = pCate;
    }

    private String payDate;

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }
}


package main.java.common.satelite.kr;


public class SearchVO extends  PageVO  {

	private String action = "";
	private String startDate;
	private String endDate;

	private String pwd2dec;
	private String mbid;
	private String bgno;
	private String mbno;



	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}


	public String getPwd2dec() {
		return pwd2dec;
	}

	public void setPwd2dec(String pwd2dec) {
		this.pwd2dec = pwd2dec;
	}


	public String getMbid() {
		return mbid;
	}

	public void setMbid(String mbid) {
		this.mbid = mbid;
	}


	public String getMbno() {
		return mbno;
	}

	public void setMbno(String mbno) {
		this.mbno = mbno;
	}


	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	private String stitle = "";

	public String getStitle() {	return stitle;}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	private String skeyword = "";

	public String getSkeyword() {	return skeyword;}

	public void setSkeyword(String skeyword) {
		this.skeyword = skeyword;
	}

	private String sproject = "";

	public String getSproject() {return sproject;}

	public void setSproject(String sproject) {
		this.sproject = sproject;
	}


	private String stype = "";

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}


	private String ctSource = "";

	public String getCtSource() {
		return ctSource;
	}

	public void setCtSource(String ctSource) {
		this.ctSource = ctSource;
	}


	private String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}


    private String schCode;

    private String orderKeyword = "1";

    private String schSubCode = "";

	public String getOrderKeyword() {
		return orderKeyword;
	}

	public void setOrderKeyword(String orderKeyword) {
		this.orderKeyword = orderKeyword;
	}

	private String searchKeyword = "";
	private String searchTitle = "";
    private String searchType = "";
    private String[] searchTypeArr;

    public String getBgno() {
        return bgno;
    }

    public void setBgno(String bgno) {
        this.bgno = bgno;
    }

    public String getSearchTitle() {
        return searchTitle;
    }

    public void setSearchTitle(String searchTitle) {
        this.searchTitle = searchTitle;
    }

	public String getSearchKeyword() {return searchKeyword;}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String[] getSearchTypeArr() {
        return searchType.split(",");
    }

	public String getSchCode() {
		return schCode;
	}

	public void setSchCode(String schCode) {
		this.schCode = schCode;
	}

	public String getSchSubCode() {
		return schSubCode;
	}

	public void setSchSubCode(String schSubCode) {
		this.schSubCode = schSubCode;
	}

	private String schAreaId;

	public String getSchAreaId() {
		return schAreaId;
	}

	public void setSchAreaId(String schAreaId) {
		this.schAreaId = schAreaId;
	}

	private String seq_no;
	private String subj_id;
	private String time_seq;

	public void setSearchTypeArr(String[] searchTypeArr) {
		this.searchTypeArr = searchTypeArr;
	}

	public String getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(String seq_no) {
		this.seq_no = seq_no;
	}

	public String getSubj_id() {
		return subj_id;
	}

	public void setSubj_id(String subj_id) {
		this.subj_id = subj_id;
	}

	public String getTime_seq() {
		return time_seq;
	}

	public void setTime_seq(String time_seq) {
		this.time_seq = time_seq;
	}

	public String x;
	public String y;

	public String getX() {return x;}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public Integer pageNo = 50;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public String state = "";

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String category01 = "";

	public String getCategory01() {
		return category01;
	}

	public void setCategory01(String category01) {
		this.category01 = category01;
	}


	public String category02 = "";

	public String getCategory02() {
		return category02;
	}

	public void setCategory02(String category02) {
		this.category02 = category02;
	}

	public String usertype = "";

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String code2 = "";

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public Integer psn;

	public Integer getPsn() {
		return psn;
	}

	public void setPsn(Integer psn) {
		this.psn = psn;
	}

}
 
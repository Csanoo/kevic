package main.java.common.satelite.kr;


public class SearchVO extends  PageVO  {
private String action = "";
	
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

	
	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	
	private String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}


	private String sdate;
	private String edate;
	
	private String pwd2dec;
	private String mbid;
	private String bgno;                       
    private String mbno;
    
    private String schCode;
    
    private String orderKeyword = "";

    private String schSubCode = "";

	public String getOrderKeyword() {
		return orderKeyword;
	}

	public void setOrderKeyword(String orderKeyword) {
		this.orderKeyword = orderKeyword;
	}

	private String searchKeyword = "";         
    private String searchType = "";            
    private String[] searchTypeArr;            

    public String getBgno() {
        return bgno;
    }

    public void setBgno(String bgno) {
        this.bgno = bgno;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }
    
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

	public String getX() {

		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}
}
 
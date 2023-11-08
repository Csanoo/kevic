package main.java.admin.satelite.kr;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public class PrdVO {

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


    private String dlvrReqNo ="";
    private String dlvrReqChgOrd ="";
    private String dlvrReqRcptDate ="";
    private String prdctClsfcNo ="";
    private String prdctClsfcNoNm ="";
    private String dtilPrdctClsfcNo ="";
    private String dtilPrdctClsfcNoNm ="";
    private String prdctIdntNo ="";
    private String prdctIdntNoNm ="";
    private String prdctUprc ="";
    private String prdctUnit ="";
    private String prdctQty ="";
    private String dlvrTmlmtDate ="";
    private String cntrctCnclsStleNm ="";
    private String exclcProdctYn ="";
    private String optnDivCdNm ="";
    private String dminsttCd ="";
    private String dminsttNm ="";
    private String dminsttRgnNm ="";
    private String corpNm ="";
    private String fnlDlvrReqYn ="";
    private String incdecQty ="";
    private String incdecAmt ="";
    private String cntrctCorpBizno ="";
    private String dlvrReqNm ="";
    private String cntrctNo ="";
    private String cntrctChgOrd ="";
    private String masYn ="";
    private String cnstwkMtrlDrctPurchsObjYn ="";
    private String IntlCntrctDlvrReqDate ="";
    private Integer dlvrReqQty =0;
    private Integer dlvrReqAmt =0;
    private String smetprCmptProdctYn ="";
    private String corpEntrprsDivNmNm ="";
    private String brnofceNm ="";

    public String getDlvrReqChgOrd() {
        return dlvrReqChgOrd;
    }

    public void setDlvrReqChgOrd(String dlvrReqChgOrd) {
        this.dlvrReqChgOrd = dlvrReqChgOrd;
    }

    public String getDlvrReqRcptDate() {
        return dlvrReqRcptDate;
    }

    public void setDlvrReqRcptDate(String dlvrReqRcptDate) {
        this.dlvrReqRcptDate = dlvrReqRcptDate;
    }

    public String getPrdctClsfcNo() {
        return prdctClsfcNo;
    }

    public void setPrdctClsfcNo(String prdctClsfcNo) {
        this.prdctClsfcNo = prdctClsfcNo;
    }

    public String getPrdctClsfcNoNm() {
        return prdctClsfcNoNm;
    }

    public void setPrdctClsfcNoNm(String prdctClsfcNoNm) {
        this.prdctClsfcNoNm = prdctClsfcNoNm;
    }

    public String getDtilPrdctClsfcNo() {
        return dtilPrdctClsfcNo;
    }

    public void setDtilPrdctClsfcNo(String dtilPrdctClsfcNo) {
        this.dtilPrdctClsfcNo = dtilPrdctClsfcNo;
    }

    public String getDtilPrdctClsfcNoNm() {
        return dtilPrdctClsfcNoNm;
    }

    public void setDtilPrdctClsfcNoNm(String dtilPrdctClsfcNoNm) {
        this.dtilPrdctClsfcNoNm = dtilPrdctClsfcNoNm;
    }

    public String getPrdctIdntNo() {
        return prdctIdntNo;
    }

    public void setPrdctIdntNo(String prdctIdntNo) {
        this.prdctIdntNo = prdctIdntNo;
    }

    public String getPrdctIdntNoNm() {
        return prdctIdntNoNm;
    }

    public void setPrdctIdntNoNm(String prdctIdntNoNm) {
        this.prdctIdntNoNm = prdctIdntNoNm;
    }

    public String getPrdctUprc() {
        return prdctUprc;
    }

    public void setPrdctUprc(String prdctUprc) {
        this.prdctUprc = prdctUprc;
    }

    public String getPrdctUnit() {
        return prdctUnit;
    }

    public void setPrdctUnit(String prdctUnit) {
        this.prdctUnit = prdctUnit;
    }

    public String getPrdctQty() {
        return prdctQty;
    }

    public void setPrdctQty(String prdctQty) {
        this.prdctQty = prdctQty;
    }

    public String getDlvrTmlmtDate() {
        return dlvrTmlmtDate;
    }

    public void setDlvrTmlmtDate(String dlvrTmlmtDate) {
        this.dlvrTmlmtDate = dlvrTmlmtDate;
    }

    public String getCntrctCnclsStleNm() {
        return cntrctCnclsStleNm;
    }

    public void setCntrctCnclsStleNm(String cntrctCnclsStleNm) {
        this.cntrctCnclsStleNm = cntrctCnclsStleNm;
    }

    public String getExclcProdctYn() {
        return exclcProdctYn;
    }

    public void setExclcProdctYn(String exclcProdctYn) {
        this.exclcProdctYn = exclcProdctYn;
    }

    public String getOptnDivCdNm() {
        return optnDivCdNm;
    }

    public void setOptnDivCdNm(String optnDivCdNm) {
        this.optnDivCdNm = optnDivCdNm;
    }

    public String getDminsttCd() {
        return dminsttCd;
    }

    public void setDminsttCd(String dminsttCd) {
        this.dminsttCd = dminsttCd;
    }

    public String getDminsttNm() {
        return dminsttNm;
    }

    public void setDminsttNm(String dminsttNm) {
        this.dminsttNm = dminsttNm;
    }

    public String getDminsttRgnNm() {
        return dminsttRgnNm;
    }

    public void setDminsttRgnNm(String dminsttRgnNm) {
        this.dminsttRgnNm = dminsttRgnNm;
    }

    public String getCorpNm() {
        return corpNm;
    }

    public void setCorpNm(String corpNm) {
        this.corpNm = corpNm;
    }

    public String getFnlDlvrReqYn() {
        return fnlDlvrReqYn;
    }

    public void setFnlDlvrReqYn(String fnlDlvrReqYn) {
        this.fnlDlvrReqYn = fnlDlvrReqYn;
    }

    public String getIncdecQty() {
        return incdecQty;
    }

    public void setIncdecQty(String incdecQty) {
        this.incdecQty = incdecQty;
    }

    public String getIncdecAmt() {
        return incdecAmt;
    }

    public void setIncdecAmt(String incdecAmt) {
        this.incdecAmt = incdecAmt;
    }

    public String getCntrctCorpBizno() {
        return cntrctCorpBizno;
    }

    public void setCntrctCorpBizno(String cntrctCorpBizno) {
        this.cntrctCorpBizno = cntrctCorpBizno;
    }

    public String getDlvrReqNm() {
        return dlvrReqNm;
    }

    public void setDlvrReqNm(String dlvrReqNm) {
        this.dlvrReqNm = dlvrReqNm;
    }

    public String getCntrctNo() {
        return cntrctNo;
    }

    public void setCntrctNo(String cntrctNo) {
        this.cntrctNo = cntrctNo;
    }

    public String getCntrctChgOrd() {
        return cntrctChgOrd;
    }

    public void setCntrctChgOrd(String cntrctChgOrd) {
        this.cntrctChgOrd = cntrctChgOrd;
    }

    public String getMasYn() {
        return masYn;
    }

    public void setMasYn(String masYn) {
        this.masYn = masYn;
    }

    public String getCnstwkMtrlDrctPurchsObjYn() {
        return cnstwkMtrlDrctPurchsObjYn;
    }

    public void setCnstwkMtrlDrctPurchsObjYn(String cnstwkMtrlDrctPurchsObjYn) {
        this.cnstwkMtrlDrctPurchsObjYn = cnstwkMtrlDrctPurchsObjYn;
    }

    public String getIntlCntrctDlvrReqDate() {
        return IntlCntrctDlvrReqDate;
    }

    public void setIntlCntrctDlvrReqDate(String intlCntrctDlvrReqDate) {
        IntlCntrctDlvrReqDate = intlCntrctDlvrReqDate;
    }

    public Integer getDlvrReqQty() {
        return dlvrReqQty;
    }

    public void setDlvrReqQty(Integer dlvrReqQty) {
        this.dlvrReqQty = dlvrReqQty;
    }

    public Integer getDlvrReqAmt() {
        return dlvrReqAmt;
    }

    public void setDlvrReqAmt(Integer dlvrReqAmt) {
        this.dlvrReqAmt = dlvrReqAmt;
    }

    public String getSmetprCmptProdctYn() {
        return smetprCmptProdctYn;
    }

    public void setSmetprCmptProdctYn(String smetprCmptProdctYn) {
        this.smetprCmptProdctYn = smetprCmptProdctYn;
    }

    public String getCorpEntrprsDivNmNm() {
        return corpEntrprsDivNmNm;
    }

    public void setCorpEntrprsDivNmNm(String corpEntrprsDivNmNm) {
        this.corpEntrprsDivNmNm = corpEntrprsDivNmNm;
    }

    public String getBrnofceNm() {
        return brnofceNm;
    }

    public void setBrnofceNm(String brnofceNm) {
        this.brnofceNm = brnofceNm;
    }

    public String getDlvrReqNo() {
        return dlvrReqNo;
    }

    public void setDlvrReqNo(String dlvrReqNo) {
        this.dlvrReqNo = dlvrReqNo;
    }


}

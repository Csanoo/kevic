package main.java.common.satelite.kr;

import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.stream.IntStream;

public class SearchJ {


    public static void execute(String cntNo) throws IOException {

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/ShoppingMallPrdctInfoService06/getDlvrReqInfoList01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=gvrcANYhCnrwf1htPW4XOOK9SdQpBT8ciHwKjLT2fvC9IPiKksbIcDrJKrBbiKP9Lrk2Wd3BlrCgCbfjP7IxLw=="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("inqryDiv","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("cntrctNo","UTF-8") + "=" + URLEncoder.encode(cntNo, "UTF-8")); /*검색하고자하는 입찰공고일시범위 시작 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        //System.out.println(sb.toString());
        JSONObject jsonObject = new JSONObject(sb.toString());

        JSONObject body = jsonObject.getJSONObject("response").getJSONObject("body");

        JSONArray items = body.getJSONArray("items");


            try {
                Connection con = null;
                PreparedStatement pstmt = null;



                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useSSL=false", "kevic", "Kevic10!)");
                String qry = "";
                String shopngCntrctNo ="";
                int vNum = 0;
                for (int i = 0; i < items.length(); i++) {
                    String dlvrReqNo = items.getJSONObject(i).getString(("dlvrReqNo")); ///납품요구 건에 대한 변경 이력 관리를 위하여 부여되는 2자리수이며, 변경 발생 시마다 순차적으로 1씩 증
                    String dlvrReqChgOrd = items.getJSONObject(i).getString(("dlvrReqChgOrd")); // 납품요구서를 조달청에서 접수한 일자
                    String dlvrReqRcptDate = items.getJSONObject(i).getString(("dlvrReqRcptDate")); //납품요구 내용을 요약한 납품요구건의 명칭
                    String dlvrReqNm = items.getJSONObject(i).getString(("dlvrReqNm")); //납품요구 물품별 납품요구수량의 합
                    String dlvrReqQty = items.getJSONObject(i).getString(("dlvrReqQty")); //납품요구번호, 변경차수 등에 해당하는 납품요구금액
                    String dlvrReqAmt = items.getJSONObject(i).getString(("dlvrReqAmt")); //수요기관코드로 행자부코드(행정자치부에서 부여한 기관코드)가 있는 경우 행자부코드가 행자부코드가 없는 경우 조달청에서 부여한 수요기관 코드가 표기됨
                    String dminsttCd = items.getJSONObject(i).getString(("dminsttCd")); //중앙조달인 경우 조달사업에 관한 법률 제2조(정의)에 따라 수요물자의 구매 공급 또는 시설공사 계약의 체결을 조달청장에게 요청할 수 있도록 조달청장이 인정하여 등록한 기관 또는 자체전자조달시스템을 이용하는 기관인 경우 계약을 의뢰한 기관의 명으로 공고기관과 수요기관이 동일할 수 있음
                    String dminsttNm = items.getJSONObject(i).getString(("dminsttNm")); //수요기관이 국가기관인지 지자체인지 등을 구분하는 명
                    String corpNm = items.getJSONObject(i).getString(("corpNm"));
                    String dmndInsttDivNm = items.getJSONObject(i).getString(("dmndInsttDivNm")); //수요기관의 관할 지역명
                    String dminsttRgnNm = items.getJSONObject(i).getString(("dminsttRgnNm")); //납품 업체명
                    String corpEntrprsDivNm = items.getJSONObject(i).getString(("corpEntrprsDivNm")); //기업구분을 대기업,중소기업,비영리법인및기타,중견기업의 분류로 표기
                    String rprsntPrdctClsfcNo = items.getJSONObject(i).getString(("rprsntPrdctClsfcNo")); //계약 또는 납품요구 등에서 서로다른 물품분류번호가 있는 경우에 대표로 지정된
                    String rprsntPrdctClsfcNoNm = items.getJSONObject(i).getString(("rprsntPrdctClsfcNoNm")); //대표 물품의 품명(분류명)
                    String rprsntDtilPrdctClsfcNo = items.getJSONObject(i).getString(("rprsntDtilPrdctClsfcNo")); //계약 또는 납품요구 등에서 서로다른 세부물품분류번호가 있는 경우에 대표로 지정된 세부물품분류번호
                    String rprsntDtilPrdctClsfcNoNm = items.getJSONObject(i).getString(("rprsntDtilPrdctClsfcNoNm")); //대표세부물품분류번호의 품명
                    String maxDlvrTmlmtDate = items.getJSONObject(i).getString(("maxDlvrTmlmtDate")); //서로 다른 물품의 납품기한 중 최대 납품(이행완료)되어야하는 기한
                    String cntrctCnclsStleNm = items.getJSONObject(i).getString(("cntrctCnclsStleNm")); //계약의 체결형태를 구분하는 명으로 총액계약, 단가계약,제3자단가계약등으로 구분함
                    String ctType = "00";
                    if (cntrctCnclsStleNm == "제3자단가"){
                        ctType = "10";
                    }else if(cntrctCnclsStleNm == "단가") {
                        ctType = "20";
                    }else if(cntrctCnclsStleNm == "총액"){
                        ctType = "30";
                    }
                    String cntrctNo = items.getJSONObject(i).getString(("cntrctNo")); //계약서를 식별하기 위한 관리번호
                    String cntrctChgOrd = items.getJSONObject(i).getString(("cntrctChgOrd")); //계약에 대한 변경 이력 관리를 위하여 부여되는 2자리수이며, 변경 발생 시마다 순차적으로 1씩 증가
                    String masYn = items.getJSONObject(i).getString(("masYn")); //다수공급자 계약 체결 여부
                    String exclcProdctYn = items.getJSONObject(i).getString(("exclcProdctYn")); //조달물품우수제품여부 「조달사업에 관한 법률 시행령」 제18조 *우수제품실적 추출 기준 : '15년부터 우수제품조항호 기준으로 함
                    String fnlDlvrReqYn = items.getJSONObject(i).getString(("fnlDlvrReqYn")); //본해당 납품요구건이 최종 납품요구 변경차수인지에 대한 여부
                    String dlvrReqIncdecQty = items.getJSONObject(i).getString(("dlvrReqIncdecQty")); //본 납품요구의 차수와 직전차수를 비교하여 얼마만큼 증가 또는 감소했는지에 따라 수량이 결정되는 것으로 조회기간동안에 가감된 수량을 의미
                    String dlvrReqIncdecAmt = items.getJSONObject(i).getString(("dlvrReqIncdecAmt"));//본 납품요구의 차수와 직전차수를 비교하여 얼마만큼 증가 또는 감소했는지에 따라 금액이 결정되는 것으로 조회기간동안에 가감된 금액을 의미.
                    String corpBizno = items.getJSONObject(i).getString(("corpBizno"));//납품 업체 사업자등록번호

                    shopngCntrctNo = cntrctNo + cntrctChgOrd;
                    qry = "insert into tbl_contract (dNumber,ctName ,ctPrice ,ctType ,department ,hName ,corpName ,cAgency ,gdPrice ,cGroup,dType,dwDate,ddDate,cntrctNo,cntrctChgOrd, rprsntDtilPrdctClsfcNo, regDate)"
                            + "select '" + dlvrReqNo + "','" + dlvrReqNm + "','"+dlvrReqAmt+"', '" + ctType + "', '', '','"+corpNm+"' ,'"+dminsttNm+"','"+dlvrReqAmt+"','','','"+dlvrReqRcptDate+"','"+maxDlvrTmlmtDate+"','"+cntrctNo+"','"+cntrctChgOrd+"', '"+rprsntDtilPrdctClsfcNo+"',NOW() from dual "
                            + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contract WHERE dNumber = '" + dlvrReqNo + "')";


                    System.out.println(vNum+":"+qry);
                    Thread.sleep(300);
                    CallProdlist(dlvrReqNo);
                    pstmt = con.prepareStatement(qry);
                    pstmt.executeUpdate();
                    vNum ++;

                }
                pstmt.close();
                con.close();

            } catch (JSONException | SQLException | InterruptedException e) {
                e.printStackTrace();
            }

    }


    public static void execute_sub(String cntNo) throws IOException {

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/ShoppingMallPrdctInfoService06/getShoppingMallPrdctInfoList01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=gvrcANYhCnrwf1htPW4XOOK9SdQpBT8ciHwKjLT2fvC9IPiKksbIcDrJKrBbiKP9Lrk2Wd3BlrCgCbfjP7IxLw=="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("inqryDiv","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("shopngCntrctNo","UTF-8") + "=" + URLEncoder.encode(cntNo, "UTF-8")); /*검색하고자하는 입찰공고일시범위 시작 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        JSONObject jsonObject = new JSONObject(sb.toString());

        JSONObject body = jsonObject.getJSONObject("response").getJSONObject("body");
        System.out.println("test="+body.getInt("totalCount"));
        if(body.getInt("totalCount") > 0) {
            JSONArray items = body.getJSONArray("items");
            try {
                Connection con2 = null;
                PreparedStatement pstmt2 = null;


                con2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useSSL=false", "kevic", "Kevic10!)");
                String qry = "";
                int vNum = 0;
                for (int i = 0; i < items.length(); i++) {

                    String prdctImgUrl = items.getJSONObject(i).getString(("prdctImgUrl"));
                    String cntrctCorpNm = items.getJSONObject(i).getString(("cntrctCorpNm"));
                    String entrprsDivNm = items.getJSONObject(i).getString(("entrprsDivNm"));
                    String cntrctMthdNm = items.getJSONObject(i).getString(("cntrctMthdNm"));
                    String exclncPrcrmntPrdctYn = items.getJSONObject(i).getString(("exclncPrcrmntPrdctYn"));
                    String masYn = items.getJSONObject(i).getString(("masYn"));
                    String smetprCmptProdctYn = items.getJSONObject(i).getString(("smetprCmptProdctYn"));
                    String cntrctPrceAmt = items.getJSONObject(i).getString(("cntrctPrceAmt"));
                    String prdctUnit = items.getJSONObject(i).getString(("prdctUnit"));
                    String prdctMakrNm = items.getJSONObject(i).getString(("prdctMakrNm"));
                    String prdctDlvrPlceNm = items.getJSONObject(i).getString(("prdctDlvrPlceNm"));
                    String prdctDlvryCndtnNm = items.getJSONObject(i).getString(("prdctDlvryCndtnNm"));
                    String prdctSplyRgnNm = items.getJSONObject(i).getString(("prdctSplyRgnNm"));
                    String dlvrTmlmtDaynum = items.getJSONObject(i).getString(("dlvrTmlmtDaynum"));
                    String prdctLrgclsfcCd = items.getJSONObject(i).getString(("prdctLrgclsfcCd"));
                    String prdctMidclsfcCd = items.getJSONObject(i).getString(("prdctMidclsfcCd"));
                    String prdctLrgclsfcNm = items.getJSONObject(i).getString(("prdctLrgclsfcNm"));
                    String prdctMidclsfcNm = items.getJSONObject(i).getString(("prdctMidclsfcNm"));
                    String prdctClsfcNo = items.getJSONObject(i).getString(("prdctClsfcNo"));
                    String prdctClsfcNoNm = items.getJSONObject(i).getString(("prdctClsfcNoNm"));
                    String dtilPrdctClsfcNo = items.getJSONObject(i).getString(("dtilPrdctClsfcNo"));
                    String dtilPrdctClsfcNoNm = items.getJSONObject(i).getString(("dtilPrdctClsfcNoNm"));
                    String prdctIdntNo = items.getJSONObject(i).getString(("prdctIdntNo"));
                    String prdctSpecNm = items.getJSONObject(i).getString(("prdctSpecNm"));
                    String shopngCntrctNo = items.getJSONObject(i).getString(("shopngCntrctNo"));
                    String shopngCntrctSno = items.getJSONObject(i).getString(("shopngCntrctSno"));
                    String cntrctDate = items.getJSONObject(i).getString(("cntrctDate"));
                    String cntrctBgnDate = items.getJSONObject(i).getString(("cntrctBgnDate"));
                    String cntrctEndDate = items.getJSONObject(i).getString(("cntrctEndDate"));
                    String cntrctDeptNm = items.getJSONObject(i).getString(("cntrctDeptNm"));
                    String prodctCertList = items.getJSONObject(i).getString(("prodctCertList"));
                    String rgstDt = items.getJSONObject(i).getString(("rgstDt"));
                    String cntrctCorpBizno = items.getJSONObject(i).getString(("cntrctCorpBizno"));


                    qry = "insert into tbl_goods (prdctImgUrl,cntrctCorpNm,entrprsDivNm,cntrctMthdNm,exclncPrcrmntPrdctYn,masYn,smetprCmptProdctYn,cntrctPrceAmt,prdctUnit,prdctMakrNm,prdctDlvrPlceNm,prdctDlvryCndtnNm,prdctSplyRgnNm,dlvrTmlmtDaynum,prdctLrgclsfcCd,prdctMidclsfcCd,prdctLrgclsfcNm,prdctMidclsfcNm,prdctClsfcNo,prdctClsfcNoNm,dtilPrdctClsfcNo,dtilPrdctClsfcNoNm,prdctIdntNo,prdctSpecNm,shopngCntrctNo,shopngCntrctSno,cntrctDate,cntrctBgnDate,cntrctEndDate,cntrctDeptNm,prodctCertList,rgstDt,cntrctCorpBizno)"
                            + "select '" + prdctImgUrl + "', '" + cntrctCorpNm + "','" + entrprsDivNm + "', '" + cntrctMthdNm + "','" + exclncPrcrmntPrdctYn + "', '" + masYn + "', '" + smetprCmptProdctYn + "', '" + cntrctPrceAmt + "', '" + prdctUnit + "', '" + prdctMakrNm + "', '" + prdctDlvrPlceNm + "', '" + prdctDlvryCndtnNm + "', '" + prdctSplyRgnNm + "', '" + dlvrTmlmtDaynum + "', '" + prdctLrgclsfcCd + "', '" + prdctMidclsfcCd + "', '" + prdctLrgclsfcNm + "', '" + prdctMidclsfcNm + "', '" + prdctClsfcNo + "', '" + prdctClsfcNoNm + "', '" + dtilPrdctClsfcNo + "', '" + dtilPrdctClsfcNoNm + "', '" + prdctIdntNo + "', '" + prdctSpecNm + "', '" + shopngCntrctNo + "', '" + shopngCntrctSno + "', '" + cntrctDate + "', '" + cntrctBgnDate + "', '" + cntrctEndDate + "', '" + cntrctDeptNm + "', '" + prodctCertList + "', '" + rgstDt + "', '" + cntrctCorpBizno + "' from dual "
                            + " WHERE NOT EXISTS  (SELECT sno FROM tbl_goods WHERE shopngCntrctNo = '" + shopngCntrctNo + "' and  shopngCntrctSno = '" + shopngCntrctSno + "')";

                    System.out.println(vNum + ":" + qry);
                    pstmt2 = con2.prepareStatement(qry);
                    pstmt2.executeUpdate();
                    vNum++;

                }
                pstmt2.close();
                con2.close();

            } catch (JSONException | SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static void CallProdlist(String ReqNo) throws IOException {

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/ShoppingMallPrdctInfoService06/getDlvrReqDtlInfoList01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=gvrcANYhCnrwf1htPW4XOOK9SdQpBT8ciHwKjLT2fvC9IPiKksbIcDrJKrBbiKP9Lrk2Wd3BlrCgCbfjP7IxLw=="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("inqryDiv","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("dlvrReqNo","UTF-8") + "=" + URLEncoder.encode(ReqNo, "UTF-8")); /*검색하고자하는 입찰공고일시범위 시작 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        JSONObject jsonObject = new JSONObject(sb.toString());

        JSONObject body = jsonObject.getJSONObject("response").getJSONObject("body");
        System.out.println("test="+body.getInt("totalCount"));
        if(body.getInt("totalCount") > 0) {
            JSONArray items = body.getJSONArray("items");
            try {
                Connection con2 = null;
                PreparedStatement pstmt2 = null;


                con2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useSSL=false", "kevic", "Kevic10!)");
                String qry = "";
                int vNum = 0;
                for (int i = 0; i < items.length(); i++) {

                    String dlvrReqNo = items.getJSONObject(i).getString(("dlvrReqNo"));
                    String dlvrReqChgOrd = items.getJSONObject(i).getString(("dlvrReqChgOrd"));
                    String dlvrReqRcptDate = items.getJSONObject(i).getString(("dlvrReqRcptDate"));
                    String prdctSno = items.getJSONObject(i).getString(("prdctSno"));
                    String prdctClsfcNo = items.getJSONObject(i).getString(("prdctClsfcNo"));
                    String prdctClsfcNoNm = items.getJSONObject(i).getString(("prdctClsfcNoNm"));
                    String dtilPrdctClsfcNo = items.getJSONObject(i).getString(("dtilPrdctClsfcNo"));
                    String dtilPrdctClsfcNoNm = items.getJSONObject(i).getString(("dtilPrdctClsfcNoNm"));
                    String prdctIdntNo = items.getJSONObject(i).getString(("prdctIdntNo"));
                    String prdctIdntNoNm = items.getJSONObject(i).getString(("prdctIdntNoNm"));
                    String prdctUprc = items.getJSONObject(i).getString(("prdctUprc"));
                    String prdctUnit = items.getJSONObject(i).getString(("prdctUnit"));
                    String prdctQty = items.getJSONObject(i).getString(("prdctQty"));
                    String dlvrTmlmtDate = items.getJSONObject(i).getString(("dlvrTmlmtDate"));
                    String cntrctCnclsStleNm = items.getJSONObject(i).getString(("cntrctCnclsStleNm"));
                    String exclcProdctYn = items.getJSONObject(i).getString(("exclcProdctYn"));
                    String optnDivCdNm = items.getJSONObject(i).getString(("optnDivCdNm"));
                    String dminsttCd = items.getJSONObject(i).getString(("dminsttCd"));
                    String dminsttNm = items.getJSONObject(i).getString(("dminsttNm"));
                    String dminsttRgnNm = items.getJSONObject(i).getString(("dminsttRgnNm"));
                    String corpNm = items.getJSONObject(i).getString(("corpNm"));
                    String fnlDlvrReqYn = items.getJSONObject(i).getString(("fnlDlvrReqYn"));
                    String incdecQty = items.getJSONObject(i).getString(("incdecQty"));
                    String incdecAmt = items.getJSONObject(i).getString(("incdecAmt"));
                    String cntrctCorpBizno = items.getJSONObject(i).getString(("cntrctCorpBizno"));
                    String dlvrReqNm = items.getJSONObject(i).getString(("dlvrReqNm"));
                    String cntrctNo = items.getJSONObject(i).getString(("cntrctNo"));
                    String cntrctChgOrd = items.getJSONObject(i).getString(("cntrctChgOrd"));
                    String masYn = items.getJSONObject(i).getString(("masYn"));
                    String cnstwkMtrlDrctPurchsObjYn = items.getJSONObject(i).getString(("cnstwkMtrlDrctPurchsObjYn"));
                    String IntlCntrctDlvrReqDate = items.getJSONObject(i).getString(("IntlCntrctDlvrReqDate"));
                    String dlvrReqQty = items.getJSONObject(i).getString(("dlvrReqQty"));
                    String dlvrReqAmt = items.getJSONObject(i).getString(("dlvrReqAmt"));
                    String smetprCmptProdctYn = items.getJSONObject(i).getString(("smetprCmptProdctYn"));
                    String corpEntrprsDivNmNm = items.getJSONObject(i).getString(("corpEntrprsDivNmNm"));
                    String brnofceNm = items.getJSONObject(i).getString(("brnofceNm"));


                    qry = "insert into tbl_prd (dlvrReqNo,dlvrReqChgOrd,dlvrReqRcptDate,prdctClsfcNo,prdctClsfcNoNm,dtilPrdctClsfcNo,dtilPrdctClsfcNoNm,prdctIdntNo,prdctIdntNoNm,prdctUprc,prdctUnit,prdctQty,dlvrTmlmtDate,cntrctCnclsStleNm,exclcProdctYn,optnDivCdNm,dminsttCd,dminsttNm,dminsttRgnNm,corpNm,fnlDlvrReqYn,incdecQty,incdecAmt,cntrctCorpBizno,dlvrReqNm,cntrctNo,cntrctChgOrd,masYn,cnstwkMtrlDrctPurchsObjYn,IntlCntrctDlvrReqDate,dlvrReqQty,dlvrReqAmt,smetprCmptProdctYn,corpEntrprsDivNmNm,brnofceNm)"
                            + "select '"+dlvrReqNo+"','"+dlvrReqChgOrd+"','"+dlvrReqRcptDate+"','"+prdctClsfcNo+"','"+prdctClsfcNoNm+"','"+dtilPrdctClsfcNo+"','"+dtilPrdctClsfcNoNm+"','"+prdctIdntNo+"','"+prdctIdntNoNm+"','"+prdctUprc+"','"+prdctUnit+"','"+prdctQty+"','"+dlvrTmlmtDate+"','"+cntrctCnclsStleNm+"','"+exclcProdctYn+"','"+optnDivCdNm+"','"+dminsttCd+"','"+dminsttNm+"','"+dminsttRgnNm+"','"+corpNm+"','"+fnlDlvrReqYn+"','"+incdecQty+"','"+incdecAmt+"','"+cntrctCorpBizno+"','"+dlvrReqNm+"','"+cntrctNo+"','"+cntrctChgOrd+"','"+masYn+"','"+cnstwkMtrlDrctPurchsObjYn+"','"+IntlCntrctDlvrReqDate+"','"+dlvrReqQty+"','"+dlvrReqAmt+"','"+smetprCmptProdctYn+"','"+corpEntrprsDivNmNm+"','"+brnofceNm+"' from dual "
                            + " WHERE NOT EXISTS  (SELECT sno FROM tbl_prd WHERE dlvrReqNo = '" + dlvrReqNo + "' and  dlvrReqChgOrd = '" + dlvrReqChgOrd + "' and prdctIdntNo = '"+prdctIdntNo+"')";

                    System.out.println(vNum + ":" + qry);
                    pstmt2 = con2.prepareStatement(qry);
                    pstmt2.executeUpdate();
                    vNum++;

                }
                pstmt2.close();
                con2.close();
            } catch (JSONException | SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static void CallProdlis2(String[] arg) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/ShoppingMallPrdctInfoService06/getDlvrReqDtlInfoList01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=gvrcANYhCnrwf1htPW4XOOK9SdQpBT8ciHwKjLT2fvC9IPiKksbIcDrJKrBbiKP9Lrk2Wd3BlrCgCbfjP7IxLw=="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("inqryDiv","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
        urlBuilder.append("&" + URLEncoder.encode("cntrctNo","UTF-8") + "=" + URLEncoder.encode("002170138", "UTF-8")); /*검색하고자하는 입찰공고일시범위 시작 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        JSONObject jsonObject = new JSONObject(sb.toString());

        JSONObject items = jsonObject.getJSONObject("items");
        JSONArray dlvrReqNo = items.getJSONArray("dlvrReqNo");
        JSONArray dlvrReqChgOrd = items.getJSONArray("dlvrReqChgOrd");
        JSONArray dlvrReqRcptDate = items.getJSONArray("dlvrReqRcptDate");
        JSONArray prdctSno = items.getJSONArray("prdctSno");
        JSONArray prdctClsfcNo = items.getJSONArray("prdctClsfcNo");
        JSONArray prdctClsfcNoNm = items.getJSONArray("prdctClsfcNoNm");
        JSONArray dtilPrdctClsfcNo = items.getJSONArray("dtilPrdctClsfcNo");
        JSONArray dtilPrdctClsfcNoNm = items.getJSONArray("dtilPrdctClsfcNoNm");
        JSONArray prdctIdntNo = items.getJSONArray("prdctIdntNo");
        JSONArray prdctIdntNoNm = items.getJSONArray("prdctIdntNoNm");
        JSONArray prdctUprc = items.getJSONArray("prdctUprc");
        JSONArray prdctUnit = items.getJSONArray("prdctUnit");
        JSONArray prdctQty = items.getJSONArray("prdctQty");
        JSONArray dlvrTmlmtDate = items.getJSONArray("dlvrTmlmtDate");
        JSONArray cntrctCnclsStleNm = items.getJSONArray("cntrctCnclsStleNm");
        JSONArray exclcProdctYn = items.getJSONArray("exclcProdctYn");
        JSONArray optnDivCdNm = items.getJSONArray("optnDivCdNm");
        JSONArray dminsttCd = items.getJSONArray("dminsttCd");
        JSONArray dminsttNm = items.getJSONArray("dminsttNm");
        JSONArray dminsttRgnNm = items.getJSONArray("dminsttRgnNm");
        JSONArray corpNm = items.getJSONArray("corpNm");
        JSONArray fnlDlvrReqYn = items.getJSONArray("fnlDlvrReqYn");
        JSONArray incdecQty = items.getJSONArray("incdecQty");
        JSONArray incdecAmt = items.getJSONArray("incdecAmt");
        JSONArray cntrctCorpBizno = items.getJSONArray("cntrctCorpBizno");
        JSONArray dlvrReqNm = items.getJSONArray("dlvrReqNm");
        JSONArray cntrctNo = items.getJSONArray("cntrctNo");
        JSONArray cntrctChgOrd = items.getJSONArray("cntrctChgOrd");
        JSONArray masYn = items.getJSONArray("masYn");
        JSONArray cnstwkMtrlDrctPurchsObjYn = items.getJSONArray("cnstwkMtrlDrctPurchsObjYn");
        JSONArray IntlCntrctDlvrReqDate = items.getJSONArray("IntlCntrctDlvrReqDate");
        JSONArray dlvrReqQty = items.getJSONArray("dlvrReqQty");
        JSONArray dlvrReqAmt = items.getJSONArray("dlvrReqAmt");
        JSONArray smetprCmptProdctYn = items.getJSONArray("smetprCmptProdctYn");
        JSONArray corpEntrprsDivNmNm = items.getJSONArray("corpEntrprsDivNmNm");
        JSONArray brnofceNm = items.getJSONArray("brnofceNm");





    }

    private static Integer prettyPrint(Iterator<SearchResult> iteratorSearchResults, String keywords, String sType, String userid) {


        Connection con = null;
        PreparedStatement pstmt = null;
        String qry = "";

        int vNum = 0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");

            while (iteratorSearchResults.hasNext()) {

                SearchResult singleVideo = iteratorSearchResults.next();
                ResourceId rId = singleVideo.getId();



                // Double checks the kind is video.

            }
            pstmt.close();
            con.close();

        }catch(Exception e) {
            System.out.println( e.getMessage() );
        }finally {
            return vNum;
        }
    }

}

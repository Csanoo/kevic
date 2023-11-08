<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />


<form id="form1" name="form1" method="post">
    <input type="hidden" name="sn" id="sn"   value="" />


    <section id="main-content" class=" ">
        <div class="col-lg-12">
            <section class="box ">
                <header class="panel_header">
                    <h2 class="title pull-left">Data Info</h2>
                    <div class="actions panel_actions pull-right">
                        <i class="box_toggle fa fa-chevron-down"></i> <i
                            class="box_setting fa fa-cog" data-toggle="modal"
                            href="#section-settings"></i> <i class="box_close fa fa-times"></i>
                    </div>
                </header>
                <div class="content-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="customers">

                                        <tr>
                                            <td class="tdl" style="width: 25%">타이틀</td>
                                            <td style="width: 75%">
                                                <input name="searchTitle" type="text"	value="${searchVO.searchTitle}" class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">등록 기간</td>
                                            <td style="width: 75%">
                                                <input name="startDate" type="text"	 autocomplete="off" value="${searchVO.startDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block"> ~
                                                <input name="endDate" type="text"	autocomplete="off" value="${searchVO.endDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block">
                                                <div style="display: inline-block;">
                                                    <button  type="button" onClick="dateperiod(0);">오늘</button>
                                                    <button type="button" onClick="dateperiod(6);">1주</button>
                                                    <button type="button" onClick="dateperiod(30);">1개월</button>
                                                    <button type="button" onClick="dateperiod(180);">6개월</button>
                                                    <button type="button" onClick="dateperiod(365);">1년</button>
                                                    <button type="button" onClick="dateperiod(999);">전체</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="form-group" style="margin-top: 20px">
                                        <button type="button" class="btn btn-gray" onclick="fn_scInit()">초기화</button>
                                        <button type="button" class="btn btn-orange" onclick="fn_formSubmit()">검색</button>
                                    </div>
                                </div>
                            </div>
                            <script>
                                function fn_formSv() {

                                    $("#loading").show();
                                    document.form1.submit();
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <section class="wrapper"
                 style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

            <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
                <div class="page-title">

                    <div class="pull-left">
                        <h1 class="title">컨텐츠 목록</h1>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">
                <section class="box ">
                    <header class="panel_header mwidth1850" style="min-width:1850px;">
                        <h2 class="title pull-left"> <div style="font-size:14px">총 ${searchVO.totRow}건</div> </h2>
                        <div class="pull-right" style="padding-top: 10px">
                            <ul class="list-unstyled">
                                <li style="float: left;">
                                    <button type="button" class="btn btn-orange" onclick="fn_formGo()">수동 등록</button>
                                    <button type="button" class="btn btn-red" onclick="fn_api()">자동 등록</button>
                                    <button type="button" class="btn btn-gray"  onclick="excelDownload()">엑셀다운로드</button>

                                </li>
                                <li style="float: left;">
                                    <select name="orderKeyword" id="orderKeyword"  >
                                        <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">등록일 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">등록일 오름차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">프로젝트명 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">프로젝트명 오름차순</option>
                                    </select>
                                    <select name="pageNo" id="pageNo"  >
                                        <option <c:if test="${searchVO.pageNo eq '50'}">selected</c:if> value="50">50개</option>
                                        <option <c:if test="${searchVO.pageNo eq '100'}">selected</c:if> value="100">100개</option>
                                        <option <c:if test="${searchVO.pageNo eq '200'}">selected</c:if> value="200">200개</option>
                                        <option <c:if test="${searchVO.pageNo eq '300'}">selected</c:if> value="300">300개</option>
                                        <option <c:if test="${searchVO.pageNo eq '500'}">selected</c:if> value="500">500개</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                    </header>

                    <div class="content-body mwidth1850" style="min-width:1850px;">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <table class="table" id="dTable">
                                    <thead>

                                    <tr>
                                        <th>No</th>
                                        <th>일시</th>
                                        <th>부서</th>
                                        <th>담당자</th>
                                        <th>업체명</th>
                                        <th>실수요기관</th>
                                        <th>공사명</th>
                                        <th>계약금액</th>
                                        <th>납품요구</th>
                                        <th>납품기한</th>
                                        <th>전문기관검사</th>
                                        <th>검수요청</th>
                                        <th>전문기관</th>
                                        <th>대금청구</th>
                                        <th>발주일자</th>
                                        <!--<th>수금일</th>
                                        <th>수금액</th>
                                        <th>정산일</th>
                                        <th>지급일</th>-->
                                        <th>완료여부</th>
                                    </tr>
                                    </thead>
                                    <tbody id="cList">
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <tr>
                                            <td ><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
                                            <td>${listview.regDate}</td>
                                            <td>${listview.department}</td>
                                            <td>${listview.hName}</td>
                                            <td>${listview.corpName}</td>
                                            <td>${listview.cAgency}</td>
                                            <td><a href="/admin/projectDetail?sn=${listview.sn}">${listview.ctName}</a></td>
                                            <td><fmt:formatNumber type="currency" value="${listview.gdPrice}" /></td>
                                            <td>${listview.dwDate}</td>
                                            <td>${listview.ddDate}</td>
                                            <td></td>
                                            <td>${listview.chkDate}</td>
                                            <td>${listview.proDate}</td>
                                            <td>${listview.payDate}</td>
                                            <td>${listview.reqDate}</td>
                                                <%--                                            <td>${listview.getmDate}</td>--%>
                                                <%--                                            <td>${listview.payPrice}</td>--%>
                                                <%--                                            <td>${listview.accDate}</td>--%>
                                                <%--                                            <td>${listview.draftDate}</td>--%>
                                            <td>${listview.finishChk}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${searchVO.totRow <= 0}">
                                        <tr>
                                            <td colspan="20">검색결과가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>

                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12" style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
                                <jsp:include page="/WEB-INF/jsp/common/Paging.jsp" />
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </section>
</form>
<script>
    function fn_formSubmit() {
        var sDate = new Date(document.form1.startDate.value);
        var eDate = new Date(document.form1.endDate.value);
        if(eDate < sDate){
            alert("검색 시작일이 종료일보다 늦을수는 없습니다.");
            return false;
        }
        document.form1.action='';
        document.form1.submit();
    }

    function fn_orderKey(_a) {
        document.form1.action='';
        document.form1.orderKeyword.value = _a;
        document.form1.submit();
    }

    function fn_formGo() {
        location.href = "/admin/projectForm";
    }

    function fn_readGo(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "projectRead";
        document.form1.submit();
    }

    function fn_api() {

        $("#loading").show();
        $.ajax({
            type: "POST",
            url: "/admin/apiCall",
            data: $("form[name=form2]").serialize(),
            success: function(jdata){
                if(jdata != 'TRUE') {
                    alert("수집 오류");
                }else{
                    alert("수집 성공");
                    location.href = "/admin/project";
                }
            },
            error: function(data){alert("수집 오류");}
        });
    }



    function deletePost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function() {
            arr.push($(this).attr('value'));
        });
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
        }
        else{
            $.ajax({
                type: "POST",
                url: "/admin/prtChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){

                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        $.ajax({
                            type: "POST",
                            url: "/admin/listLoadC",
                            data: $("#form1").serialize(),
                            success: function(data){
                                $("#cList").html(data);
                            },
                            error: function(data){alert(data);}
                        });
                    }
                },
                error: function(data){location.href = "/admin/project";}
            });
        }
    }





    function publishNotPost(){
        if(confirm('선택한 컨텐츠의 노출을 중지하시겠습니까?')){
            var cnt = $("input[name='chkSn']:checked").length;
            var arr = new Array();
            $("input[name='chkSn']:checked").each(function () {
                arr.push($(this).attr('value'));
            });
            if (cnt == 0) {
                alert("컨텐츠를 선택해주세요.");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/admin/prtChkNotPublish",
                    data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                    success: function (jdata) {

                        if (jdata != 'TRUE') {
                            alert(" 오류");
                        } else {
                            alert("정상 처리되었습니다.");
                            $.ajax({
                                type: "POST",
                                url: "/admin/listLoadC",
                                data: $("#form1").serialize(),
                                success: function(data){
                                    $("#cList").html(data);
                                },
                                error: function(data){alert(data);}
                            });
                        }
                    },
                    error: function (data) {
                        alert('오류');
                        //location.href = "/admin/project";
                    }
                });
            }
        }else{
            return false;
        }
    }



    function fn_notPublish(_sn){
        if(confirm('컨텐츠의 노출을 중지하시겠습니까?')){
            var arr = new Array();
            arr.push(_sn);
            var cnt = 1;
            $.ajax({
                type: "POST",
                url: "/admin/prtChkNotPublish",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function (jdata) {

                    if (jdata != 'TRUE') {
                        alert("오류");
                    } else {
                        alert("정상 처리되었습니다.");
                        $.ajax({
                            type: "POST",
                            url: "/admin/listLoadC",
                            data: $("#form1").serialize(),
                            success: function(data){
                                $("#cList").html(data);
                            },
                            error: function(data){alert(data);}
                        });
                    }
                },
                error: function (data) {
                    alert('삭제오류');
                    $.ajax({
                        type: "POST",
                        url: "/admin/listLoadC",
                        data: $("#form1").serialize(),
                        success: function(data){
                            $("#cList").html(data);
                        },
                        error: function(data){alert(data);}
                    });
                }
            });
        }else{
            return false;
        }
    }

    function fn_postsortConfirm(){
        if(confirm('저장하시겠습니까?')){
            var cnt = $("input[name='sort']").length;

            var arr = new Array();
            $("input[name='sort']").each(function () {
                // alert($(this).attr('value'));
                arr.push($(this).attr('value'));
            });

            $.ajax({
                type: "POST",
                url: "/admin/prtSortConfirm",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function (jdata) {

                    if (jdata != 'TRUE') {
                        alert("오류");
                    } else {
                        alert("정상 처리되었습니다.");
                        location.href = "/admin/project";
                    }
                },
                error: function (data) {
                    alert('오류발생');
                    location.href = "/admin/project";
                }
            });
        }else{
            return false;
        }
    }
    function excelDownload() {
        document.form1.action='ExcelDownloadP';
        document.form1.submit();
        document.form1.action='';
    }

</script>



<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script>

    $(function(){
        $("#orderKeyword").on("change",function(){
            document.form1.action='';
            document.form1.submit();
        });
        $("#pageNo").on("change",function(){
            document.form1.action='';
            document.form1.submit();
        });
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });

        //   $("#dTable").tableDnD({
        //     onDragClass: "dragRow"
        //});
        $("#pubproject").on("change",function(){
            var sn = $("#pubproject option:selected").val();
            $( "#category2" ).html('<option value="0">카테고리</option>');
            $( "#category1" ).html('<option value="0">카테고리</option>');
            $.get("/admin/category01?sn="+sn+"&sel=${searchVO.category01}",function(data){
                $( "#category1" ).html( data );
                //alert( "Load was performed." );
            });

        });
        $("#category1").on("change",function(){
            var sn = $("#category1 option:selected").val();

            $.get("/admin/category02?sn="+sn+"&sel=${searchVO.category01}",function(data){
                $( "#category2" ).html( data );
                //alert( "Load was performed." );
            });
        });

        $("input[name='suggest']").on("change",function(){

            var sn = $(this).val();
            var state = 'N';
            var $obj = $(this);
            if($(this).is(":checked") == true){
                state = 'Y';
            }

            if(state=='Y'){
                $.ajax({
                    type: "POST",
                    url: "/admin/selectSuggetsCt",
                    data: "sn=" + sn ,
                    success: function (jdata) {
                        var ct = parseInt(jdata);

                        if (ct == 10) {
                            alert('추천 컨텐츠는 10개 이상 설정할 수 없습니다.');
                            $obj.prop("checked", false);
                            return false;
                        }else{
                            $.ajax({
                                type: "POST",
                                url: "/admin/prtChkSuggest",
                                data: "sn=" + sn +"&state="+state,
                                success: function (jdata) {

                                    if (jdata != 'TRUE') {
                                        alert(" 오류");
                                    } else {
                                        //  alert("정상 처리되었니다.");
                                        //  location.href = "/admin/project";
                                    }
                                },
                                error: function (data) {
                                    // alert(삭제완료);
                                    location.href = "/admin/project";
                                }
                            });
                        }
                    },
                    error: function (data) {
                        // alert(삭제완료);
                    }
                });
            }else{
                $.ajax({
                    type: "POST",
                    url: "/admin/prtChkSuggest",
                    data: "sn=" + sn +"&state="+state,
                    success: function (jdata) {

                        if (jdata != 'TRUE') {
                            alert(" 오류");
                        } else {
                            //  alert("정상 처리되었니다.");
                            //  location.href = "/admin/project";
                        }
                    },
                    error: function (data) {
                        // alert(삭제완료);
                        location.href = "/admin/project";
                    }
                });
                //alert(state);
            }
        });
    })

    function categorySet(){
        $.get("/admin/category01?sn=${searchVO.sproject}&sel=${searchVO.category01}",function(data){
            $( "#category1" ).html( data );
            //alert( "Load was performed." );
        });
        $.get("/admin/category02?sn=${searchVO.category01}&sel=${searchVO.category02}",function(data){
            $( "#category2" ).html( data );
            //alert( "Load was performed." );
        });
    }



    categorySet();

    function fn_list(sn, page) {
        page = 1;
        var ppage = page;
        $.get("/admin/msgList?sn="+sn+"&page="+page , function(data){
            $( "#msgList" ).html( data );
        });
    }

</script>
<style>
    .dragRow{
        border:2px solid #CCCCCC;
    }
</style>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">메세지 목록</h4>
            </div>
            <div class="modal-body" id="msgList">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onClick="publishPost();">닫기</button>
            </div>
        </div>
    </div>
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                                            <td class="tdl" style="width: 25%">프로젝트</td>
                                            <td style="width: 75%">
                                                <select name="sproject"  class="form-control" id="pubproject">
                                                    <option value="">프로젝트</option>
                                                    <c:forEach var="projectview" items="${projectview}"   varStatus="status">
                                                        <option value="${projectview.sn}" <c:if test="${searchVO.sproject eq projectview.sn}">selected</c:if>>${projectview.title}</option>
                                                    </c:forEach>
                                                </select>
                                                <div id="category01">
                                                    <select name="category01" id="category1" class="form-control" >
                                                        <option value="0">카테고리</option>

                                                    </select>
                                                </div>
                                                <div id="category02">
                                                    <select name="category02" id="category2" class="form-control" >
                                                        <option value="0">카테고리</option>

                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">컨텐츠 타입</td>
                                            <td style="width: 75%">
                                                <select name="stype"  class="form-control" >
                                                    <option value="">전체</option>
                                                    <c:forEach var="cateview" items="${cateview}"   varStatus="status">
                                                        <option value="${cateview.code2}" <c:if test="${searchVO.stype eq cateview.code2}">selected</c:if>>${cateview.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">타이틀</td>
                                            <td style="width: 75%">
                                                <input name="searchTitle" type="text"	value="${searchVO.searchTitle}" class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">키워드</td>
                                            <td style="width: 75%">
                                                <input name="searchKeyword" type="text"	value="${searchVO.searchKeyword}" class="form-control">
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
                    <header class="panel_header">
                        <h2 class="title pull-left"> <div style="font-size:14px">총 ${searchVO.totRow}건</div> </h2>
                        <div class="pull-right" style="padding-top: 10px">
                            <ul class="list-unstyled">
                                <li style="float: left;">
                                    <button type="button" class="btn btn-orange" onclick="fn_formGo()">직접저장</button>
                                    <button type="button" class="btn btn-gray"   onclick="publishNotPost()">노출중지</button>
                                    <button type="button" class="btn btn-gray"  onclick="excelDownload()">엑셀다운로드</button>
                                    <button type="button" class="btn btn-orange" onclick="fn_postsortConfirm()">순서 저장</button>

                                </li>
                                <li style="float: left;">
                                    <select name="orderKeyword" id="orderKeyword"  >
                                        <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">타이틀 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">타이틀 오름차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">키워드 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">키워드 오름차순</option>
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

                    <div class="content-body">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <table class="table" id="dTable">
                                    <thead>
                                    <colgroup>
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="20%">
                                        <col width="15%">
                                        <col width="10%">
                                    </colgroup>
                                    <tr>
                                        <th><input type="checkbox" id="allChk" ></th>
                                        <th>No</th>
                                        <th>컨텐츠타입</th>
                                        <th >이미지</th>
                                        <th style="200px">출처이미지URL</th>
                                        <th style="150px">영상URL</th>
                                        <th>타이틀</th>
                                        <th>키워드</th>
                                        <th>등록일</th>
                                        <th>메시지</th>
                                        <th>좋아요</th>
                                        <th>순서</th>
                                        <th>노출</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <tr>
                                            <td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
                                            <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
                                            <td>${listview.type}</td>
                                            <td><img src="${listview.imageUrl}" width="110"></td>
                                            <td><div style="width:180px;overflow:hidden;text-overflow: ellipsis">${listview.imageUrl}</div></td>
                                            <td><div style="width:100%;overflow:hidden;text-overflow: ellipsis"><a href="${listview.videoUrl}" target="_blank">${listview.videoUrl}</a></div></td>
                                            <td>${listview.title}</td>
                                            <td>${listview.keyword}</td>
                                            <td>${listview.regDate}<br>${listview.userid}</td>
                                            <td>0</td>
                                            <td>0</td>
                                            <td>
                                                이동
                                                <input type="hidden" value="${listview.sn}" name="sort">
                                            </td>
                                            <td>
                                                <div onclick="fn_notPublish(${listview.sn})">X</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${searchVO.totRow <= 0}">
                                        <tr>
                                            <td colspan="11">검색결과가 없습니다.</td>
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
                        location.href = "/admin/project";
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
                            alert("정상 처리되었니다.");
                            location.href = "/admin/project";
                        }
                    },
                    error: function (data) {
                        alert(삭제완료);
                        location.href = "/admin/project";
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
                        alert("정상 처리되었니다.");
                        location.href = "/admin/project";
                    }
                },
                error: function (data) {
                    alert(삭제완료);
                    location.href = "/admin/project";
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
                        alert("정상 처리되었니다.");
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

        $("#dTable").tableDnD({
            onDragClass: "dragRow"
        });
        $("#pubproject").on("change",function(){
            var sn = $("#pubproject option:selected").val();
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
                <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
            </div>
            <div class="modal-body">
                Modal 내용
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onClick="publishPost();">닫기</button>
            </div>
        </div>
    </div>
</div>


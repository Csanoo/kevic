<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">

    <input type="hidden" name="sn" id="sn" value="" />

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
                                            <td class="tdl" style="width: 25%">프로젝트명</td>
                                            <td style="width: 75%">
                                                <input name="stitle" type="text"	value="${searchVO.stitle}" class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">등록 기간</td>
                                            <td style="width: 75%">
                                                <input name="startDate" type="text"	autocomplete="off" value="${searchVO.startDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block"> ~
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
                                    <div class="form-group" style="margin-top: 20px;float:right">
                                        <button type="button" class="btn btn-gray" onclick="fn_scInit()">초기화</button>
                                        <button type="button" class="btn btn-orange" onclick="fn_formSv()">검색</button>
                                    </div>
                                </div>
                            </div>
                            <script>
                                function fn_formSv() {
                                    var sDate = new Date(document.form1.startDate.value);
                                    var eDate = new Date(document.form1.endDate.value);
                                    if(eDate < sDate){
                                        alert("검색 시작일이 종료일보다 늦을수는 없습니다.");
                                        return false;
                                    }
                                    $("#loading").show();
                                    document.form1.action="";
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
                        <h1 class="title">내역서 목록</h1>
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
                                    <button type="button" class="btn btn-orange" id="updatemPost">선택수정</button>
                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#myModal" onclick="ctNum()">신규 내역서</button>
                                    <button type="button" class="btn btn-gray" onclick="deletePost()">일괄 삭제</button>
                                </li>
                                <li style="float: left;">
                                    <select name="orderKeyword" id="orderKeyword"  >
                                        <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">등록일 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">등록일 오름차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">내역서명 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">내역서명 오름차순</option>
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
                                <table class="table">

                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="allChk" ></th>
                                        <th>No</th>
                                        <th>내역서명</th>
                                        <th>등록일</th>
                                        <th>관리</th>
                                    </tr>
                                    </thead>
                                    <tbody id="cList">

                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <tr>
                                            <td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
                                            <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
                                            <td>${listview.type}</td>
                                            <td>
                                                    ${listview.regDate}<br>
                                            </td>
                                            <td>
                                                <button type="button"  class="btn btn-orange" onclick="delContent(${listview.sn});">삭제</button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${searchVO.totRow <= 0}">
                                        <tr>
                                            <td colspan="8">검색결과가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>

                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12"
                                 style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
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


    function fn_formGo() {
        location.href = "/admin/contentsForm";
    }

    function fn_readGo(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "contentsRead";
        document.form1.submit();
    }


    function deletePost(){
        if(confirm('삭제시 컨텐츠가 영구 삭제되며 프로젝트에 진열된 컨텐츠도 삭제됩니다.')) {
            var cnt = $("input[name='chkSn']:checked").length;
            var arr = new Array();
            $("input[name='chkSn']:checked").each(function () {
                arr.push($(this).attr('value'));
            });
            if (cnt == 0) {
                alert("선택된 글이 없습니다.");
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/admin/contentsChkDelete",
                    data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                    success: function (jdata) {
                        if (jdata != 'TRUE') {
                            alert("삭제 오류");
                        } else {
                            alert("삭제 성공");
                            location.href = "/admin/contents";
                        }
                    },
                    error: function (data) {
                        alert(data);
                        location.href = "/admin/contents";
                    }
                });
            }
        }
    }


    function publishPost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();

        var title = $("input[name='title']").val();


        $.ajax({
            type: "POST",
            url: "/admin/contentsSave",
            data: "RPRT_ODR=" + arr + "&CNT=" + cnt +"&category1="+pubcate01+"&project="+pubproject+"&category2="+pubcate02,

            success: function (jdata) {
                if (jdata != 'TRUE') {
                    alert("삭제 오류");
                } else {
                    alert("노출 성공");
                    $.ajax({
                        type: "POST",
                        url: "/admin/listLoad",
                        data: $("#form1").serialize(),
                        success: function(data){
                            $("#cList").html(data);
                        },
                        error: function(data){alert(data);}
                    });
                }
            },
            error: function (data) {
                location.href = "/admin/project";
            }
        });

    }
    function excelDownload() {
        document.form1.action='ExcelDownload';
        document.form1.submit();
        document.form1.action='';
    }

    function delContent(_sn) {
        if(confirm('삭제시 컨텐츠가 영구 삭제되며 프로젝트에 진열된 컨텐츠도 삭제됩니다.')) {
            $.get("/admin/contentsDelete?sn=" + _sn, function (data) {
                alert("삭제완료");
                $.ajax({
                    type: "POST",
                    url: "/admin/listLoad",
                    data: $("#form1").serialize(),
                    success: function(data){
                            $("#cList").html(data);
                    },
                    error: function(data){alert(data);}
                });
            });

        }
    }

</script>



<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script>

    $(function(){
        $("#orderKeyword").on("change",function(){
            document.form1.submit();
        });
        $("#pageNo").on("change",function(){
            document.form1.submit();
        });

        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
                $("input[name='chkSn']").parent().parent().children(".title").children("button").show();
                $("input[name='chkSn']").parent().parent().children(".title").children("input").attr('readonly', false);
            } else {
                $("input[name='chkSn']").prop('checked', false);
                $("input[name='chkSn']").parent().parent().children(".title").children("button").hide();
                $("input[name='chkSn']").parent().parent().children(".title").children("input").attr('readonly', true);
            }
        });

        $("input[name='chkSn']").on("change",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").parent().parent().children(".title").children("button").show();
                $("input[name='chkSn']").parent().parent().children(".title").children("input").attr('readonly', false);
            } else {
                $("input[name='chkSn']").parent().parent().children(".title").children("input").attr('readonly', true);
                $("input[name='chkSn']").parent().parent().children(".title").children("button").hide();
            }
        });

        $(document).on("click",".btn-modify",function(){
            var _title = $(this).prev("input").val();
            var _sn = $(this).attr("data");
            $.ajax({
                type: "POST",
                url: "/admin/contentsUpdate",
                data: "sn="+_sn+"&title="+_title,
                success: function(data){
                    if(data != 'TRUE') {
                        alert("수정 오류");
                    }else{
                        alert("수정 완료");
                        location.href = "/admin/contents";
                    }
                },
                error: function(data){alert(data);location.href = "/admin/contents";}
            });
        });
        $(document).on("click","#updatemPost",function(){
            var cnt = $("input[name='chkSn']:checked").length;
            var arr = new Array();
            var arrtitle = new Array();
            var title = "";
            var idx;
            $("input[name='chkSn']:checked").each(function() {
                idx = $("input[name='chkSn']").index(this);
                arr.push($(this).attr('value'));
                title = $("input[name='title']").eq(idx).val();
                arrtitle.push(title);
            });

            if(cnt == 0){
                alert("선택된 글이 없습니다.");
            }
            else{
                $.ajax({
                    type: "POST",
                    url: "/admin/contentsChkUpdate",
                    data: "RPRT_ODR=" + arr + "&CNT=" + cnt+ "&STITLE=" + arrtitle,
                    success: function(data){
                        if(data != 'TRUE') {
                            alert("수정 실패");
                        }else{
                            alert("수정 완료");
                            location.href = "/admin/contents";
                        }
                    },
                    error: function(data){alert(data);location.href = "/admin/contents";}
                });
            }
        });
        $("#pubproject").on("change",function(){
            var sn = $("#pubproject option:selected").val();
            $.get("/admin/category01?sn="+sn,function(data){
                $( "#category1" ).html( data );
                //alert( "Load was performed." );
            });
        });
        $("#category1").on("change",function(){
            var sn = $("#category1 option:selected").val();

            $.get("/admin/category02?sn="+sn,function(data){
                $( "#category2" ).html( data );
                //alert( "Load was performed." );
            });
        });
    });
    function ctNum(){
        var cnt = $("input[name='chkSn']:checked").length;
        $("#ctNum").html(cnt);
    }
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">내역서 등록</h4>
            </div>
            <div class="modal-body">
                <form name="publish">
                <table id="customers">
                    <tr>
                        <td class="tdl" style="width: 25%">내역서 </td>
                        <td style="width: 75%">
                            <input type="text" name="title">
                        </td>
                    </tr>

                </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"  onClick="publishPost();">등록</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


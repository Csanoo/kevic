<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />
    <section id="main-content" class=" ">
        <form id="frm" name="frm" method="post" action="rssSave">
        <div class="col-lg-12">
            <section class="box ">
                <header class="panel_header">
                    <h2 class="title pull-left">rss 등록</h2>
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
                                            <td class="tdl" style="width: 25%">RSS 제목</td>
                                            <td style="width: 75%">
                                                <input name="title" type="text"	value="" class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">RSS 주소</td>
                                            <td style="width: 75%;">
                                                <input name="urlChk" id="urlChk" type="hidden"	value="0" >
                                                <input name="url" type="text"	id="url" value="" class="form-control">
                                                <button type="button" class="btn btn-gray" id="dupUrl">중복 확인</button>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="form-group" style="margin-top: 20px">

                                        <button type="button" class="btn btn-orange" onclick="fn_formSubmit()">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        </form>



    <section class="box ">
        <section class="wrapper"
                 style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>
            <form id="form1" name="form1" method="post" >
                <input type="hidden" name="sn">

            <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>

                <div class="page-title">

                    <div class="pull-left">
                        <h1 class="title">rss 목록</h1>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">

                    <header class="panel_header">
                        <h2 class="title pull-left"> <div style="font-size:14px">총 ${searchVO.totRow}건</div> </h2>
                        <div class="pull-right" style="padding-top: 10px">
                            <ul class="list-unstyled">
                                <li style="float: left;">
                                    <button type="button" class="btn btn-orange" onclick="deletePost()">선택 삭제</button>
                                </li>
                                <li style="float: left;">
                                    <select name="orderKeyword" id="orderKeyword"  >
                                        <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">등록일 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">등록일 오름차순</option>
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

                                    <tr>
                                        <th><input type="checkbox" id="allChk" ></th>
                                        <th>No</th>
                                        <th>제목</th>
                                        <th>URL</th>
                                        <th >등록일</th>

                                    </tr>
                                    </thead>
                                    <tbody id="cList">
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <tr>
                                            <td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
                                            <td ><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
                                            <td>${listview.title}</td>
                                            <td>${listview.url}</td>
                                            <td>${listview.regDate}</td>
                                            <td>
                                                <button type="button" class="btn btn-orange" data-toggle="modal" data-target="#myModal"  onclick="fn_modify(${listview.sn})">수정</button>
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

            </div>
            </form>
        </section>
    </section>

<script>
    function fn_formSubmit() {
        if(frm.urlChk.value == '0'){
            alert('주소 확인해주세요.');
            frm.url.focus();
            return false;
        }
        document.frm.submit();
    }

    function fn_orderKey(_a) {
        document.form1.action='';
        document.form1.orderKeyword.value = _a;
        document.form1.submit();
    }

    function fn_formGo() {
        location.href = "/admin/projectForm";
    }

    function fn_modify(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "rssRead";
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
                url: "/admin/rssChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){

                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/rssReg";
                    }
                },
                error: function(data){location.href = "/admin/rssReg";}
            });
        }
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
        var oldTitle = "";
        $("input[name='url']").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldTitle) {
                return;
            }

            oldTitle = currentVal;
            $("#urlChk").val(0);
        });

        $("#dupUrl").on("click",function(){
            var url = $("#url").val();
            if(url==""){
                alert("주소를 입력해주세요");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "/admin/selUrlCt",
                data: "url=" + url,
                success: function (jdata) {
                    if(jdata<1){
                        alert("사용할 수 있는 주소입니다.");
                        $("#urlChk").val(1);
                    }else{
                        alert("중복 된 주소입니다.");
                        $("#urlChk").val(0);
                    }
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
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
                <h4 class="modal-title" id="myModalLabel">수정</h4>
            </div>
            <div class="modal-body" >


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onClick="publishPost();">닫기</button>
            </div>
        </div>
    </div>
</div>


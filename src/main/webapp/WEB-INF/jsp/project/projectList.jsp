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
                                            <td class="tdl" style="width: 25%">사용여</td>
                                            <td style="width: 75%">
                                                <input type="radio" name="state" value="" checked><label>전체</label>
                                                <input type="radio" name="state" value="100"><label>사용</label>
                                                <input type="radio" name="state" value="200"><label>중지</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdl" style="width: 25%">프로젝트명</td>
                                            <td style="width: 75%">
                                                <input name="searchtitle" type="text"	value="${searchVO.searchTitle}" class="form-control">
                                            </td>
                                        </tr>

                                    </table>
                                    <div class="form-group" style="margin-top: 20px">
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
        <section class="wrapper"   style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

            <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
                <div class="page-title">

                    <div class="pull-left">
                        <h1 class="title">콘텐츠 목록</h1>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">
                <section class="box ">
                    <header class="panel_header">
                        <h2 class="title pull-left">목록 </h2>
                        <div class="pull-right" style="padding-top: 10px">
                            <ul class="list-unstyled">
                                <li style="float: left;">
                                    <select name="orderKeyword" id="orderKeyword"  >
                                        <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">타이틀 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">타이틀 오름차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">키워드 내림차순</option>
                                        <option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">키워드 오름차순</option>
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
                                        <col width="10%">
                                        <col width="15%">
                                        <col width="15%">
                                        <col width="20%">
                                        <col width="15%">
                                        <col width="10%">
                                    </colgroup>
                                    <tr>
                                        <th>No</th>
                                        <th>사용여부</th>
                                        <th>로고</th>
                                        <th>타이틀</th>
                                        <th>URL</th>
                                        <th>컨텐츠</th>
                                        <th>등록일</th>
                                        <th>관리</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <tr>
                                            <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
                                            <td><c:if test="${listview.state eq '100'}">사용</c:if><c:if test="${listview.state eq '200'}">사용안함</c:if></td>
                                            <td><img src="/upload/images/${listview.logoimg}" width="110"></td>
                                            <td>${listview.title}</td>
                                            <td><div style="width:100px;overflow:hidden"></div></td>
                                            <td>0</td>
                                            <td>${listview.regDate}</td>
                                            <td><button type="button" class="btn btn-orange" onclick="readPost('${listview.sn}')">관리</button></td>
                                        </tr>
                                    </c:forEach>
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
        var frm = document.form1;
            frm.submit();
    }

    function fn_orderKey(_a) {
        document.form1.orderKeyword.value = _a;
        document.form1.submit();
    }

    function fn_formGo() {

        location.href = "/admin/projectForm";
    }

    function readPost(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "/admin/projectDetail";
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

</script>



<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script>

    $(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });

    })


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


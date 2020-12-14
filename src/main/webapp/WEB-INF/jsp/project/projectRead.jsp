<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />

<section id="main-content" class=" ">
    <section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;padding:15px 0 0 15px;'>

        <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
            <div class="page-title">

                <div class="pull-left">
                    <h1 class="title">프로젝트 관리</h1>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="col-lg-12">
            <section class="box ">
                <header class="panel_header">
                    <h2 class="title pull-left">프로젝트 상세</h2>
                    <div class="actions panel_actions pull-right">

                    </div>

                </header>
                <div class="content-body">
                    <div style="display:flex">
                        <div style="display:flex">
                            <a class="btn btn-orange" href="/admin/projectDetail?sn=${projectInfo.sn}">기본정보</a>
                            <a class="btn btn-gray"href="/admin/categoryDetail?sn=${projectInfo.sn}">카테고리</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <form name="form1" action="projectRegUp" method="post"	enctype="multipart/form-data">
                                <input type="hidden" name="sn" id="sn" value="${projectInfo.sn}">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 15%">프로트젝트명 *</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="title" id="title" value="${projectInfo.title}">
                                                    <button type="button" class="btn btn-gray" id="dupTit">중복 확인</button>( ex : KPOP 걸 그룹)
                                                    <input type="hidden" name="titleCk" id="titleCk" value="3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">프로트젝트 코드 *</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="projectcd"  id="projectcd" value="${projectInfo.projectcd}" readonly>
                                                    <button type="button" class="btn btn-gray" id="dupCd">중복 확인</button>(영문숫자만 입력 ex : PJTKGIRL001)
                                                    <input type="hidden" name="projectcdCk" id="projectcdCk" value="3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">설명</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="comment" value="${projectInfo.comment}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">사용여부</td>
                                                <td style="width: 35%" colspan="3">
                                                    <input type="radio" name="state" value="100" <c:if test="${projectInfo.state eq '100'}">checked</c:if> ><label>사용</label>
                                                    <input type="radio" name="state" value="200" <c:if test="${projectInfo.state eq '200'}">checked</c:if>><label>점검</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본 로고*</td>
                                                <td style="width: 35%" colspan="3">
                                                    <div class="form-group" style="display:block">
                                                        <div class="controls">
                                                            <input type="checkbox" name="modi" value="Y"/>
                                                            <input type="file" name="uploadfile" multiple="" />
                                                            <br /><c:out value="${projectInfo.logoimg}" />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본페이지 타이틀</td>
                                                <td style="width: 35%" colspan="3"><input name="basictitle" type="text" value="${projectInfo.basicTitle}" class="form-control"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">프로젝트 등록자</td>
                                                <td style="width: 35%"><input name="userid" type="hidden" value="admin" >
                                                   admin
                                                </td>
                                                <td class="tdl" style="width: 15%">프로젝트 운영자</td>
                                                <td style="width: 35%" >
                                                    <input name="mnguser" type="text"	class="form-control">
                                                    <button type="button" class="btn btn-gray"	data-toggle="modal" data-target="#myModal">추가</button>

                                                </td>
                                            </tr>
                                        </table>

                                        <div class="form-group" style="margin-top: 10px">
                                            <button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
                                            <button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>
                                        </div>

                                    </div>

                                </div>
                            </form>
                            <script>
                                function fn_formSv() {
                                    var frm =document.form1;
                                    if(frm.titleCk.value == '0'){
                                        alert('프로젝트명을 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    if(frm.projectcdCk.value == '0'){
                                        alert('프로젝트코드를 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    if(frm.basictitle.value == ''){
                                        alert('기본 페이지 타이틀을 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    if(frm.uploadfile.value == ''){력
                                        alert('기본로고를 입해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    document.form1.submit();

                                }
                                function fn_formRtn() {
                                    document.formList.submit();

                                }
                            </script>
                            <form name="form2" id="form2" action="projectSave" method="post"	enctype="multipart/form-data">

                                <input type="hidden" name="sn" id="tableSn" value="${projectInfo.sn}">

                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 15%">제목</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="title"  id="mtitle" value="" class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">내용</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="memo" id="mmemo"  value="" class="form-control">
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="form-group" style="margin-top: 10px">
                                            <button type="button" class="btn btn-orange" id="saveMemo">저장</button>
                                            <button type="button" class="btn btn-orange" id="updateMemo" style="display: none">수정</button>
                                        </div>

                                    </div>

                                </div>
                            </form>
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
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>등록자</th>
                                    <th>등록일</th>
                                    <th>관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="memolist" items="${memolist}" varStatus="status">
                                    <tr>
                                        <td id="tblSn">${memolist.sn}</td>
                                        <td id="tblTitle">${memolist.title}</td>
                                        <td id="tblMemo">${memolist.memo}</td>
                                        <td>admin</td>
                                        <td>${memolist.regDate}</td>
                                        <td>
                                            <button type="button" class="btn btn-gray" onclick="modifyMemo('${memolist.sn}')">수정</button>
                                            <button type="button" class="btn btn-orange" onclick="delMemo('${memolist.sn}')">X</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <form name="formList" action="projectList" method="post">
            <input type="hidden" name="searchType"
                   value="<c:out value="${searchVO.searchType}"/>"> <input
                type="hidden" name="searchKeyword"
                value="<c:out value="${searchVO.searchKeyword}"/>"> <input
                type="hidden" name="orderKeyword"
                value="<c:out value="${fn:trim(searchVO.orderKeyword)}"/>"> <input
                type="hidden" name="page" value="<c:out value="${pageVO.page}"/>">
        </form>



    </section>
</section>
<!-- END CONTENT -->


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />

<script>

    $(function(){
        $("#preview").on("click",function(){
            $("#preview-img").attr("src",$("input[name='imageUrl']").val());
            $("#preview-keyword").html('('+$("input[name='keyword']").val()+')');
            $("#preview-title").html($("input[name='title']").val());

        });


        $("#dupTit").on("click",function(){
            var title = $("#title").val();
            if(title==""){
                alert("프로젝트명을 입력해주세요");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "/admin/selPrjTitCt",
                data: "title=" + title,
                success: function (jdata) {
                    if(jdata<1){
                        alert("사용할 수 있는 프로젝트명입니다.");
                        $("#titleCk").val(1);
                    }else{
                        alert("중복 된 프로젝트명입니다.");
                        $("#titleCk").val(0);
                    }
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        });
        $("#dupCd").on("click",function(){
            var projectcd = $("#projectcd").val();
            if(projectcd==""){
                alert("프로젝트코드를 입력해주세요");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "/admin/selPrjCd",
                data: "title=" + projectcd,
                success: function (jdata) {
                    if(jdata<1){
                        alert("사용할 수 있는 프로젝트코드입니다.");
                        $("#projectcdCk").val(1);
                    }else{
                        alert("중복 된 프로젝트코드입니다.");
                        $("#projectcdCk").val(0);
                    }
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        });
        $("#saveMemo").on("click",function(){
            var $frm = $("#form2");
             $.ajax({
                type: "POST",
                url: "/admin/saveMemo",
                data: $frm.serialize(),
                success: function (data) {
                    location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        });
        $("#updateMemo").on("click",function(){
            var $frm = $("#form2");
            $.ajax({
                type: "POST",
                url: "/admin/updateMemo",
                data: $frm.serialize(),
                success: function (data) {
                    location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        });
    })
    function modifyMemo(){
        $("#mtitle").val($("#tblTitle").text());
        $("#mmemo").val($("#tblMemo").text());
        $("#tableSn").val($("#tblSn").text());
        $("#saveMemo").hide();
        $("#updateMemo").show();

    }
    function delMemo(sn){
        if(confirm("메모를 삭제하겠습니까?")){

            $.ajax({
                type: "POST",
                url: "/admin/delMemo",
                data: {"sn":sn},
                success: function (data) {
                    location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        }

    }
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <table id="customers">
                    <tr>
                        <td class="tdl" style="width: 15%">프로트젝트명 *</td>

                        <td style="width: 35%" colspan="3">
                            <input type="text" name="title" id="title" value="${projectInfo.title}">
                            <button type="button" class="btn btn-gray" id="dupTit">중복 확인</button>( ex : KPOP 걸 그룹)
                            <input type="hidden" name="titleCk" id="titleCk" value="3">
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">프로트젝트 코드 *</td>

                        <td style="width: 35%" colspan="3">
                            <input type="text" name="projectcd"  id="projectcd" value="${projectInfo.projectcd}" readonly>
                            <button type="button" class="btn btn-gray" id="dupCd">중복 확인</button>(영문숫자만 입력 ex : PJTKGIRL001)
                            <input type="hidden" name="projectcdCk" id="projectcdCk" value="3">
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">설명</td>

                        <td style="width: 35%" colspan="3">
                            <input type="text" name="comment" value="${projectInfo.comment}">
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">사용여부</td>
                        <td style="width: 35%" colspan="3">
                            <input type="radio" name="state" value="100" <c:if test="${projectInfo.state eq '100'}">checked</c:if> ><label>사용</label>
                            <input type="radio" name="state" value="200" <c:if test="${projectInfo.state eq '200'}">checked</c:if>><label>점검</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">기본 로고*</td>
                        <td style="width: 35%" colspan="3">
                            <div class="form-group" style="display:block">
                                <div class="controls">
                                    <input type="checkbox" name="modi" value="Y"/>
                                    <input type="file" name="uploadfile" multiple="" />
                                    <br /><c:out value="${projectInfo.logoimg}" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">기본페이지 타이틀</td>
                        <td style="width: 35%" colspan="3"><input name="basictitle" type="text" value="${projectInfo.basicTitle}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td class="tdl" style="width: 15%">프로젝트 등록자</td>
                        <td style="width: 35%"><input name="userid" type="hidden" value="admin" >
                            admin
                        </td>
                        <td class="tdl" style="width: 15%">프로젝트 운영자</td>
                        <td style="width: 35%" >
                            <input name="mnguser" type="text"	class="form-control">
                            <button type="button" class="btn btn-gray"	data-toggle="modal" data-target="#myModal">추가</button>

                        </td>
                    </tr>
                </table>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
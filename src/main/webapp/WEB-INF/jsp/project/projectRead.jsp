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
                                                <td class="tdl" style="width: 15%">프로트젝트 코드</td>

                                                <td style="width: 35%" colspan="3">
                                                    <!--
                                                    <input type="text" name="projectcd"  id="projectcd" value="${projectInfo.projectcd}">
                                                    <button type="button" class="btn btn-gray" id="dupCd">중복 확인</button>(영문숫자만 입력 ex : PJTKGIRL001)
                                                    <input type="hidden" name="projectcdCk" id="projectcdCk" value="3">
                                                    -->
                                                    ${projectInfo.sn}
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
                                                    <input type="radio" name="state" value="200" <c:if test="${projectInfo.state eq '200'}">checked</c:if>><label>사용안함</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본 로고*</td>
                                                <td style="width: 35%" colspan="3">
                                                    <div class="form-group" style="display:block">
                                                        <div class="controls">
                                                            <!--<input type="checkbox" name="modi" value="Y"/>-->
                                                            <input type="file" name="uploadfile"  id="uploadfile" multiple="" accept="image/jpeg, image/png" style="display:inline-block"/> <label>가로 200px,2Mbyte이내,png,jpg</label>
                                                            <div id="imgcon" class="controls">
                                                                <img src="/upload/images/${projectInfo.logoimg}" width="110" id="oldImg">
                                                            </div>
                                                            <br />

                                                            <br>
                                                            <c:out value="${projectInfo.logoimg}" />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본페이지 타이틀</td>
                                                <td style="width: 35%" colspan="3"><input name="basicTitle" type="text" value="${projectInfo.basictitle}" class="form-control"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">프로젝트 등록자</td>
                                                <td style="width: 35%">
                                                  ${projectInfo.regUser}
                                                </td>
                                                <td class="tdl" style="width: 15%">프로젝트 운영자</td>
                                                <td style="width: 35%" >
                                                    <c:forEach var="mlist" items="${mlist}" varStatus="status">
                                                        <c:if test="${mlist.puse eq '1'}">
                                                        <span>${mlist.username}<a style="cursor:pointer;margin-left:5px;" onClick="mDel('${mlist.userid}')">X</a></span>
                                                        </c:if>
                                                    </c:forEach>
                                                    <button type="button" class="btn btn-gray pull-right" data-toggle="modal" onclick="memberList(${projectInfo.sn});" data-target="#myModal">추가</button>

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
                                 //   if(frm.projectcdCk.value == '0'){
                                //        alert('프로젝트코드를 확인해주세요.');
                                  //      frm.projectcd.focus();
                                  //      return false;
                                 //   }

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
                                        <td>${memolist.userid}</td>
                                        <td>${memolist.regDate}</td>
                                        <td>
                                            <button type="button" class="btn btn-gray modifyMemo" >수정</button>
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
            if(title == "${projectInfo.title}"){
                alert("수정 후 확인해주세요");
                return false;
            }
            if(!ckTitle()){
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
            if(projectcd == "${projectInfo.projectcd}"){
                alert("수정 후 확인해주세요");
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
            if(document.form2.title.value == ''){
                alert("메모 제목을 입력해주세요");
                return false;
            }
            if(document.form2.memo.value == ''){
                alert("메모 내용을 입력해주세요");
                return false;return false;
            }
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
            if(document.form2.title.value == ''){
                alert("메모 제목을 입력해주세요");
                return false;
            }
            if(document.form2.memo.value == ''){
                alert("메모 내용을 입력해주세요");
                return false;return false;
            }
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
            var offset = $("#dTable").offset();
            $('html, body').animate({scrollTop : offset.top}, 400);
        });
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });
        $(".modifyMemo").on("click",function(){
            $("#mtitle").val($(this).parent().parent().children("#tblTitle").text());
            $("#mmemo").val($(this).parent().parent().children("#tblMemo").text());
            $("#tableSn").val($(this).parent().parent().children("#tblSn").text());
            $("#saveMemo").hide();
            $("#updateMemo").show();
        });
    })



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

    function mDel(userid){
        $.ajax({
            type: "POST",
            url: "/admin/delMember",
            data: {"userid":userid,"sn":${projectInfo.sn}},
            success: function (data) {
                alert("정상 처리되었습니다.");
                location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
            },
            error: function (data) {
                alert("오류 관리자에게 문의해주세요");
            }
        });
    }
    function memberList(sn){
        $.get("/admin/categoryMember?sn=${projectInfo.sn}",function(data){
            $( "#memberList" ).html( data );
            //alert( "Load was performed." );
        });
    }

    function fn_mngSave(id){
        var cnt = 1;
        var arr = new Array();
        arr.push(id);

        $.get("/admin/cmInsert?RPRT_ODR="+arr+"&CNT=1&sn=${projectInfo.sn}",function(data){
            alert("정상 처리되었습니다.");
            location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
        });
    }
    function ckTitle(){

        var str = document.form1.title;

        var blank_pattern = /^\s+|\s+$/g;
        if( str.value.replace( blank_pattern, '' ) == "" ){
            alert(' 공백만 입력되었습니다 ');
            return false;
        }


        var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

        if( special_pattern.test(str.value) == true ){
            alert('특수문자는 사용할 수 없습니다.');
            return false;
        }


        return true;
    }
    function fn_mngChkSave(){

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
                url: "/admin/cmInsert",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt+"&sn=${projectInfo.sn}",
                success: function (jdata) {

                    if (jdata != 'TRUE') {
                        alert(" 오류");
                    } else {
                        alert("정상 처리되었습니다.");
                        location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
                    }
                },
                error: function (data) {
                   // alert(삭제완료);
                    //location.href = "/admin/project";
                }
            });
        }

    }

    $(function(){
        var oldTitle = "${projectInfo.title}";
        $("#title").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldTitle) {
                return;
            }
            oldTitle = currentVal;
            $("#titleCk").val(0);
        });
        var oldProjectcd = "${projectInfo.projectcd}";
        $("#projectcd").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldProjectcd) {
                return;
            }

            oldProjectcd = currentVal;
            $("#projectcdCk").val(0);
        });
    });
    function checkImgSize(obj, size) {
        var check = false;
        if(window.ActiveXObject) {
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            var filepath = obj[0].value;
            var thefile = fso.getFile(filepath); sizeinbytes = thefile.size;
        } else {//IE 외 //sizeinbytes = document.getElementById(obj).files[0].size;
            sizeinbytes = obj[0].files[0].size;
        }
        var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
        var i = 0;
        var checkSize = size;

        while(checkSize>900) { checkSize/=1024; i++; }

        checkSize = (Math.round(checkSize*100)/100)+' '+fSExt[i];
        var fSize = sizeinbytes;
        if(fSize > size) { alert("첨부파일은 "+ checkSize + " 이하로 등록가능합니다."); $("input[id=uploadfile]").val(""); check = false; } else { check = true; }

        var file  = obj
        var _URL = window.URL || window.webkitURL;
        var img = new Image();

        img.src = _URL.createObjectURL(file);
        img.onload = function() {

            if(img.width != 200) {
                alert("이미지 가로 200px 맞춰서 올려주세요.");
                $("input[id=uploadfile]").val("");
                check = false;
            }
        }

        return check;
    }
    document.getElementById("uploadfile").onchange = function () {
        if(this.value != "") {
            var extPlan = "JPG, PNG";
            var checkSize = 1024*1024*2; // 2MB
            if(!checkImgSize($('#uploadfile'), checkSize)) {
                this.value = "";
                return;
            }
        }
    };
    $(document).on('change', 'input[type=file]', function(){

        var $width = 200;
        var $target = $(this);
        if($target.val()==''){
            $('#imgcon').children('#temp_img').attr('src', '');
            $("#oldImg").show();
            return false;

        }
        var ext = $target.val().match(/\.(.+)$/)[1];
        if(ext != 'jpg' && ext != 'png' && ext != 'jpeg'){
            alert('jpg,png 파일을 입력해주세요.');
            $target.val('');
            return false;
        }
        if(window.FileReader){ //FileReader를 지원하는 브라우저의 경우 IE 10이상, 크롬..

            var reader = new FileReader();

            reader.onload = function (e) {

                $('#imgcon').append('<img src="" id="temp_img" style="display:inline-block" />');  //보이지 않는 임시 img 태그를 생성.
                $("#oldImg").hide();
                $img = $('#temp_img').attr('src', e.target.result);                          //파일을 선택했을 경우 정보를 $img 객체에 저장
                $("#temp_img").load(function(){
                    //$(document).on('change', '#temp_img', function(){
                    //  alert($('#temp_img').width());
                    if($img.width() != $width ){                  //가로 세로 사이즈 비교 후 반환

                        alert('지정된 크기와 맞지 않습니다.('+$width + 'px)');

                        $target.val('');

                        $('#temp_img').remove(); //위에서 생성한 임시 img 태그 삭제
                        $("#oldImg").show();
                        return;

                    }
                });

            };

            reader.readAsDataURL($(this)[0].files[0]);  //파일을 img 태그에 보여줄 수 있도록 base64로 url을 생성합니다.

        } else {                                               //FileReader를 지원하지 않는 브라우저의 경우 IE 9 이하

            $(this)[0].select();

            var src = document.selection.createRange().text;

            $('#imgcon').append('<img src="" id="temp_img" style="display:none;" />');
            $("#oldImg").hide();
            $img = $('#temp_img').attr('src', src);

            $('#temp_img').remove();

            if($img.width() != $width){

                alert('지정된 크기와 맞지 않습니다.('+$width + 'px)');

                $(this).val('');

                return;

            }

        }
        $('#temp_img').remove();
        $("#oldImg").show();

    });
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body" id="memberList">
                <button type="button" class="btn btn-orange pull-right" onclick="fn_mngChkSave()">선택등록</button>
                <table class="table">
                    <thead>
                    <colgroup>
                        <col width="5%">
                        <col width="20%">
                        <col width="25%">
                        <col width="20%">
                        <col width="15%">
                        <col width="15%">

                    </colgroup>
                    <tr>
                        <th><input type="checkbox" id="allChk" ></th>
                        <th>등급</th>
                        <th>사용여부</th>
                        <th>ID</th>
                        <th>이름</th>
                        <th>운영권한</th>
                    </tr>
                    </thead>
                    <tbody  style="height:600px">
                    <c:forEach var="mlist" items="${mlist}" varStatus="status">
                        <tr>
                            <td><input type="checkbox" value="${mlist.userid}" name="chkSn"></td>
                            <td><c:if test="${mlist.userType eq 'SA'}">최고관리자</c:if>
                                <c:if test="${mlist.userType eq ''}">일반관리자</c:if>
                            </td>
                            <td><c:if test="${mlist.state eq 'Y'}">최고관리자</c:if>
                                <c:if test="${mlist.state eq 'N'}">일반관리자</c:if></td>
                            <td>${mlist.userid}</td>
                            <td>${mlist.username}</td>
                            <td><c:if test="${mlist.puse eq 0}" >
                                <button id="projectMember" onClick="fn_mngSave('${mlist.userid}');">등록</button>
                            </c:if> </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-gray pull-right" data-dismiss="modal"  >닫기</button>
            </div>
        </div>
    </div>
</div>
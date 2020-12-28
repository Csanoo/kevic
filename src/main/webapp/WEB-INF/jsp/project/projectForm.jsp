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
                    <h2 class="title pull-left">프로젝트 등록</h2>

                </header>
                <div class="content-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <form name="form1" action="projectRegSave" method="post"	enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 15%">프로트젝트명 *</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="title" id="title" value="">
                                                    <button type="button" class="btn btn-gray" id="dupTit">중복 확인</button>( ex : KPOP 걸 그룹)
                                                    <input type="hidden" name="titleCk" id="titleCk" value="0">
                                                </td>
                                            </tr>
                                            <!--tr>
                                                <td class="tdl" style="width: 15%">프로트젝트 코드 *</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="projectcd"  id="projectcd" value="">
                                                    <button type="button" class="btn btn-gray" id="dupCd">중복 확인</button>(영문숫자만 입력 ex : PJTKGIRL001)
                                                    <input type="hidden" name="projectcdCk" id="projectcdCk" value="0">
                                                </td>
                                            </tr-->
                                            <tr>
                                                <td class="tdl" style="width: 15%">설명</td>

                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" name="comment" value="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">사용여부</td>
                                                <td style="width: 35%" colspan="3">
                                                    <input type="radio" name="state" value="100" checked><label>사용</label>
                                                    <input type="radio" name="state" value="200"><label>사용안함</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본 로고*</td>
                                                <td style="width: 35%" colspan="3">
                                                    <div class="form-group" style="display:block">
                                                        <div class="controls">
                                                            <c:forEach var="listview" items="${listview}" varStatus="status">
                                                                <input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>" >

                                                                <a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
                                                                    <c:out value="${listview.filename}" />
                                                                </a>
                                                                <c:out value="${listview.size2String()}" />
                                                                <br />
                                                            </c:forEach>
                                                            <input type="file" id="uploadfile" name="uploadfile" multiple="" accept="image/*" style="display:inline-block"/> <label>가로 200px,2Mbyte이내,png,jpg</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기본페이지 타이틀</td>
                                                <td style="width: 35%" colspan="3"><input name="basicTitle" type="text" class="form-control"></td>
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
                                //    if(frm.projectcdCk.value == '0'){
                                 //       alert('프로젝트코드를 확인해주세요.');
                                 //       frm.projectcd.focus();
                                 //       return false;
                               //     }
                                    if(frm.uploadfile.value == ''){
                                        alert('기본로고를 입력해주세요.');
                                        frm.uploadfile.focus();
                                        return false;
                                    }
                                    document.form1.submit();

                                }
                                function fn_formRtn() {
                                    document.formList.submit();

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
                            </script>
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
        var oldTitle = "${projectInfo.title}";
        $("input[name='title']").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldTitle) {
                return;
            }

            oldTitle = currentVal;
            $("#titleCk").val(0);
        });
        var oldProjectcd = "${projectInfo.projectcd}";
        $("input[name='projectcd']").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldProjectcd) {
                return;
            }

            oldProjectcd = currentVal;
            $("#projectcdCk").val(0);
        });
    })
    $("#dupTit").on("click",function(){
        var title = $("#title").val();
        if(title==""){
            alert("프로젝트명을 입력해주세요");
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


</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <img src="" id="preview-img">
            </div>
            <div class="modal-footer">
                <p id="preview-keyword" style="text-align:left;font-size:12px">
                </p>
                <p id="preview-title" style="text-align:left;font-size:16px">
                </p>
            </div>
        </div>
    </div>
</div>
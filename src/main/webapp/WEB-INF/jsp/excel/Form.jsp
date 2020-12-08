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
                    <h2 class="title pull-left">컨텐츠 직접등록</h2>
                    <div class="actions panel_actions pull-right">
                        <i class="box_toggle fa fa-chevron-down"></i> <i
                            class="box_setting fa fa-cog" data-toggle="modal"
                            href="#section-settings"></i> <i class="box_close fa fa-times"></i>
                    </div>
                </header>
                <div class="content-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                                <form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action= "${pageContext.request.contextPath}/excelUploadAjax">

                                    <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">

                                        <div></div>
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 15%">엑셀파일 업로드</td>
                                                <td style="width: 35%"  colspan="3">
                                                    <input id="excelFile" type="file" name="excelFile" class="form-control">
                                                    <p>에러가 발생하여 등록되지 않은 컨텐츠가 발생한 경우, 해당 컨텐츠를 제외하고 등록됩니다.</p>
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="form-group" style="margin-top: 10px">
                                            <button type="button" class="btn btn-gray" onclick="sample();">샘플 파일 다운로드</button>
                                            <button type="button" class="btn btn-orange" onclick="check();">엑셀 업로드</button>
                                        </div>

                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </section>
</section>
<!-- END CONTENT -->


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script>

    $("#excelUpForm").change(function(){
        var form = $("#excelUpForm")[0];

        var data = new FormData(form);
        $.ajax({
            enctype:"multipart/form-data",
            method:"POST",
            url: './excelUp',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
            success: function(result){
                alert("업로드 성공!!");
            }
        });
    });
    function checkFileType(filePath) {
        var fileFormat = filePath.split(".");
        if (fileFormat.indexOf("xlsx") > -1) {
            return true;
        } else {
            return false;
        }

    }

    function check() {
        var file = $("#excelFile").val();
        if (file == "" || file == null) {
            alert("파일을 선택해주세요.");
            return false;
        } else if (!checkFileType(file)) {
            alert("엑셀 파일만 업로드 가능합니다.");
            return false;
        }

        if (confirm("업로드 하시겠습니까?")) {
            document.excelUploadForm.submit();
        }
    }

    function sample(){
        window.location.href='/admin/ExcelSample';
    }

</script>
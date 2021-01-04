<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />
<link href="/design/assets/plugins/uikit/css/uikit.min.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="/design/assets/plugins/uikit/css/components/nestable.min.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="/design/assets/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css" media="screen"/>
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

                </header>
                <div class="content-body">
                    <div style="display:flex">
                        <a class="btn btn-gray" href="/admin/projectDetail?sn=${projectInfo.sn}">기본정보</a>
                        <a class="btn btn-orange"href="/admin/categoryDetail?sn=${projectInfo.sn}">카테고리</a>
                    </div>
                    <div class="row" style="border-top:1px solid #0c0c0c">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div style="display: flex;justify-content: space-between;width:80%;margin-top:20px">
                            <div class="form-group" style="width:49%">
                                <div  style="display:inline-block;width:100px;line-height: 34px;">1차 카테고리</div>
                                <button type="button" id="Cate1DethDel"  class="btn btn-primary  pull-right">삭제</button>
                                <button type="button" id="Cate1DethReg" class="btn btn-purple  pull-right">등록</button>
                            </div>
                            <div class="form-group" style="width:49%">
                                <div style="display:inline-block;width:100px;line-height: 34px">2차 카테고리</div>
                                <button type="button" id="Cate2DethDel" class="btn btn-primary  pull-right">삭제</button>
                                <button type="button" id="Cate2DethReg" class="btn btn-purple  pull-right">등록</button>
                            </div>
                            </div>
                            <div style="display: flex;justify-content: space-between;width:80%">
                                <form name="1depth" id="1depth" style="display: contents;">
                                    <input type="hidden" name="key1" id="key1">
                                <div class="category" style="width:49%;height:300px;min-height:300px;overflow-y: scroll" id="ondCate">
                                </div>
                                </form>


                                <form name="2depth"  id="2depth" style="display: contents;">
                                    <input type="hidden" name="key2">
                                <div class="category" style="width:49%;height:300px;min-height:300px;overflow-y: scroll"  id="twoCate">

                                </div>
                                </form>

                            </div>


                            <script>
                                function fn_formSv() {
                                    document.form1.submit();

                                }
                                function fn_formRtn() {
                                    document.formList.submit();

                                }
                            </script>
                        </div>
                        <div style="display: flex;justify-content: space-between;width:80%;margin-top:20px">
                            <div class="form-group" style="width:49%">

                                <button type="button" id="Cate1Sort" class="btn btn-orange  pull-right">순서 저장</button>
                            </div>
                            <div class="form-group" style="width:49%">
                                <button type="button" id="Cate2Sort" class="btn btn-orange  pull-right">순서 저장</button>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <form name="form1" method="post" id="uploadForm">
                                <input type="hidden" name="depth" value="1">
                                <input type="hidden" name="pCate" value="0" id="pCate">
                                <input type="hidden" name="sn" id="sn" value="0">
                                <input type="hidden" name="projectSn" value="${projectInfo.projectSn}">

                                <div class="form-group">
                                    <label class="form-label" for="categoryTitle">경로</label>
                                        <div id="path"></div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="categoryTitle">카테고리명*</label>
                                    <input type="text" name="title" class="form-control" id="categoryTitle" >
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="banner">타이틀배너</label>
                                    <input type="file" class="form-control" name="uploadfile" id="bannerImg"  >
                                    <input type="text" class="form-control" name="bannerImgOld" id="bannerImgOld" style="border:0">
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="icon">아이콘*</label>
                                    <input type="file" class="form-control" name="uploadfile" id="iconImg" accept=".jpg,.png">
                                    <input type="text" class="form-control" name="iconImgOld" id="iconImgOld" style="border:0">
                                </div>

                                <div class="form-group">
                                    <label class="form-label" >광고 배너 설정</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-1" name="adinfo"  class="icheck-minimal-red" value="N" checked>
                                    <label class="iradio-label form-label" for="minimal-radio-1">사용안함</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-2" name="adinfo"  class="icheck-minimal-red" value="Y">
                                    <label class="iradio-label form-label" for="minimal-radio-2">사용함</label>
                                    <span id="timelayer" style="">
                                        <input type="text" class="" style="width:30px;display: inline-block;" name="adtime" id="time" value="0">건 마다 광고 노출
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">광고 삽입Tag</label>
                                    <div class="controls">
                                        <textarea class="form-control" cols="5" id="field-6" name="adTag"></textarea>
                                    </div>
                                </div>

                                <div class="form-group" style="margin-top: 10px">
                                    <button type="button" class="btn btn-orange" id="CateReg">저장</button>
                                    <button type="button" class="btn btn-orange" id="CateUp" style="display:none">수정</button>
                                    <button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>

                                </div>
                            </form>

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

<script type="text/javascript">

    $(function(){
        $('#CateReg').on('click', function(){
            if($("#categoryTitle").val() == ''){
                alert('카테고리명을 입력하세요');
                return false;
            }
            if(maxLengthCheck('categoryTitle', '카테고리명', 50)){

            }else{
               return false;
            }

            if($("#iconImg").val() == ''){
                alert('아이콘이미지를 등록하세요');
                return false;
            }
            if(confirm('카테고리를 생성하시겠습니까?')) {
                var frm = $('#uploadForm')[0];
                var formData = new FormData(frm);
                formData.append('attachfiles', $("input[name='uploadfile']")[0].files[0]);
                formData.append('attachfiles', $("input[name='uploadfile']")[1].files[0]);
                // alert(formData);
                $.ajax({
                    url: '/admin/CategorySave',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data != '1') {
                            alert(" 오류");
                        } else {
                            cateReload();
                            initval();
                        }
                    },
                    error: function (data) {
                        //  alert(삭제완료);
                        //location.href = "/admin/project";
                    }
                }).done(function (data) {
                    // callback(data);
                });
            }
        });

        $('#CateUp').on('click', function(){
            if($("input[name='title']").val() == ''){
                alert('카테고리명을 입력하세요');
                return false;

            }
            if(maxLengthCheck('categoryTitle', '카테고리명', 50)){

            }else{
                return false;
            }

            if(confirm('카테고리를 수정하시겠습니까?')) {
                var frm = $('#uploadForm')[0];
                var formData = new FormData(frm);
                if($("input[name='uploadfile']")[0].files[0] != ''){
                    formData.append('attachfiles', $("input[name='uploadfile']")[0].files[0]);
                }
                if($("input[name='uploadfile']")[1].files[0] != ''){
                    formData.append('attachfiles', $("input[name='uploadfile']")[1].files[0]);
                }
                // alert(formData);
                $.ajax({
                    url: '/admin/categoryUp',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data != '1') {
                            alert(" 오류");
                        } else {
                            cateReload();
                            initval();
                        }
                    },
                    error: function (data) {
                        //  alert(삭제완료);
                        //location.href = "/admin/project";
                    }
                }).done(function (data) {
                    // callback(data);
                });
            }
        });
        cateReload();
        $(".table").tableDnD({
            onDragClass: "dragRow"
        });

        $("#Cate1DethReg").on("click",function(){
            initval();
            $("input[name='depth']").val('1');
            $("input[name='pCate']").val('0');
            $("input[name='sn']").val('0');
            $("input[name='title']").focus();
            $("#bannerImgOld").val();
            $("#iconImgOld").val();
            alert("카테고리명을 입력해주세요.");
        });

        $("#Cate2DethReg").on("click",function(){
            initval();
            var pCate =  $("input[name='key1']").val();
            if(pCate == ""){
                alert("1차 카테고리를 선택해주세요");
                return false;
            }
            $("input[name='depth']").val('2');
            $("input[name='pCate']").val(pCate);
            $("input[name='sn']").val('0');
            $("input[name='title']").focus();
            alert("카테고리명을 입력해주세요.");
        });
        $("#Cate1DethDel").on("click",function(){
            var sn =  $("input[name='key1']").val();

            if(sn==""){
                alert('삭제할 카테고리를 선택해주세요.');
                return false;
            }
            if(confirm('카테고리를 삭제하시겠습니까? \n하위 카테고리가 있는 경우 함께 삭제되며, 등록된 컨텐츠의 연결은 끊어집니다.')){

            $.get("/admin/categoryFdel?sn="+sn,function(data){alert("정상 처리되었습니다.");cateReload();});

            }

        });

        $("#Cate2DethDel").on("click",function(){
            var sn =  $("input[name='key2']").val();
            if(sn==""){
                alert('삭제할 카테고리를 선택해주세요.');
                return false;
            }
            if(confirm('카테고리를 삭제하시겠습니까?')){

            $.get("/admin/categoryFdel?sn="+sn,function(data){alert("정상 처리되었습니다.");cateReload();});

            }

        });
        $("input:radio[name=adInfo]").click(function(){
       // $(document).on("click","input[name='adInfo']",function(){
            if($("input[name='adInfo']:checked").val() =='Y'){
              //  $("#timelayer").show();
            }else{
           //     $("#timelayer").hide();
            }
        });
        $(document).on("click","#1depthT tr td",function(){

            var Sn =$(this).children("input[name='Sn']").val();
            $("input[name='key1']").val(Sn);
            $("#1depthT tr td").removeClass("active");
            $(this).addClass("active");
            $("#sn").val(Sn);
            $("#categoryTitle").val($(this).children("input[name='title']").val());
            $("#bannerImgOld").val($(this).children("input[name='bannerImg']").val());
            $("#iconImgOld").val($(this).children("input[name='iconImg']").val());
            $("#path").text($(this).children("input[name='title']").val());
            if($(this).children("input[name='adInfo']").val() =='Y'){
                $("minimal-radio-2").attr("checked",true);
                //  $("#CateUp").show();

            }else{
                $("minimal-radio-1").attr("checked",false);
                // $("#CateUp").hide();
            }
            $("#time").val($(this).children("input[name='adtime']").val());
            // $("#adInfo").val();
            var adInfo = $(this).children("input[name='adinfo']").val();

            $("input:radio[name='adinfo']:radio[value='"+adInfo+"']").prop('checked', true);
            $.get("/admin/categoryTList?sn=${projectInfo.projectSn}&pCate="+Sn,function(data){
                $( "#twoCate" ).html( data );
                //alert( "Load was performed." );
            });
            $("#field-6").val($(this).children("input[name='adTag']").val());
            //alert($(this).children("input[id='title']").val());
            $("#CateUp").show();
            $("#CateReg").hide();

        });
        $(document).on("click","#2depthT tr td",function(){
            //alert($(this).children("input[name='adtime']").val());
            var Sn =$(this).children("input[name='Sn']").val();
            $("input[name='key2']").val(Sn);
            $("#2depthT tr td").removeClass("active");
            $(this).addClass("active");
            $("#sn").val(Sn);
            $("#pCate").val($("#key1").val());
            $("#categoryTitle").val($(this).children("input[name='title']").val());
            $("#bannerImgOld").val($(this).children("input[name='bannerImg']").val());
            $("#iconImgOld").val($(this).children("input[name='iconImg']").val());
            $("#time").val($(this).children("input[name='adtime']").val());
            var adInfo = $(this).children("input[name='adinfo']").val();
            $("#path").text($("#1depthT tr td.active").children("input[name='title']").val()+'>'+$(this).children("input[name='title']").val());
            $("input:radio[name='adinfo']:radio[value='"+adInfo+"']").prop('checked', true);
            $("#field-6").val($(this).children("input[name='adTag']").val());
            $("#CateUp").show();
            $("#CateReg").hide();
        });
    })


    function cateReload(){
        $.get("/admin/categoryFList?sn=${projectInfo.projectSn}",function(data){

            $( "#ondCate" ).html( data );
            $( "#twoCate" ).html( "" );
            //alert( "Load was performed." );
            initval()
        });

    }


    function initval(){
        $("#uploadForm input[name='depth']").val('1');
        $("#uploadForm input[name='pCate']").val('0');
        $("#uploadForm input[name='sn']").val('0');
        $("#uploadForm input[name='title']").val('');
        $("#uploadForm input[name='uploadfile']").val('');
        $("#uploadForm input:radio[name='adinfo']:radio[value='N']").prop('checked', true);
        $("#uploadForm textarea[name='adTag']").val('');
        $("#uploadForm input[name='adtime']").val(0);
        $("#bannerImgOld").val('');
        $("#field-6").val('');
        $("#iconImgOld").val('');
        $("#CateUp").hide();
        $("#CateReg").show();
    }

    function fn_formRtn() {
        document.formList.submit();

    }
    $('#Cate1Sort').on('click', function(){

            var cnt = $("#1depth input[name='Sn']").length;
            var arr = new Array();
            $("#1depth input[name='Sn']").each(function() {
                arr.push($(this).attr('value'));
            });

            $.ajax({
                url: '/admin/cateSort',
                type: 'POST',
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function (data) {
                    if (data != 'TRUE') {
                        alert(" 오류");
                    }
                },
                error: function (data) {
                    //  alert(삭제완료);
                    //location.href = "/admin/project";
                }
            }).done(function (data) {
                alert("저장되었습니다.");
            });

    });
    $('#Cate2Sort').on('click', function(){

        var cnt = $("#2depth input[name='Sn']").length;
        var arr = new Array();
        $("#2depth input[name='Sn']").each(function() {
            arr.push($(this).attr('value'));
        });

        $.ajax({
            url: '/admin/cateSort',
            type: 'POST',
            data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
            success: function (data) {
                if (data != 'TRUE') {
                    alert(" 오류");
                }
            },
            error: function (data) {
                //  alert(삭제완료);
                //location.href = "/admin/project";
            }
        }).done(function (data) {
            alert("저장되었습니다.");
        });

    });
</script>
<style>
    .dragRow{
        border:2px solid #CCCCCC;
    }
    .active{border:2px solid #111111;color:white;background-color:#333333 !important}
</style>
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


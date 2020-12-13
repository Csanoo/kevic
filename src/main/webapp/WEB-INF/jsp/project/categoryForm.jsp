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
                                <form name="1depth" style="display: contents;">
                                    <input type="hidden" name="key1">
                                <div class="category" style="width:49%;height:300px;min-height:300px;overflow-y: scroll" id="ondCate">
                                </div>
                                </form>


                                <form name="2depth"  style="display: contents;">
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





                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <form name="form1" method="post" id="uploadForm">
                                <input type="hidden" name="depth" value="1">
                                <input type="hidden" name="pCate" value="0">
                                <input type="hidden" name="sn" value="0">
                                <input type="hidden" name="projectSn" value="${projectInfo.projectSn}">

                                <div class="form-group">
                                    <label class="form-label" for="categoryTitle">카테고리명*</label>
                                    <input title="text" name="title" class="form-control" id="categoryTitle" >
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="banner">타이틀배너</label>
                                    <input type="file" class="form-control" id="bannerImg" name="uploadfile" >
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="icon">아이콘*</label>
                                    <input type="file" class="form-control" name="uploadfile" id="iconImg" >
                                </div>

                                <div class="form-group">
                                    <label class="form-label" >광고 배너 설정</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-1" name="adInfo" value="N" class="icheck-minimal-red"checked>
                                    <label class="iradio-label form-label" for="minimal-radio-1">사용안함</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-2" name="adInfo"  value="Y"  class="icheck-minimal-red">
                                    <label class="iradio-label form-label" for="minimal-radio-2">사용함</label>
                                    <input type="text" class="" style="width:10%;display: inline-block" name="adtime" id="time" >건 마다 광고 노출
                                </div>
                                <div class="form-group">
                                    <label class="form-label">광고 삽입Tag</label>
                                    <div class="controls">
                                        <textarea class="form-control" cols="5" id="field-6" name="adTag"></textarea>
                                    </div>
                                </div>

                                <div class="form-group" style="margin-top: 10px">
                                    <button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
                                    <button type="button" class="btn btn-orange" id="CateReg">저장</button>
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
<script src="/design/assets/plugins/uikit/js/uikit.min.js" type="text/javascript"></script><script src="/design/assets/plugins/uikit/js/components/nestable.min.js" type="text/javascript"></script><!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->
<script type="text/javascript">

    $(function(){

        $('#CateReg').on('click', function(){
            if($("input[name='title']").val() == ''){

                return false;
                alert('카테고리명을 입력하세요');
            }
            if(maxLengthCheck('categoryTitle', '카테고리명', 50)){

            }else{
                return false;
            }

            if($("input[name='iconImg']").val() == ''){
                alert('아이콘이미지를 등하세요');
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

    })


    function cateReload(){
        $.get("/admin/categoryFList?sn=${projectInfo.projectSn}",function(data){

            $( "#ondCate" ).html( data );
            $( "#twoCate" ).html( "" );
            //alert( "Load was performed." );
        });

    }

    $(document).on("click","#1depthT tr td",function(){

        var Sn =$(this).children("input[name='Sn']").val();
        $("input[name='key1']").val(Sn);
        $(".table tr td").removeClass("active");
        $(this).addClass("active");
        $.get("/admin/categoryTList?sn=${projectInfo.projectSn}&pCate="+Sn,function(data){
            $( "#twoCate" ).html( data );
            //alert( "Load was performed." );
        });

    });
    $(document).on("click","#2depthT tr td",function(){

        var Sn =$(this).children("input[name='Sn']").val();
        $("input[name='key2']").val(Sn);
        $(".table tr td").removeClass("active");
        $(this).addClass("active");

    });
    function initval(){
        $("input[name='depth']").val('1');
        $("input[name='pCate']").val('0');
        $("input[name='sn']").val('0');
        $("input[name='title']").val('');
        $("input[name='uploadfile']").val('');
        $("input[name='adInfo']").val('');
        $("textarea[name='adTag']").val('');
        $("input[name='adtime']").val('');
    }

    function fn_formRtn() {
        document.formList.submit();

    }
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
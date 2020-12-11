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
                    <div>
                        <div>기본정보</div>
                        <div>카테고리</div>
                    </div>
                </header>
                <div class="content-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div style="display: flex;justify-content: space-between">
                                <form name="1depth" style="display: contents;">
                                <div class="category" style="width:49%">
                                    <ul class="uk-nestable" data-uk-nestable="{maxDepth:1}">
                                        <li>
                                            <div class="uk-nestable-item">
                                                <div class="uk-nestable-handle"></div>
                                                <div data-nestable-action="toggle"></div>
                                                <div class="list-label">
                                                    <input type="title" value="">
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                </form>
                                <form name="2depth"  style="display: contents;">
                                <div class="category" style="width:49%">
                                    <ul class="uk-nestable" data-uk-nestable="{maxDepth:1}">
                                        <li>
                                            <div class="uk-nestable-item">
                                                <div class="uk-nestable-handle"></div>
                                                <div data-nestable-action="toggle"></div>
                                                <div class="list-label">
                                                    <input type="title" value="">
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
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




                            <div class="form-group" style="margin-top: 10px">
                                <button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
                                <button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>
                            </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <form name="form1" action="projectSave" method="post"	enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="form-label" for="email-1">경로</label>
                                    <input type="email" class="form-control" id="path" >
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="email-1">카테고리명</label>
                                    <input type="title" class="form-control" id="categoryTitle" >
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="email-1">타이틀배너</label>
                                    <input type="banner" class="form-control" id="banner" >
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="email-1">아이콘</label>
                                    <input type="icon" class="form-control" id="icon" >
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="email-1">광고 배너 설정</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-1" name="state" class="icheck-minimal-red" checked>
                                    <label class="iradio-label form-label" for="minimal-radio-1">사용안함</label>
                                    <input tabindex="5" type="radio" id="minimal-radio-2" class="icheck-minimal-red" checked>
                                    <label class="iradio-label form-label" for="minimal-radio-2">사용함</label>
                                    <input type="text" class="" style="width:10%;display: inline-block" name="time" id="time" >건 마다 광고 노출
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="email-1">광고 삽입Tag</label>
                                    <div class="controls">
                                        <textarea class="form-control" cols="5" id="field-6"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary  pull-right">목록</button>
                                    <button type="button" class="btn btn-purple  pull-right">등록</button>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>
            </section>
        </div>

        <form name="formList" action="AppMain1List" method="post">
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
<script>

    $(function(){
        $("#preview").on("click",function(){
            $("#preview-img").attr("src",$("input[name='imageUrl']").val());
            $("#preview-keyword").html('('+$("input[name='keyword']").val()+')');
            $("#preview-title").html($("input[name='title']").val());

        });

    })
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
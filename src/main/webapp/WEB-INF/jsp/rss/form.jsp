<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp"/>

<section id="main-content" class=" ">
    <section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;padding:15px 0 0 15px;'>

        <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
            <div class="page-title">

                <div class="pull-left">
                    <h1 class="title">RSS 관리</h1>
                </div>


            </div>
        </div>
        <div class="clearfix"></div>

        <div class="col-lg-12">
            <section class="box ">
                <header class="panel_header">
                    <h2 class="title pull-left">수정</h2>
                </header>
                <div class="content-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <form name="form1" action="rssModify" method="post" >
                                <input name="sn" type="hidden"	value="${rssInfo.sn}" >
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 25%">RSS 제목</td>
                                                <td style="width: 75%">
                                                    <input name="title" type="text"	value="${rssInfo.title}" class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 25%">RSS 주소</td>
                                                <td style="width: 75%;">
                                                    <input name="urlChk" id="urlChk" type="hidden"	value="3" >
                                                    <input name="url" type="text"	id="url" value="${rssInfo.url}" class="form-control">
                                                    <button type="button" class="btn btn-gray" id="dupUrl">중복 확인</button>
                                                </td>
                                            </tr>
                                        </table>


                                        <div class="form-group" style="margin-top: 10px">

                                            <button type="button" class="btn btn-gray"
                                                    onclick="fn_formRtn()">목록
                                            </button>
                                            <button type="button" class="btn btn-orange"
                                                    onclick="fn_formSv()">저장
                                            </button>
                                        </div>

                                    </div>

                                </div>
                            </form>
                            <script>
                                function fn_formSv() {
                                    var frm =document.form1;

                                    if(frm.title.value == ''){
                                        alert('RSS 제목을 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }

                                    if(frm.urlChk.value == '0'){
                                        alert('Rss 주소 확인해주세요.');
                                        frm.url.focus();
                                        return false;
                                    }

                                    document.form1.submit();

                                }

                                function fn_formRtn() {
                                    document.formList.submit();

                                }
                            </script>

                        </div>
                    </div>
                </div>
            </section>
        </div>

        <form name="formList" action="rssReg" method="post">
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
<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp"/>
<style>
    .dragRow{
        border:2px solid #CCCCCC;
    }
    #banner2{display:none}
    #banner3{display:none}
    #banner4{display:none}
    #banner5{display:none}
</style>
<script type="text/javascript">

    $(function(){

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
            if( $("#urlChk").val()=='3'){
                alert('주소를 변경 후 확인해 주세요.');
                return false;
            }
            if(!regUrlType(url)){
                alert("RSS 주소형식을 확인해주세요.")
                return false;
            }
            if(url==""){
                alert("RSS 주소를 입력해주세요");
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
    function regUrlType(data) {

        var regex = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?/;

        return regex.test(data);

    }
</script>
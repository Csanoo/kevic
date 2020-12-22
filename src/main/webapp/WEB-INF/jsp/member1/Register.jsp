<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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

                            <form name="form1" action="regist2" method="post"	enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="customers">
                                            <tr>
                                                <td class="tdl" style="width: 15%">등급 *</td>

                                                <td style="width: 35%">
                                                    <select name="usertype">
                                                        <c:forEach var="listsel" items="${listsel}"   varStatus="status">
                                                            <option value='${listsel.code2}' >${listsel.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="tdl" style="width: 15%">사용여부</td>
                                                <td style="width: 35%">
                                                    <input type="radio" name="state" value="Y" checked><label>사용</label>
                                                    <input type="radio" name="state" value="N"><label>점검</label>
                                                </td>
                                            </tr>
                                            <tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">ID</td>

                                                <td style="width: 35%">
                                                    <input type="text" name="userid" id="userid" value="">
                                                    <button type="button" class="btn btn-gray" id="dupUserid">중복 확인</button>
                                                    <input type="hidden" name="useridCk" id="useridCk" value="0">
                                                </td>
                                                <td class="tdl" style="width: 15%">이름</td>
                                                <td style="width: 35%">
                                                    <input type="text" name="username" id="username" value="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">이메일</td>
                                                <td style="width: 35%"><input name="email" type="text" class="form-control"></td>
                                                <td class="tdl" style="width: 15%">마지막 로그인</td>
                                                <td style="width: 35%"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">비밀번호</td>
                                                <td style="width: 35%">
                                                    <input autocomplete="off"  type="password" name="userpw" id="userpw"  class="input" value="" size="20" />
                                                </td>
                                                <td class="tdl" style="width: 15%">비밀번호 확인</td>
                                                <td style="width: 35%" >
                                                    <input type="password" name="userpw1" id="userpw1" class="input" value="" size="20" />
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
                                    var f =document.form1;
                                    if ( f.userid.value == "" || f.userpw.value == "" || f.userpw1.value == "" || f.username.value == "" || f.email.value == "" ) {
                                        if ( f.userid.value == ""){
                                            alert("아이디 입력 바랍니다.");
                                            return false;
                                        }
                                        if ( f.userpw.value == "" ){
                                            alert("비밀번호를 입력 바랍니다.");
                                            return false;
                                        }
                                        if ( f.userpw1.value == "" ){
                                            alert("비밀번호 확인을 입력 바랍니다.");
                                            return false;
                                        }
                                        if ( f.username.value == "" ){
                                            alert("회원이름을 입력 바랍니다.");
                                            return false;
                                        }

                                        if (f.email.value == "" ){
                                            alert("이메일을 모두 입력 바랍니다.");
                                            return false;
                                        }



                                    }else{
                                        if ( f.userpw.value != f.userpw1.value ) {
                                            alert("비번 확인 바랍니다.");
                                        } else {
                                            f.submit();
                                        }
                                    }

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

<script>

    $(function(){
        $("#preview").on("click",function(){
            $("#preview-img").attr("src",$("input[name='imageUrl']").val());
            $("#preview-keyword").html('('+$("input[name='keyword']").val()+')');
            $("#preview-title").html($("input[name='title']").val());

        });

    })

    $("#dupUserid").on("click",function(){
        var userid = $("#userid").val();
        if(userid==""){
            alert("아이디 입력해주세요");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/admin/dupUserid",
            data: "userid=" + userid,
            success: function (jdata) {
                if(jdata<1){
                    alert("사용할 수 있는 아이디입니다..");
                    $("#projectcdCk").val(1);
                }else{
                    alert("중복 된 아이디입니다.");
                    $("#projectcdCk").val(0);
                }
            },
            error: function (data) {
                alert("오류 관리자에게 문의해주세요");
            }
        });
    });
</script>
<script>
    function fn_chksave(){
        var f = document.loginform;
        if ( f.userid.value == "" || f.userpw.value == "" || f.userpw1.value == "" || f.username.value == ""
            || f.mobile.value == "" || f.email.value == "" ) {
            alert("필수 정보 모두 입력 바랍니다.");
        }else{
            if ( f.userpw.value != f.userpw1.value ) {
                alert("비밀번호를 확인해주세요.");
            } else {

                f.submit();
            }
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
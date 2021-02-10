<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />

<section id="main-content" class=" ">
    <section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;padding:15px 0 0 15px;'>

        <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
            <div class="page-title">

                <div class="pull-left">
                    <h1 class="title">관리자 계정 관리</h1>
                </div>


            </div>
        </div>
        <div class="clearfix"></div>

        <div class="col-lg-12">
            <section class="box ">
                <header class="panel_header">
                    <h2 class="title pull-left">관리자 계정 등록</h2>

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
                                                    <select name="usertype" id="usertype">
                                                        <c:forEach var="listsel" items="${listsel}"   varStatus="status">
                                                            <option value='${listsel.code2}' >${listsel.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="tdl" style="width: 15%">사용여부</td>
                                                <td style="width: 35%">
                                                    <input type="radio" name="state" value="Y" checked><label>사용</label>
                                                    <input type="radio" name="state" value="N"><label>사용안함</label>
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
                                                <td style="width: 35%"><input name="email" type="email" class="form-control"></td>
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
                                            <tr id="auth-menu" style="display:none;">
                                                <td class="tdl" style="width: 15%;">메뉴 권한 설정</td>
                                                <td colspan="3">
                                                    <div class="form-group">
                                                        <ul class="menu-chk">
                                                            <li style="list-style: none"><input type="checkbox" name="menu01" id="menu01" <c:if test="${mvo.menu01 eq 'Y'}">checked</c:if> value="Y"><label for="menu01">컨텐츠 관리</label></li>
                                                            <li style="list-style: none"><input type="checkbox" name="menu02" id="menu02" <c:if test="${mvo.menu02 eq 'Y'}">checked</c:if> value="Y"><label for="menu02">운영 관리</label></li>
                                                            <li style="list-style: none"><input type="checkbox" name="menu03" id="menu03" <c:if test="${mvo.menu03 eq 'Y'}">checked</c:if> value="Y"><label for="menu03">크롤링 관리</label></li>
                                                            <li style="list-style: none"><input type="checkbox" name="menu04" id="menu04" <c:if test="${mvo.menu04 eq 'Y'}">checked</c:if> value="Y"><label for="menu04">프로젝트 관리</label></li>
                                                        </ul>
                                                    </div>
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

                        </div>
                    </div>
                </div>
            </section>
        </div>

        <form name="formList" action="memberList" method="post">
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

        $("#usertype").on("change",function(){
            var sn = $("#usertype option:selected").val();
           if(sn !='SA'){
               $("#auth-menu").show();
           }else{
               $("#auth-menu").hide();
           }
        });

        if( $("#usertype option:selected").val() != 'SA'){
            $("#auth-menu").show();
        }
    })


    $("#dupUserid").on("click",function(){
        var userid = $("#userid").val();
        if(userid==""){
            alert("아이디 입력해주세요");
            return false;
        }
        if(!checkId()){
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/admin/dupUserid",
            data: "userid=" + userid,
            success: function (jdata) {
                if(jdata<1){
                    alert("사용할 수 있는 아이디입니다..");
                    $("#useridCk").val(1);
                }else{
                    alert("중복 된 아이디입니다.");
                    $("#useridCk").val(0);
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
<script>
    function fn_formSv() {
        var f =document.form1;



        if(f.useridCk.value == '0'){
            alert("아이디 중복 확인해주세요.");
            f.userid.focus();
            return false;
        }
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
                alert("이메일을 입력 바랍니다.");
                return false;
            }


        }else{
            if (!validateEmail(f.email.value)){
                alert('이메일 형식을 확인해 주세요.');
                f.email.focus();
                return false;
            }
            if ( f.userpw.value != f.userpw1.value ) {
                alert("비밀번호를 확인해주세요.");
            } else {
                f.submit();
            }
        }

    }
    function fn_formRtn() {
        document.formList.submit();

    }

    $(function(){
        $("input[name='userid']").on("propertychange change keyup paste input", function() {
            $("input[name='useridCk']").val(0);
        });
    });

    function checkId(){

        var str = document.getElementById('userid');

        if( str.value == '' || str.value == null ){
            alert( '값을 입력해주세요' );
            return false;
        }

        var blank_pattern = /^\s+|\s+$/g;
        if( str.value.replace( blank_pattern, '' ) == "" ){
            alert(' 공백만 입력되었습니다 ');
            return false;
        }


        var blank_pattern = /[\s]/g;
        if( blank_pattern.test( str.value) == true){
            alert(' 공백은 사용할 수 없습니다. ');
            return false;
        }


        var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

        if( special_pattern.test(str.value) == true ){
            alert('특수문자는 사용할 수 없습니다.');
            return false;
        }
        var korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        if( korean.test(str.value) == true ){
            alert('한글은 사용할 수 없습니다.');
            return false;
        }

        return true;
    }
    function validateEmail(email) {
        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return re.test(email);
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
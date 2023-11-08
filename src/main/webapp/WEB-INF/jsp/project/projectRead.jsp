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

                                                <td class="tdl" style="width: 15%">부서 </td>
                                                <td style="width: 35%" >
                                                    <input type="text" class="form-control" name="department" id="department" value="${projectInfo.department}">
                                                </td>
                                                <td class="tdl" style="width: 15%">이름 </td>
                                                <td style="width: 35%" >
                                                    <input type="text" class="form-control" name="hName" id="hName" value="${projectInfo.hName}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">업체명 </td>
                                                <td style="width: 35%" colspan="3">
                                                    <input type="text" class="form-control" name="corpName" id="corpName" value="${projectInfo.corpName}">
                                                </td>
                                            </tr>


                                            <tr>
                                                <td class="tdl" style="width: 15%">구분</td>
                                                <td style="width: 35%" colspan="3">
                                                    <select name="ctType">
                                                        <option value="10" <c:if test="${projectInfo.ctType eq '10'}">selected</c:if>>마스</option>
                                                        <option value="20" <c:if test="${projectInfo.ctType eq '20'}">selected</c:if>>3자</option>
                                                        <option value="30" <c:if test="${projectInfo.ctType eq '30'}">selected</c:if>>우수총액</option>
                                                        <option value="40" <c:if test="${projectInfo.ctType eq '40'}">selected</c:if>>수의</option>
                                                    </select>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">실수요기관 </td>
                                                <td style="width: 35%">
                                                    <input type="text" class="form-control" name="cAgency" id="cAgency" value="${projectInfo.cAgency}">
                                                </td>
                                                <td class="tdl" style="width: 15%">공사명 </td>
                                                <td style="width: 35%">
                                                    <input type="text" class="form-control" name="ctName" id="ctName" value="${projectInfo.ctName}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">납품요구번호 </td>
                                                <td style="width: 35%">
                                                    <input type="text" class="form-control" name="dNumber" id="dNumber" value="${projectInfo.dNumber}">
                                                </td>
                                                <td class="tdl" style="width: 15%">지급방법 </td>
                                                <td style="width: 35%">
                                                    <select name="dType">
                                                        <option value="10" <c:if test="${projectInfo.dType eq '10'}">selected</c:if>>직불</option>
                                                        <option value="20" <c:if test="${projectInfo.dType eq '20'}">selected</c:if>>대지급</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">품대계 </td>
                                                <td style="width: 35%">
                                                    <input type="text" class="form-control" name="gdPrice" id="gdPrice" value="${projectInfo.gdPrice}" >
                                                </td>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">남품요구</td>
                                                <td style="width: 35%"  colspan="1"><input name="dwDate" type="date"	class="form-control" value="${projectInfo.dwDate}"></td>
                                                <td class="tdl" style="width: 15%">남품기한</td>
                                                <td style="width: 35%"  colspan="1"><input name="ddDate" type="date"	class="form-control" value="${projectInfo.ddDate}"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">검사요청</td>
                                                <td style="width: 35%"  colspan="1"><input name="chkDate" type="date"	class="form-control" value="${projectInfo.chkDate}"></td>
                                                <td class="tdl" style="width: 15%">검수요청</td>
                                                <td style="width: 35%"  colspan="1"><input name="chkDate2" type="date"	class="form-control" value="${projectInfo.chkDate2}"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">검사완료</td>
                                                <td style="width: 35%"  colspan="1"><input name="chkfDate" type="date"	class="form-control" value="${projectInfo.chkfDate}"></td>
                                                <td class="tdl" style="width: 15%">검수완료</td>
                                                <td style="width: 35%"  colspan="1"><input name="chkfDate2" type="date"	class="form-control" value="${projectInfo.chkfDate2}"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">전문기관</td>
                                                <td style="width: 35%"  colspan="1"><input name="proDate" type="date"	class="form-control" value="${projectInfo.proDate}"></td>

                                            </tr>

                                            <tr>
                                                <td class="tdl" style="width: 15%">변경납기</td>
                                                <td style="width: 35%"  colspan="1"><input name="chgPriceDate" type="date"	class="form-control" value="${projectInfo.chgPriceDate}"></td>
                                                <td class="tdl" style="width: 15%">대금청구</td>
                                                <td style="width: 35%"  colspan="1"><input name="paydate" type="date"	class="form-control" value="${projectInfo.payDate}"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">증권발행</td>
                                                <td style="width: 35%"  colspan="1"><input name="stockDate" type="date" class="form-control" value="${projectInfo.stockDate}"></td>
                                                <td class="tdl" style="width: 15%">발주요청</td>
                                                <td style="width: 35%"  colspan="1"><input name="reqDate" type="date" class="form-control" value="${projectInfo.reqDate}"></td>
                                            </tr>

                                            <tr>
                                                <td class="tdl" style="width: 15%">선금요청</td>
                                                <td style="width: 35%"  colspan="1"><input name="fmDate" type="date"	class="form-control" value="${projectInfo.fmDate}"></td>
                                                <td class="tdl" style="width: 15%">선금액</td>
                                                <td style="width: 35%"  colspan="1"><input name="firPrice" type="number"	class="form-control" value="${projectInfo.firPrice}" > </td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">수금일</td>
                                                <td style="width: 35%"  colspan="1"><input name="getmDate" type="date"	class="form-control" value="${projectInfo.getmDate}"></td>
                                                <td class="tdl" style="width: 15%">수금액</td>
                                                <td style="width: 35%"  colspan="1"><input name="reqPrice" type="number"	class="form-control" value="${projectInfo.reqPrice}" ></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">정산일</td>
                                                <td style="width: 35%"  colspan="1"><input name="accDate" type="date"	class="form-control" value="${projectInfo.accDate}"></td>
                                                <td class="tdl" style="width: 15%">정산액</td>
                                                <td style="width: 35%"  colspan="1"><input name="accPrice" type="number"	class="form-control" value="${projectInfo.accPrice}" ></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl" style="width: 15%">기안일</td>
                                                <td style="width: 35%"  colspan="1"><input name="draftDate" type="date"	class="form-control" value="${projectInfo.draftDate}"></td>
                                                <td class="tdl" style="width: 15%">지급액</td>
                                                <td style="width: 35%"  colspan="1"><input name="payPrice" type="number"	class="form-control" value="${projectInfo.payPrice}" ></td>
                                            </tr>
                                            <tr>
                                                <td class="tdl">확인사항</td>
                                                <td style="width: 35%"  colspan="3"><textarea name="confirmMemo" class="form-control">${projectInfo.confirmMemo}</textarea></td>
											</tr>
												<tr>
												<td class="tdl" style="width: 15%">완료여부</td>
												<td style="width: 35%"  colspan="1">
													<select name="state">
                                                        <option value="10" <c:if test="${projectInfo.state eq '10'}">selected</c:if>>계약</option>
                                                        <option value="20" <c:if test="${projectInfo.state eq '20'}">selected</c:if>>발주</option>
                                                        <option value="30" <c:if test="${projectInfo.state eq '30'}">selected</c:if>>검수</option>
                                                        <option value="40" <c:if test="${projectInfo.state eq '40'}">selected</c:if>>대청</option>
                                                        <option value="50" <c:if test="${projectInfo.state eq '50'}">selected</c:if>>수금</option>
                                                        <option value="60" <c:if test="${projectInfo.state eq '60'}">selected</c:if>>정산</option>
                                                        <option value="70" <c:if test="${projectInfo.state eq '70'}">selected</c:if>>보류</option>
                                                        <option value="80" <c:if test="${projectInfo.state eq '80'}">selected</c:if>>완료</option>
                                                        <option value="90" <c:if test="${projectInfo.state eq '90'}">selected</c:if>>취소</option>
													</select>
													</td>
												<td class="tdl" style="width: 15%">종결여부</td>
												<td style="width: 35%"  colspan="1"><input name="finishChk" type="checkbox"	class="form-control" <c:if test="${projectInfo.finishChk eq 'Y'}">checked</c:if> ></td>
											</tr>
                                            <tr>
                                                <td class="tdl">파일업로드</td>
                                                <td colspan="3">
                                                    <input type="file" name="uploadfile"  id="uploadfile" multiple="3" style="display:inline-block"/>
                                                    <ul>
<c:forEach var="filelist" items="${filelist}" varStatus="status">
    <li><a href="/upload/${filelist.realname}">${filelist.filename}</a><span data="${filelist.sn}" class="btn_delfile">X</span></li>
</c:forEach>
                                                    </ul>
                                                </td>
                                            </tr>

										</table>


										<div class="form-group" style="margin-top: 10px">
											<button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
                                            <button type="button" class="btn btn-gray"	onclick="fn_dvlrdown()">계약서다운</button>
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>
										</div>

									</div>

								</div>

							</form>


                            <script>
                                function fn_formSv() {
                                    var frm =document.form1;


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

        <form name="formList" action="projectList" method="post">
            <input type="hidden" name="searchType"
                   value="<c:out value="${searchVO.searchType}"/>"> <input
                type="hidden" name="searchKeyword"
                value="<c:out value="${searchVO.searchKeyword}"/>"> <input
                type="hidden" name="orderKeyword"  value="<c:out value="${fn:trim(searchVO.orderKeyword)}"/>"> <input
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
            var offset = $("#dTable").offset();
            $('html, body').animate({scrollTop : offset.top}, 400);
        });

        $(".btn_delfile").on("click",function(){
            if(confirm("메모를 삭제하겠습니까?")){
            $.ajax({
                type: "POST",
                url: "/admin/delFile",
                data: "sn="+$(this).attr("data"),
                success: function (data) {
                    location.href = "/admin/projectDetail?sn=${projectInfo.sn}";
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
            }
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
    function fn_dvlrdown(){
        location.href = "/admin/dlvrform?sn=${projectInfo.sn}";
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

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }

    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }

    function onlynumber(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
    }
</script>

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
						<h1 class="title">Crawler</h1>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>

			<div class="col-lg-12">
				<section class="box ">
					<header class="panel_header">
						<h2 class="title pull-left">Data Info</h2>
						<div class="actions panel_actions pull-right">
							<i class="box_toggle fa fa-chevron-down"></i> <i
								class="box_setting fa fa-cog" data-toggle="modal"
								href="#section-settings"></i> <i class="box_close fa fa-times"></i>
						</div>
					</header>
					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">

								<form name="form2" id="form2" action="reserveModify" method="post" >
									<input type="hidden" name="sn" id="sn" value="${reserveInfo.sn}" />
									<input type="hidden" name="srch" id="srch" value="SRCH" />
									<input type="hidden" id="ChkVal" value="1" />
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<table id="customers">
												<tr>
													<td class="tdl" style="width: 25%">검색어(키워드)</td>
													<td style="width: 75%"><input name="keyword" type="text"	value="${reserveInfo.keyword}" class="form-control"></td>
												</tr>
												<!--
												<tr>
													<td class="tdl" style="width: 25%">컨텐츠 타입</td>
													<td style="width: 75%">
													<select name="type"  class="form-control" >
														<c:forEach var="cateview" items="${cateview}"   varStatus="status">
														<option value="${cateview.code2}" <c:if test="${banner1Info.category eq cateview.code2}">selected</c:if>>${cateview.title}</option>
														</c:forEach>
													</select>
													</td>
												</tr>"
												-->
												<tr>
													<td class="tdl" style="width: 25%">검색할 컨텐츠 수</td>
													<td style="width: 75%">
														<input type="number" name="searchNum" value="${reserveInfo.searchNum}" class="form-control" placeholder="50건 단위로 입력해주세요." step="50" min="0" max="1000" style="width:170px;display:inline-block">
														<br><span>*. 크롤링 매체의 API 정책 및 제공 데이터량에 따라 입력한 숫자 만큼 컨텐츠가 크롤링되지 않을 수 있습니다.</span>
													</td>
												</tr>

												<tr>
													<td class="tdl" style="width: 25%">출처</td>
													<td style="width: 75%">
														<div style="width:600px;display: inline-block">
														<select name="ctSource" id="snsType" class="form-control" >
															<option value="">출처를 선택해주세요.</option>
															<option value="ytb" <c:if test="${reserveInfo.ctSource eq 'ytb'}">selected</c:if>>유튜브</option>
															<option value="twi" <c:if test="${reserveInfo.ctSource eq 'twi'}">selected</c:if>>트위터</option>
															<!--
															<option value="insta">인스타</option>
															<option value="fb">페이스북</option>
															-->
														</select>
														</div>

													</td>
												</tr>
												<tr>
													<td class="tdl" style="width: 25%">예약 정보</td>
													<td style="width: 75%">

														<input type="hidden" value="Y" name="state" id="state1">
														<select name="day" id="days">
															<option value="0" <c:if test="${reserveInfo.day eq '0'}">selected</c:if>>매일</option>
															<option value="2" <c:if test="${reserveInfo.day eq  '2'}">selected</c:if>>월</option>
															<option value="3" <c:if test="${reserveInfo.day eq  '3'}">selected</c:if>>화</option>
															<option value="4" <c:if test="${reserveInfo.day eq  '4'}">selected</c:if>>수</option>
															<option value="5" <c:if test="${reserveInfo.day eq  '5'}">selected</c:if>>목</option>
															<option value="6" <c:if test="${reserveInfo.day eq  '6'}">selected</c:if>>금</option>
															<option value="7" <c:if test="${reserveInfo.day eq  '7'}">selected</c:if>>토</option>
															<option value="1" <c:if test="${reserveInfo.day eq  '1]'}">selected</c:if>>일</option>
														</select>
														<input type="number" maxlength="2" value="${reserveInfo.time}" name="time" style="width: 50px" min="0" max="23">
														<input type="hidden" name="use" value="N">
														<label>시</label>
														<input type="checkbox" value="Y" name="repeat" <c:if test="${reserveInfo.repeat eq 'Y'}">checked</c:if>>
														<label>반복</label>
													</td>
												</tr>
											</table>
											<div class="form-group" style="margin-top: 20px">
												<button type="button" class="btn btn-gray" onclick="fn_list()">목록</button>
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

		</section>
	</section>

		<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript">

    function publishPost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function () {
          //  alert($(this).attr('value'));
            arr.push($(this).attr('value'));
        });
        if (cnt == 0) {
            alert("컨텐츠를 선택해주세요.");
        }
        else {
            $.ajax({
                type: "POST",
                url: "/admin/contentsChkMove",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,

                success: function (jdata) {
                    if (jdata != 'TRUE') {
                        alert("삭제 오류");
                    } else {
                        alert("노출 성공");
                        location.href = "/admin/contents";
                    }
                },
                error: function (data) {
                    //location.href = "/admin/project";
                }
            });
        }
    }
	$(function(){
        $("#orderKeyword").on("change",function(){
            document.form1.submit();
        });
        $("#pageNo").on("change",function(){
            document.form1.submit();
        });
	    $("#allChk").on("click",function(){

	        $("input[name=chkId]").each(function(){
	            if(this.checked){
	                this.checked=false;
				}else{
                    this.checked=true;
				}
			});
		});
        $("select[name='ctSource']").on("change",function(){
            $("#ChkVal").val(0);
            var valType = $("select[name='ctSource'] option:selected").val();

            if(valType=='ytb'){
                $("input[name='searchNum']").attr("placeholder","50건 단위로 입력해주세요.(1000건 초과 검색이 불가합니다.)");
                $("input[name='searchNum']").attr("step","50");
                $("input[name='searchNum']").val();

            }else{
                $("input[name='searchNum']").attr("placeholder","1000건 초과 검색이 불가합니다.");
                $("input[name='searchNum']").attr("step","1");
                $("input[name='searchNum']").val();

            }
        });
        $("select[name='day']").on("change",function(){
            var val = $("select[name='day'] option:selected").val();

            if(val=='0') {
                //$("input[name='repeat']").attr("readonly", "true");
                $("input[name='repeat']").prop("checked", "true");
            }else{
               // $("input[name='repeat']").attr("readonly", "false");
			}
        });
        $("input[name='repeat']").on("click",function(){
            var val = $("select[name='day'] option:selected").val();
            if(val=='0') {
                $("input[name='repeat']").attr("checked", "true");
                return false;
            }else{
                return true;
            }
		});
	});
    function fn_formSv() {

        if ( document.form2.keyword.value == ""){
            alert("검색어를 입력해주세요.");
            return false;
        }

        if (document.form2.searchNum.value == ""){
            alert("검색할 컨텐츠 수를 입력해주세요.");
            return false;
        }
        var numChk = "/^(\\-|\\+)?([0-9]+)$/";

		var cCt = document.form2.searchNum.value;

		var cCtChk = /^(\-|\+)?([0-9]+)$/.test(cCt/50)
		if ($("select[name='snsType'] option:selected").val() =='ytb'){
			if(!cCtChk){
				alert("50건 단위로 입력해주세요.");
				return false;
			}
        }
        if(cCt > 1000){
            alert("1000건 초과 조회되지 않습니다.");
            return false;
		}
        if(cCt <= 0){
            alert("1건 이상 조회 해야합니다..");
            return false;
        }

		var iTime = document.form2.time.value;
		if(iTime == ''){
            alert("0시부터 23시까지 입력가능합니다.");
            document.form2.time.focus();
            return false;
		}
		if(iTime > 23 || iTime < 0 ){
		    alert("0시부터 23시까지 입력가능합니다.");
            document.form2.time.focus();
		    return false;
		}

        if ( $("#snsType option:selected").val() == ""){
            alert("크롤링할 출처를 선택해주세요.");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/admin/reserveChk",
            data: $("form[name=form2]").serialize(),
            success: function (jdata) {
                if(jdata<1){
                    $("#loading").show();
                    $("form[name=form2]").submit();
					return true;
                }else{
                    if ($("#ChkVal").val()=='0'){
						if (confirm("해당 컨텐츠로 예약한 항목이 이미 있습니다. 등록하시겠습니까?")){

							$("#loading").show();
							$("form[name=form2]").submit();
							return false;
						}
                    }else{
                        $("#loading").show();
                        $("form[name=form2]").submit();
                        return false;
					}
                }
            },
            error: function (data) {
                alert("오류 관리자에게 문의해주세요");
            }
        });
    }

	$(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {
                $("input[name='chkSn']").prop('checked', false);
            }
        });

        var oldTitle = "${reserveInfo.keyword}";
        $("input[name='keyword']").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldTitle) {
                return;
            }

            oldTitle = currentVal;
            $("#ChkVal").val(0);
        });

	});
    function excelDownload() {
        document.form1.action='ExcelDownloadC';
        document.form1.submit();
        document.form1.action='';
    }

	function fn_list(){
        location.href='/admin/reserveForm';
	}

    function delContents(sn){
        $.ajax({
            type: "POST",
            url: "/admin/reserveUse",
            data: "sn=" + sn ,
            success: function(jdata){
                if(jdata != 'TRUE') {
                    alert("중지 오류");
                }else{
                    alert("중지 성공");
                    location.href = "/admin/reserveForm";
                }
            },
            error: function(data){alert(data);location.href = "/admin/reserveForm";}
        });
    }

    function delReserve(sn){
        $.ajax({
            type: "POST",
            url: "/admin/delReserve",
            data: "sn=" + sn ,
            success: function(jdata){
                if(jdata != 'TRUE') {
                    alert("삭제 오류");
                }else{
                    alert("삭제 성공");
                    location.href = "/admin/reserveForm";
                }
            },
            error: function(data){alert(data);location.href = "/admin/reserveForm";}
        });
    }

    function deletePost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function() {
            arr.push($(this).attr('value'));
        });
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
            return false;
        }
        else{
            $.ajax({
                type: "POST",
                url: "/admin/reserveUse",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){
                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/ytbForm";
                    }
                },
                error: function(data){alert(data);location.href = "/admin/ytbForm";}
            });
        }
    }

</script>
<div class="loader" id ="loading"></div>
<style>
	.loader {
		display:none;
		border: 16px solid #f3f3f3; /* Light grey */
		border-top: 16px solid #3498db; /* Blue */
		border-radius: 50%;
		width: 120px;
		height: 120px;
		animation: spin 2s linear infinite;
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		z-index:100
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

</style>
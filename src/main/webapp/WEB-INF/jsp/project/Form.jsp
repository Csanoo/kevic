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
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="projectSave" method="post"	enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>

												<td class="tdl" style="width: 15%">부서 </td>
												<td style="width: 35%" >
													<input type="text" class="form-control" name="department" id="department">
												</td>
												<td class="tdl" style="width: 15%">이름 </td>
												<td style="width: 35%" >
													<input type="text" class="form-control" name="hName" id="hName">
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">업체명 </td>
												<td style="width: 35%" colspan="3">
													<input type="text" class="form-control" name="corpName" id="corpName">
												</td>
											</tr>


											<tr>
												<td class="tdl" style="width: 15%">구분</td>
												<td style="width: 35%" colspan="3">
													<select name="ctType">
														<option value="10">마스</option>
														<option value="20">마스</option>
														<option value="30">마스</option>
													</select>

												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">실수요기관 </td>
												<td style="width: 35%">
													<input type="text" class="form-control" name="cAgency" id="cAgncy">
												</td>
												<td class="tdl" style="width: 15%">공사명 </td>
												<td style="width: 35%">
													<input type="text" class="form-control" name="ctName" id="ctName">
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">납품요구번호 </td>
												<td style="width: 35%">
													<input type="text" class="form-control" name="dNumber" id="dNumber">
												</td>
												<td class="tdl" style="width: 15%">지급방법 </td>
												<td style="width: 35%">
													<select name="dType">
														<option value="10">마스</option>
														<option value="20">마스</option>
														<option value="30">마스</option>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">품대계 </td>
												<td style="width: 35%">
													<input type="text" class="form-control" name="gdPrice" id="gdPrice">
												</td>
												<td colspan="2"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">남품요구</td>
												<td style="width: 35%"  colspan="1"><input name="dwDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">남품기한</td>
												<td style="width: 35%"  colspan="1"><input name="ddDate" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">검사요청</td>
												<td style="width: 35%"  colspan="1"><input name="chkDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">검수요청</td>
												<td style="width: 35%"  colspan="1"><input name="chkDate2" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">검사완료</td>
												<td style="width: 35%"  colspan="1"><input name="chkfDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">검수완료</td>
												<td style="width: 35%"  colspan="1"><input name="chkfDate2" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">검사요청</td>
												<td style="width: 35%"  colspan="1"><input name="chkDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">검수요청</td>
												<td style="width: 35%"  colspan="1"><input name="chkDate2" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">검사완료</td>
												<td style="width: 35%"  colspan="1"><input name="chkfDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">검수완료</td>
												<td style="width: 35%"  colspan="1"><input name="chkfDate2" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">변경납기</td>
												<td style="width: 35%"  colspan="1"><input name="chgPriceDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">대금청구</td>
												<td style="width: 35%"  colspan="1"><input name="" type="date"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">증권발행</td>
												<td style="width: 35%"  colspan="1"><input name="stockDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">발주요청</td>
												<td style="width: 35%"  colspan="1"><input name="reqDate" type="date"	class="form-control"></td>
											</tr>

											<tr>
												<td class="tdl" style="width: 15%">선금요청</td>
												<td style="width: 35%"  colspan="1"><input name="fmdate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">선금액</td>
												<td style="width: 35%"  colspan="1"><input name="firPrice" type="number"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">수금일</td>
												<td style="width: 35%"  colspan="1"><input name="getmDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">수금액</td>
												<td style="width: 35%"  colspan="1"><input name="reqPrice" type="number"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">정산일</td>
												<td style="width: 35%"  colspan="1"><input name="accDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">정산액</td>
												<td style="width: 35%"  colspan="1"><input name="accPrice" type="number"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">기안일</td>
												<td style="width: 35%"  colspan="1"><input name="draftDate" type="date"	class="form-control"></td>
												<td class="tdl" style="width: 15%">지급액</td>
												<td style="width: 35%"  colspan="1"><input name="payPrice" type="number"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">확인사항</td>
												<td style="width: 35%"  colspan="3"><textarea name="confirmMemo" class="form-control"></td>
											</tr>
												<tr>
												<td class="tdl" style="width: 15%">완료여부</td>
												<td style="width: 35%"  colspan="1">
													<select name="state">
														<option value="10">진행중</option>
														<option value="20">완료</option>
													</select>
													</td>
												<td class="tdl" style="width: 15%">종결여부</td>
												<td style="width: 35%"  colspan="1"><input name="finishChk" type="checkbox"	class="form-control"></td>
											</tr>
										</table>

										<div class="form-group" style="margin-top: 10px">
											<button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-gray" data-toggle="modal" data-target="#myModal" id="preview">미리보기</button>
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>
										</div>

									</div>

								</div>
							</form>
							<script>
								function fn_formSv() {
								    var frm =  document.form1;
                                    if(frm.keyword.value == ''){
                                        alert('키워드를 확인해주세요.');
                                        frm.keyword.focus();
                                        return false;
                                    }
                                    if(frm.title.value == ''){
                                        alert('타이틀 확인해주세요.');
                                        frm.title.focus();
                                        return false;을
                                    }
                                    if(frm.imageUrl.value == ''){
                                        alert('이미지URL을 확인해주세요.');
                                        frm.imageUrl.focus();
                                        return false;
                                    }
                                    if(frm.ctSource.value == ''){
                                        alert('출처를 확인해주세요.');
                                        frm.ctSource.focus();
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
        var sn = $("#project option:selected").val();
        $.get("/admin/category01?sn="+sn,function(data){
            $( "#category1" ).html( data );
            //alert( "Load was performed." );
        });
        $("#preview").on("click",function(){
			$("#preview-img").attr("src",$("input[name='imageUrl']").val());
            $("#preview-keyword").html('('+$("input[name='keyword']").val()+')');
            $("#preview-title").html($("input[name='title']").val());

        });
		$("#project").on("change",function(){
            var sn = $("#project option:selected").val();
            $( "#category2" ).html('<option value="0">카테고리</option>');
            $( "#category1" ).html('<option value="0">카테고리</option>');
            $.get("/admin/category01?sn="+sn,function(data){
                $( "#category1" ).html( data );
                //alert( "Load was performed." );
            });
		});
        $("#category1").on("change",function(){

            var sn = $("#category1 option:selected").val();
            $.get("/admin/category02?sn="+sn,function(data){
                $( "#category2" ).html( data );
                //alert( "Load was performed." );
            });
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
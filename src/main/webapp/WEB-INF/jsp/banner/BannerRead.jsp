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
					<h1 class="title">프로젝트 배너등록</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">기본 설정</h2>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="bannerUp" method="post"  enctype="multipart/form-data">
								<input type="hidden" name="sn" value="${banner1Info.sn}">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<td class="tdl" style="width: 15%">프로젝트</td>

												<td style="width: 35%">
													<select name="project">
														<option value="">프로젝트</option>
														<c:forEach var="projectview" items="${projectview}"   varStatus="status3">
															<option value="${projectview.sn}" <c:if test="${banner1Info.projectSn == projectview.sn}">selected</c:if>>${projectview.title}</option>
														</c:forEach>
													</select>
												</td>


												<td class="tdl" style="width: 15%">사용여부</td>

												<td style="width: 35%">
													<input type="radio" name="state" value="Y" <c:if test="${banner1Info.state eq 'Y'}">checked</c:if>><label>사용</label>
													<input type="radio" name="state" value="N" <c:if test="${banner1Info.state eq 'N'}">checked</c:if>><label>사용안함</label>
												</td>
											</tr>

											<tr>
												<td class="tdl" style="width: 15%">배너 타이틀</td>
												<td style="width: 35%" colspan="3"><input name="title" value="${banner1Info.title}" type="text" class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">사용기간</td>
												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="displaytype" <c:if test="${banner1Info.displayType eq 'Y'}">checked</c:if>><label>상시 노출</label>
													<input type="radio" value="N" name="displaytype" <c:if test="${banner1Info.displayType eq 'N'}">checked</c:if>><label>기간 노출</label>
													<input name="sdate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd" value="${banner1Info.sdate}">
													<input name="edate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd" value="${banner1Info.edate}">
												</td>
											</tr>
										</table>
										<div class="form-group" style="">
											<c:forEach var="listview" items="${listview}" varStatus="status">
												<div style="display:flex">
													<div>1</div>
													<div class="controls">
														<input type="checkbox" name="fileno"  value="<c:out value="${listview.fileno}"/>">
														<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
															<c:out value="${listview.filename}"/>
														</a>
														<c:out value="${listview.size2String()}"/>
														<input type="file" name="uploadfile" multiple=""/>
													</div>
													<div class="link">
														URL
														<input type="link">
														<input type="radio" name="target" value="100"><label>현재창</label>
														<input type="radio" name="target" value="200"><label>새창</label>
													</div>
													<div class="move">
														이동
													</div>
													<div class="delete">
														X
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="content-body">
											<ul class="list-unstyled">
												<li style="float: left;">
													<button type="button" class="btn btn-orange" id="addRow">항목추가</button>
												</li>
											</ul>
											<div class="row">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<table class="table" id="dTable">
														<thead>
														<colgroup>
															<col width="5%">
															<col width="10%">
															<col width="15%">
															<col width="15%">
															<col width="20%">
															<col width="15%">
															<col width="10%">
														</colgroup>
														<tr>
															<th>순서</th>
															<th>이미지</th>
															<th></th>
															<th>링크/타겟</th>
															<th>이동</th>
															<th>제외</th>
														</tr>
														</thead>
														<tbody id="bannerList">

														<c:forEach var="bannerDetaillist" items="${bannerDetaillist}" varStatus="status">
														<tr id="banner${status.index+1}" class="banner">
															<td>${status.index+1}</td>
															<td><img src="/upload/images/${bannerDetaillist.imgBanner}" width="120" height="80"></td>
															<td>
																<div class="imgChk">
																	<input type="file" name="uploadfile" multiple="" value=""/>
																	<input type="hidden" name="uploadfileOld" multiple="" value="${bannerDetaillist.imgBanner}"/>
																	<input type="hidden" class="chkFile" name="uploadfileck">
																</div>
															</td>
															<td><input type="text" name="link" value="${bannerDetaillist.link}"/>
																<div id="linkTarget${status.index}" class="target">
																<input type="radio"  name="linkTarget${status.index}" <c:if test="${bannerDetaillist.linkTarget eq '100'}">checked</c:if> value="100"/><label>현재창</label>
																<input type="radio"  name="linkTarget${status.index}" <c:if test="${bannerDetaillist.linkTarget eq '200'}">checked</c:if> value="200"/><label>부모창</label>
																<input type="hidden" name="linkTarget" value="${bannerDetaillist.linkTarget}">
																</div>
															</td>
															<td>
																<div style="width:40px">
																	이동
																	<input type="hidden" value="${listview.sn}" name="sort">
																</div>
															</td>
															<td>
																<div class="removeRow">X</div>
															</td>
														</tr>
															<c:set var="ss" value="${status.index+1}"/>
														</c:forEach>
														<c:forEach var="cnt" begin="${ss}" end="4" varStatus="status2">
															<tr id="banner${status2.index+1}" style="display:none"  class="banner">
																<td>${status2.index+1}</td>
																<td></td>
																<td>
																	<div class="imgChk">
																		<input type="file" name="uploadfile" multiple="" value="" accept="image/*"  disabled/>
																		<input type="hidden" name="uploadfileOld" multiple="" value=""  disabled/>
																		<input type="hidden" class="chkFile" name="uploadfileck" value="F"  disabled>
																	</div>
																</td>
																<td><input type="text" name="link" value="" disabled/>
																	<div id="linkTarget${status2.index}" class="target">
																		<input type="radio"  name="linkTarget${status2.index}" value="100" checked  disabled/><label>현재창</label>
																		<input type="radio"  name="linkTarget${status2.index}" value="200"  disabled/><label>부모창</label>
																		<input type="hidden" name="linkTarget" value="${banner1Info.linkTarget}"  disabled>
																	</div>
																</td>
																<td>
																	<div style="width:40px">
																		이동
																		<input type="hidden" value="" name="sort"  disabled>
																	</div>
																</td>
																<td>
																	<div class="removeRow">X</div>
																</td>
															</tr>
															</font>
														</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>

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
                                    if($("select[name='project']").val()==''){
                                        alert('프로젝트를 선택해주세요.');
                                        frm.project.focus();
                                        return false;
                                    }
                                    if(frm.title.value == ''){
                                        alert('타이틀을 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    $("input[name='uploadfile']:enabled").each(function(){
                                        var chkImg = $(this).parent().children(".chkFile").val();
                                        if($(this).val()=='' && chkImg == 'T'){
                                            alert('이미지를 등록해주세요.');
                                            frm.uploadfile.focus();
                                            return false;
                                        }
                                    });
                                    if(frm.displaytype.value=="N"){
                                        var sDate = new Date(document.form1.sdate.value);
                                        var eDate = new Date(document.form1.edate.value);
                                        if(eDate < sDate){
                                            alert("검색 시작일이 종료일보다 늦을수는 없습니다.");
                                            return false;
                                        }
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

		<form name="formList" action="BannerList" method="post">
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
</style>
<script type="text/javascript">

    $(function(){
        $(".target input[type='radio']").on("change",function(){
            if ($(this).is(':checked')) {
                $(this).parent().children("input[name='linkTarget']").val($(this).val());
            }
        });
        $(".imgChk input[type='file']").on("change",function(){
			$(this).parent().children("input[class='chkFile']").val('T');
        });

        $("#dTable").tableDnD({
            onDragClass: "dragRow"
        });
        $(document).on("click","#addRow",function(){
            $(".banner:hidden").each(function(){
                $(this).find("input").attr("disabled", false);
                $(this).show();
                return false;
            });
        });
        $(".removeRow").on("click",function(){
            $(this).parent().parent().find("input").attr("disabled", true);
            $(this).parent().parent("tr").hide();
        });

    });

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />

<section id="main-content" class=" ">
	<section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;
                padding:15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">팝업 수정페이지</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="appmain1Up" method="post"
								  enctype="multipart/form-data">

								<input name="sn" type="hidden"
									   value="${appmain1Info.sn}">



								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">


										<table id="customers">
											<tr>

												<input value="1" name="appkind" type="hidden" class="form-control">

												<td class="tdl" style="width: 15%">프로트젝트명 </td>

												<td style="width: 35%">
													<select name="project">
														<option value="001" >
															프로젝트01
														</option>
														<option value="002">
															프로젝트02
														</option>
														<option value="003">
															프로젝트03
														</option>
													</select>
												</td>

												<td class="tdl" style="width: 15%">사용 여부</td>

												<td style="width: 35%">
													<input type="radio" value="100" name="state" <c:if test="${appmain1Info.state eq '100'}">checked</c:if>><label>사용</label>
													<input type="radio" value="000" name="state" <c:if test="${appmain1Info.state eq '000'}">checked</c:if>><label>사용안함</label>
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 타이틀</td>

												<td style="width: 35%" colspan="3"><input name="title" type="text" value="${appmain1Info.title}" class="form-control"></td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 기간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="displaytype" <c:if test="${appmain1Info.displaytype eq 'Y'}">checked</c:if>><label>상시 노출</label>
													<input type="radio" value="N" name="displaytype" <c:if test="${appmain1Info.displaytype eq 'N'}">checked</c:if>><label>기간 노출</label>
													<input name="sdate" type="text" class="form-control datepicker" value="${appmain1Info.sdate}" data-format="yyyy-mm-dd">
													<input name="edate" type="text" class="form-control datepicker" value="${appmain1Info.edate}" data-format="yyyy-mm-dd">
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 시간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="dtimetype" <c:if test="${appmain1Info.dtimetype eq 'Y'}">checked</c:if>><label>상시 노출</label>
													<input type="radio" value="N" name="dtimetype" <c:if test="${appmain1Info.dtimetype eq 'N'}">checked</c:if>><label>기간 노출</label>
														<input name="stime" type="text" class="form-control" value="${appmain1Info.stime}" placeholder="24:00:00" >
														<input name="etime" type="text" class="form-control" value="${appmain1Info.etime}" placeholder="01:00:00">

												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 위치</td>

												<td style="width: 35%" colspan="3">상단<input name="positionY" type="text" class="form-control" value="${appmain1Info.positionY}">
													좌측<input name="positionX" type="text" class="form-control" value="${appmain1Info.positionX}">
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 크기</td>

												<td style="width: 35%" colspan="3">
													가로(pixel)<input name="sWidth" type="text" class="form-control" value="${appmain1Info.sWidth}">
													세로(pixel)<input name="sHeight" type="text" class="form-control" value="${appmain1Info.sHeight}">
												</td>

											</tr>
											<tr>
												<td class="tdl" style="width: 15%">팝업 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="100" name="closeType" <c:if test="${appmain1Info.closeType eq '100'}">checked</c:if>><label>오늘 이창을 열지 않음</label>
													<input type="radio" value="200" name="closeType" <c:if test="${appmain1Info.closeType eq '200'}">checked</c:if>><label>이 창을 7일간 열지 않음</label>
													<input type="radio" value="300" name="closeType" <c:if test="${appmain1Info.closeType eq '300'}">checked</c:if>><label>이 창을 다시 열지 않음</label>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">상세 디자인</td>

												<td style="width: 35%" colspan="3">
													<textarea name="umemo" id="umemo"></textarea>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">링크설정 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="200" name="linkState" <c:if test="${appmain1Info.linkState eq '200'}">checked</c:if>><label>사용안함</label>
													<input type="radio" value="100" name="linkState" <c:if test="${appmain1Info.linkState eq '100'}">checked</c:if>><label>사용</label>
													<select name="linkTarget">
														<option value="100" <c:if test="${appmain1Info.linkState eq '100'}">selected</c:if>>부모창</option>
														<option value="200" <c:if test="${appmain1Info.linkState eq '200'}">selected</c:if>>새창열기</option>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">URL</td>

												<td style="width: 35%" colspan="3">
													<input type="text" value="${appmain1Info.link}" name="link" >
												</td>
											</tr>
										</table>

										<br>
										<div class="form-group" style="margin-top: 10px">

											<button type="button" class="btn btn-gray"
													onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange"
													onclick="fn_formSv()">저장</button>
											<button type="button" class="btn btn-purple"
													onclick="fn_formDel()">삭제</button>

										</div>

									</div>

								</div>
							</form>
							<script type="text/javascript" src="/admin/design/assets/plugins/smart/js/HuskyEZCreator.js" charset="utf-8"></script>
							<script type="text/javascript">
                                nhn.husky.EZCreator.createInIFrame({
                                    oAppRef: umemo,
                                    elPlaceHolder: "umemo",
                                    sSkinURI: "/admin/design/assets/plugins/smart/SmartEditor2Skin.html",
                                    htParams: {
                                        bUseToolbar: true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                                        bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                                        bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                                        //aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
                                        fOnBeforeUnload: function () {
                                            //alert("완료!");
                                        }
                                    }, //boolean
                                    fOnAppLoad: function () {
                                        //예제 코드
                                        umemo.getById["umemo"].exec("PASTE_HTML", ["${appmain1Info.umemo}"]);
                                    },
                                    fCreator: "createSEditor"
                                });
							</script>
							<script>

                                function fn_formSv() {
                                    umemo.getById["umemo"].exec("UPDATE_CONTENTS_FIELD", []);
                                    document.form1.submit();

                                }
                                function fn_formRtn() {
                                    document.formList.submit();

                                }
                                function fn_formDel() {
                                    document.form1.action="appmain1Delete";
                                    document.form1.submit();

                                }

							</script>

						</div>
					</div>
				</div>
			</section>
		</div>

		<form name="formList" action="AppMain1" method="post">
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
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
                                <h1 class="title">Contents Save</h1>                            
                            </div>


                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Contents Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="ContentsSave" method="post"
								enctype="multipart/form-data">
								
								<input name="sn" type="hidden"
													value="${banner1Info.sn}">



								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">


										<table id="customers">
											<tr>


												<td class="tdl" style="width: 15%">코드</td>

												<td style="width: 35%">
												<select name="code2" class="form-control">
														<option value="YTB" <c:if test="${banner1Info.code2 eq 'YTB'}">selected</c:if>>YTB : 유튜브 링크</option>
														<option value="VOD" <c:if test="${banner1Info.code2 eq 'fb'}">selected</c:if>>fb : 페이스북</option>
														<option value="CDN" <c:if test="${banner1Info.code2 eq 'INS'}">selected</c:if>>INS : 인스타그램</option>
														<option value="VJS" <c:if test="${banner1Info.code2 eq 'TWT'}">selected</c:if>>TWT : 트위터</option>
												</select>
												
												</td>



												<td class="tdl" style="width: 15%">타이틀</td>

												<td style="width: 35%"><input name="title" type="text"
													value="${banner1Info.title}" class="form-control"></td>
											</tr>

											<tr>


												<td class="tdl" style="width: 15%">Creator</td>

												<td style="width: 35%"><input name="userid" type="text"
													value="${banner1Info.userid}" class="form-control"></td>



												<td class="tdl" style="width: 15%">글내용</td>

												<td style="width: 35%"><textarea name="memo" type="text" class="form-control">${banner1Info.memo}</textarea>
												</td>
											</tr>
											
											<tr>


												<td class="tdl" style="width: 15%">URL</td>

												<td style="width: 35%"><input name="url" type="text"
													value="${banner1Info.url}" class="form-control"></td>



												<td class="tdl" style="width: 15%">카테고리</td>

												<td style="width: 35%">
												<select name="category" class="form-control">
												
<option value="EVT" <c:if test="${banner1Info.category eq 'EVT'}">selected</c:if>>Event</option>
<option value="FAS" <c:if test="${banner1Info.category eq 'FAS'}">selected</c:if>>Fashion</option>
<option value="FOO" <c:if test="${banner1Info.category eq 'FOO'}">selected</c:if>>Foods</option>
<option value="BET" <c:if test="${banner1Info.category eq 'BET'}">selected</c:if>>Beauty</option>
<option value="CLF" <c:if test="${banner1Info.category eq 'CLF'}">selected</c:if>>Culture Life</option>
<option value="TVL" <c:if test="${banner1Info.category eq 'TVL'}">selected</c:if>>Travel</option>


												</select></td>
											</tr>
											
										</table>



										<div class="form-group" style="display:block">
											<label class="form-label" for="field-1">첨부파일</label>
											<div class="controls">
												<c:forEach var="listview" items="${listview}"
													varStatus="status">
													<input type="checkbox" name="fileno"
														value="<c:out value="${listview.fileno}"/>">
													<a
														href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
														<c:out value="${listview.filename}" />
													</a>
													<c:out value="${listview.size2String()}" />
													<br />
												</c:forEach>


												<input type="file" name="uploadfile" multiple="" />
											</div>
										</div>

										<div class="form-group" style="margin-top: 10px">

											<button type="button" class="btn btn-gray"
												onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange"
												onclick="fn_formSv()">저장</button>
												
												
										</div>

									</div>

								</div>
							</form>
							<script>
								function fn_formSv() {
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

	<form name="formList" action="ContentsList" method="post">
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
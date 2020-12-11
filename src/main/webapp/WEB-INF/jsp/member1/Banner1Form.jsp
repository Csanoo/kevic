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

									<form name="form1" action="banner1Save" method="post"
										enctype="multipart/form-data">



										<div class="row">
											<div class="col-md-12 col-sm-12 col-xs-12">


												<table id="customers">
													<tr>


														<td class="tdl" style="width: 15%">프로젝트</td>

														<td style="width: 35%">
															<select >
																<option>프로젝트</option>
																<option value="01">프로젝트01</option>
																<option value="02">프로젝트02</option>
															</select>
														</td>



														<td class="tdl" style="width: 15%">사용여부</td>

														<td style="width: 35%">
															<input type="radio" name="state" value="100"><label>사용</label>
															<input type="radio" name="state" value="200"><label>사용안함</label>
														</td>
													</tr>

													<tr>
														<td class="tdl" style="width: 15%">배너 타이틀</td>
														<td style="width: 35%"><input name="title" type="text"	class="form-control"></td>
														<td class="tdl" style="width: 15%">문구</td>
														<td style="width: 35%"><input name="title" type="comment"	class="form-control"></td>
													</tr>
												</table>



												<div class="form-group" style="">
													<c:forEach var="listview" items="${listview}" varStatus="status">
													<div style="display:flex">
														<div>1</div>
														<div class="controls">

																<input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">
																<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
																	<c:out value="${listview.filename}" />
																</a>
																<c:out value="${listview.size2String()}" />

															<input type="file" name="uploadfile" multiple="" />
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
	<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
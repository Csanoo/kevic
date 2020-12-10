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
					<h2 class="title pull-left">컨텐츠 직접등록</h2>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="projectSave" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<input value="1" name="appkind" type="hidden" class="form-control">
												<td class="tdl" style="width: 15%">프로트젝트명 </td>
												<td style="width: 35%">
													<select name="project"  class="form-control">
														<option>프로젝트</option>
														<option value="001">프로젝트01</option>
														<option value="002">프로젝트02</option>
													</select>

												</td>
												<td class="tdl" style="width: 15%">전시 카테고리</td>
												<td style="width: 35%">
													<select name="category"  class="form-control" >
														<c:forEach var="cateview" items="${cateview}"   varStatus="status">
															<option value="${cateview.code2}" <c:if test="${contentsInfo.category eq cateview.code2}">selected</c:if>>${cateview.title}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">출처 이미지 URL</td>

												<td style="width: 35%"><input name="imageUrl" type="text"  class="form-control"></td>

												<td class="tdl" style="width: 15%">영상 URL</td>

												<td style="width: 35%"><input name="videoUrl" type="text"  class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">출처</td>

												<td style="width: 35%">
													<select name="ctSource"  class="form-control" >
														<c:forEach var="sourceview" items="${sourceview}"   varStatus="status">
															<option value="${sourceview.code2}" <c:if test="${contentsInfo.ctSource eq sourceview.code2}">selected</c:if>>${sourceview.title}</option>
														</c:forEach>
													</select>
												</td>
												<td class="tdl" style="width: 15%">타이틀</td>
												<td style="width: 35%"><input name="title" type="text"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">사용 기간</td>
												<td style="width: 75%" colspan="3">
													<input name="startDate" type="text"	value="${searchVO.startDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block"> ~
													<input name="endDate" type="text"	value="${searchVO.endDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block">
												</td>
											</tr>
										</table>

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
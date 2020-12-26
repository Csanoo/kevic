<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">
		<input type="hidden" name="sn"
		id="sn" value="" /> 
		<input type="hidden" name="srch" id="srch"
		value="SRCH" />

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">권한/등급 관리</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<table id="customers">
								<tr>
									<td class="tdl" style="width: 25%">등급</td>
									<td style="width: 25%">${searchVo.state}
										<select name="code2">
											<option value="">전체</option>
											<c:forEach var="listsel" items="${listsel}"   varStatus="status">

												<option value='${listsel.code2}' <c:if test="${searchVO.code2 == listsel.code2}">selected</c:if>>${listsel.title}</option>

											</c:forEach>

										</select>
									</td>
									<td class="tdl" style="width: 25%">사용여부</td>
									<td style="width: 25%">
										<input type="radio" name="state" id="state" value="" <c:if test="${searchVO.state ==''}">checked</c:if>><label for="state">전체</label>
										<input type="radio" name="state" id="state1" value="Y" <c:if test="${searchVO.state =='Y'}">checked</c:if>><label for="state1">사용</label>
										<input type="radio" name="state" id="state2" value="N" <c:if test="${searchVO.state =='N'}">checked</c:if>><label for="state2">사용안함</label>
									</td>
								</tr>
								<tr>
									<td class="tdl" style="width: 25%">검색어</td>
									<td style="width: 75%" colspan="3">
										<select name="searchType" class="form-control">
											<option value="">선택</option>
											<option value="regid" <c:if test="${searchVO.searchType =='regid'}">selected</c:if>>등록자</option>
											<option value="memo" <c:if test="${searchVO.searchType =='memo'}">selected</c:if>>설명</option>
										</select>
										<input name="searchKeyword" type="text"	value="${searchVO.searchKeyword}" class="form-control">
									</td>
								</tr>
							</table>
							<div class="form-group" style="margin-top: 20px;float:right">
								<button type="button" class="btn btn-gray" onclick="fn_scInit()">초기화</button>
								<button type="button" class="btn btn-orange" onclick="fn_formSubmit()">검색</button>
							</div>
						</div>
					</div>



					<header class="panel_header">
						<h2 class="title pull-left"> <div style="font-size:14px">총 ${searchVO.totRow}건</div> </h2>
						<div class="pull-right" style="padding-top: 10px">
							<ul class="list-unstyled">

								<li style="float: left;">
									<select name="orderKeyword" id="orderKeyword"  >
										<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">등록일 내림차순</option>
										<option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">등록일 오름차순</option>
									</select>
									<select name="pageNo" id="pageNo"  >
										<option <c:if test="${searchVO.pageNo eq '20'}">selected</c:if> value="20">20개</option>
										<option <c:if test="${searchVO.pageNo eq '50'}">selected</c:if> value="50">50개</option>
										<option <c:if test="${searchVO.pageNo eq '100'}">selected</c:if> value="100">100개</option>
										<option <c:if test="${searchVO.pageNo eq '200'}">selected</c:if> value="200">200개</option>
										<option <c:if test="${searchVO.pageNo eq '300'}">selected</c:if> value="300">300개</option>
										<option <c:if test="${searchVO.pageNo eq '500'}">selected</c:if> value="500">500개</option>
									</select>
								</li>
							</ul>
						</div>
					</header>


					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table class="table">
									<thead>
										<tr>
											<th style="width:5%">No</th>
											<th style="width:10%">등급</th>
											<th style='width: *'>설명</th>
											<th style="width:10%">사용여부</th>
											<th style="width:10%">등록자</th>
											<th style="width:20%">등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="listGrade" items="${listGrade}"	varStatus="status">
											<tr>
												<td><c:out
														value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
												</td>
												<td><a href="javascript:fn_readGo('${listGrade.sn}')">${listGrade.title}</a></td>
												<td><c:out value="${listGrade.memo}" /></td>
												<td><c:if test="${listGrade.state eq 'Y'}">사용</c:if><c:if test="${listGrade.state eq 'N'}">사용안함</c:if></td>
												<td><c:out value="${listGrade.regid}" /></td>
												<td><c:out value="${listGrade.regdate}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="form-group" style="margin-top: 20px;float:right">
									<button type="button" class="btn btn-orange" onclick="fn_formGo()">권한/등급 등록</button>
								</div>
							</div>



							<div class="col-md-12 col-sm-12 col-xs-12"
								style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
								<jsp:include page="/WEB-INF/jsp/common/Paging.jsp" />
							</div>
						</div>
					</div>


				</section>

			</div>
		</section>
	</section>


</form>
<script>
	function fn_formSubmit() {
		document.form1.submit();
	}
	function fn_orderKey(_a) {
		document.form1.orderKeyword.value = _a;
		document.form1.submit();
	}
	function fn_formGo() {
			location.href = "userTypeForm";
	}

	function fn_readGo(_a) {
		document.form1.sn.value = _a;
		document.form1.action = "usertypeRead";
		document.form1.submit();
	}


</script>


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript">

    $(function() {
        $("#orderKeyword").on("change", function () {
            document.form1.submit();
        });
        $("#pageNo").on("change", function () {
            document.form1.submit();
        });

    });
</script>
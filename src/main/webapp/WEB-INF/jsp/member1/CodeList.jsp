<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">
	<input type="hidden" name="orderKeyword" id="orderKeyword"
		value="${searchVO.orderKeyword}" /> 
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
					<h1 class="title">Code List</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">




					<header class="panel_header">
						<h2 class="title pull-left">Code </h2>
						<div class="pull-right" style="padding-top: 10px">
							<ul class="list-unstyled">
								<li style="float: left;"><input type="checkbox"
									id="searchType"
									name="searchType" value="code1"
									<c:if test="${fn:indexOf(searchVO.searchType, 'code1')!= -1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType1">코드1</label>&nbsp;&nbsp;

									<input type="checkbox" name="searchType" value="code2"
									<c:if test="${fn:indexOf(searchVO.searchType, 'code2')!=-1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType2">코드2</label>&nbsp;&nbsp;
								</li>
								<li style="float: left;"><input type="text"
									style="width: 150px; height: 28px" 
									id = "searchKeyword"
									name="searchKeyword"
									value='<c:out value="${searchVO.searchKeyword}"/>'
									onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
								</li>
								<li style="float: left;">&nbsp;&nbsp;
									<button type="button" class="btn btn-primary "
										onclick="fn_formSubmit()">검색</button> 
									<button type="button" class="btn btn-orange" onclick="fn_formGo()">신규</button>
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
											<th style="width:5%">#</th>
											<th style="width:10%">분류</th>
											<th style='width: 20%'>명칭 [ <a
												href="javascript:fn_orderKey('1')">▲</a> <a
												href="javascript:fn_orderKey('2')">▼</a> ]
											</th>



											<th style="width:10%">코드</th>

											<th style="width:*">메모</th>
											



										</tr>
									</thead>
									<tbody>
										<c:forEach var="listview" items="${listview}"
											varStatus="status">


											<tr>
												<td><c:out
														value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
												</td>
												<td><c:out value="${listview.code1}" /></td>

			<td><a href="javascript:fn_readGo('${listview.sn}')">${listview.title}</a></td>


												<td><c:out value="${listview.code2}" /></td>
												<td><c:out value="${listview.memo}" /></td>
												






											</tr>
										</c:forEach>
									</tbody>
								</table>

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
</script>

<script>
	function fn_orderKey(_a) {
		document.form1.orderKeyword.value = _a;
		document.form1.submit();
	}
</script>

<script>
	function fn_formGo() {
		if ( document.getElementById("searchType").value != '' && 
				document.getElementById("searchKeyword").value != '' ) {
			location.href = "codeForm?code1=" + document.getElementById("searchKeyword").value;
		}else{
			location.href = "codeForm";
		}
	}
</script>

<script>
	function fn_readGo(_a) {
		document.form1.sn.value = _a;
		document.form1.action = "codeRead";
		document.form1.submit();
	}
</script>


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />

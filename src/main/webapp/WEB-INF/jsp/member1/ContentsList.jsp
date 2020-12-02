<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function secconvert(seconds) {

var hour = parseInt(seconds/3600);
var min = parseInt((seconds%3600)/60);
var sec = seconds%60;

return hour + "시간 " + min + "분 ";

}
</script>


<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="formBoard" name="formBoard" method="post" action="/admin/ContentsList">
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
					<h1 class="title">Contents List</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">




					<header class="panel_header">
						<h2 class="title pull-left">콘텐츠 </h2>
						<div class="pull-right" style="padding-top: 10px">
							<ul class="list-unstyled">
								<li style="float: left;"><input type="checkbox"
									name="searchType" value="title"
									<c:if test="${fn:indexOf(searchVO.searchType, 'title')!= -1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType1">이름</label>&nbsp;&nbsp;

									<input type="checkbox" name="searchType" value="code2"
									<c:if test="${fn:indexOf(searchVO.searchType, 'code2')!=-1}">checked="checked"</c:if> />
									<label class="chkselect" for="searchType2">분류</label>&nbsp;&nbsp;
								</li>
								<li style="float: left;"><input type="text"
									style="width: 150px; height: 28px" name="searchKeyword"
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
										<th style="width:5%"><input type="checkbox" id="allChk"></th>
										<th style="width:5%">No</th>
										<th style="width:10%">분류</th>
										<th style="width:8%">썸네일</th>
										<th style="width:8%;max-width:200px">링크</th>
										<th style="width:8%">출처</th>
										<th>제목</th>
										<th style="width:10%">등록일</th>
										<th style="width:10%">관리</th>
									</tr>
									</thead>
									<tbody>
									<% int ii=0; %>

									<c:forEach var="listview" items="${listview}"   varStatus="status"><% ii++; %>
										<tr>
											<td><input type="checkbox" name="chkId" value="${listview.sn}"></td>
											<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
											<td>${listview.category}</td>
											<td>
												<c:if test="${fn:indexOf(listview.imgfile, 'https://i.ytimg.com/')!= -1}">
													<img src="${listview.imgfile}" width="150">
												</c:if>
												<c:if test="${fn:indexOf(listview.imgfile, 'https://i.ytimg.com/') == -1}">
													<img src="${listview.imgfile}" width="150">
												</c:if>
											</td>
											<td style="width:8%;max-width:200px;overflow:hidden;text-overflow:ellipsis;">${listview.url}</td>
											<td>
												<c:choose>
													<c:when test="${listview.code2 eq 'YTB'}">
														유튜브
													</c:when>
													<c:when test="${listview.code2 eq 'fb'}">
														페이스
													</c:when>
													<c:when test="${listview.code2 eq 'INS'}">
														인스타
													</c:when>
													<c:when test="${listview.code2 eq 'TWT'}">
														트위터
													</c:when>
													<c:otherwise>
														불명
													</c:otherwise>
												</c:choose>
											</td>
											<td><a href="${listview.url}">${listview.title}</a></td>
											<td>${listview.regdate}</td>
											<td>
												<button type="button" class="btn btn-orange" onclick="window.location.href='/admin/ContentsDelete?sn=${listview.sn}'">삭제</button>
											</td>
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
		location.href = "/admin/ContentsForm";
	}
</script>

<script>
	function fn_readGo(_a) {
		document.form1.sn.value = _a;
		document.form1.action = "ContentsRead";
		document.form1.submit();
	}
</script>



<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />

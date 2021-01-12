<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">
	<input type="hidden" name="orderKeyword" id="orderKeyword" value="${searchVO.orderKeyword}" />
		<input type="hidden" name="userid" id="userid" value="" /> 
		<input type="hidden" name="srch" id="srch" value="SRCH" />

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">관리자 계정 관리</h1>
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
									<td style="width: 25%">
										<select name="usertype">
											<option value="">전체</option>
											<c:forEach var="listsel" items="${listsel}"   varStatus="status">

												<option value='${listsel.code2}' <c:if test="${searchVO.usertype eq listsel.code2}">selected</c:if>>${listsel.title}</option>

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
											<option value="tuser.userid" <c:if test="${searchVO.searchType =='tuser.userid'}">selected</c:if>>아이디</option>
											<option value="email" <c:if test="${searchVO.searchType =='email'}">selected</c:if>>이메일</option>
											<option value="username" <c:if test="${searchVO.searchType =='username'}">selected</c:if>>이름</option>
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
						<h2 class="title pull-left">회원목록 </h2>
					</header>

					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>등급</th>
											<th>사용 여부</th>
											<th>아이디</th>
											<th style='width: 10%'>이름</th>
											<th>운영프로젝트</th>
											<th>마지막 로그인</th>
											<th>수정일자</th>
											<th>수정자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="listview" items="${listview}" varStatus="status">
											<tr>
												<td>
													<c:out	value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
												</td>
												<td>${listview.usertype}</td>
												<td><c:if test="${listview.state eq 'Y'}">사용</c:if><c:if test="${listview.state eq 'N'}">사용안함</c:if></td>
												<td><c:out value="${listview.userid}" /></td>
												<td><a href="javascript:fn_readGo('${listview.userid}')">${listview.username}</a></td>
												<td>${listview.projectct}</td>
												<td data-toggle="modal" data-target="#myModal" onclick="fn_history('${listview.userid}');"><a>${listview.mxwdt}</a></td>
												<td><c:out value="${listview.uptDate}" /></td>
												<td><c:out value="${listview.uptuser}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
</form>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12"	style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
								<jsp:include page="/WEB-INF/jsp/common/Paging.jsp" />
							</div>
						</div>
					</div>


				</section>

			</div>
		</section>
	</section>




<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script>
    function fn_formSubmit() {
        document.form1.submit();
    }
    function fn_orderKey(_a) {
        document.form1.orderKeyword.value = _a;
        document.form1.submit();
    }

    function fn_formGo() {
        location.href = "/mdvs/member1Form";
    }

    function fn_readGo(_a) {
        document.form1.userid.value = _a;
        document.form1.action = "member1Read";
        document.form1.submit();
    }


    function fn_history(userid, page) {

        if(page =='' || page == undefined){
            page = 1;
		}
        var ppage = page;
        $.get("/admin/loginList?userid="+userid+"&page="+ppage , function(data){
            $( "#loginlist" ).html( data );
        });
    }

</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width:320px">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">로그인 기록</h4>
			</div>
			<div class="modal-body" id="loginlist">


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

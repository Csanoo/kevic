<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />


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
        location.href = "/admin/appmain1Form";
    }
</script>

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>
			<div class="content-body">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form name="searchFrm" method="post">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="customers">
										<tr>
											<td class="tdl" style="width: 25%">프로젝트</td>
											<td style="width: 75%">
												<select name="sproject">
													<option value="">프로젝트</option>
													<c:forEach var="projectview" items="${projectview}"   varStatus="status">
														<option value="${projectview.sn}" <c:if test="${searchVO.sproject eq projectview.sn}">selected</c:if>>${projectview.title}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="tdl" style="width: 25%">타이틀</td>
											<td style="width: 75%">
												<input name="stitle" type="text"	value="${searchVO.stitle}" class="form-control">
											</td>
										</tr>
										<tr>
											<td class="tdl" style="width: 25%">등록</td>
											<td style="width: 75%">
												<div class="input-group js-datepicker">
													<input type="text" class="form-control datepicker" name="startDate" value="${searchVO.startDate}" data-format="yyyy-mm-dd">
													<span class="input-group-addon"><span class="btn-icon-calendar"></span></span>
												</div>
												<div class="input-group js-datepicker">
													<input type="text" class="form-control datepicker" name="endDate" value="${searchVO.endDate}" data-format="yyyy-mm-dd">
													<span class="input-group-addon"><span class="btn-icon-calendar"></span></span>
												</div>
												<!--
												<input name="searchDate[]" type="text"	value="" class="form-control datepicker" data-format="yyyy-mm-dd"> ~
												<input name="searchDate[]" type="text"	value="" class="form-control datepicker" data-format="yyyy-mm-dd">

												<div class="btn-group js-dateperiod" data-toggle="buttons" data-target-name="searchDate">
													<label class="btn btn-white btn-sm hand">
														<input type="radio" name="searchPeriod" value="0">오늘
													</label>
													<label class="btn btn-white btn-sm hand">
														<input type="radio" name="searchPeriod" value="6">7일
													</label>
													<label class="btn btn-white btn-sm hand">
														<input type="radio" name="searchPeriod" value="14">15일
													</label>
													<label class="btn btn-white btn-sm hand">
														<input type="radio" name="searchPeriod" value="29">1개월
													</label>
													<label class="btn btn-white btn-sm hand">
														<input type="radio" name="searchPeriod" value="89">3개월
													</label>
													<label class="btn btn-white btn-sm hand  active">
														<input type="radio" name="searchPeriod" value="364">1년
													</label>
												</div>
												-->
											</td>
										</tr>
									</table>
									<div class="form-group" style="margin-top: 20px">
										<button type="button" class="btn btn-orange" onclick="fn_formSv()">검색</button>
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">팝업내용 목록</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>
			<form id="form1" name="form1" method="post">

				<input type="hidden" name="sn" id="sn" value="" />

				<div class="col-lg-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">목록 </h2>
							<div class="pull-right" style="padding-top: 10px">
								<ul class="list-unstyled">
									<li style="float: left;">
										<button type="button" class="btn btn-orange" onclick="deletePost()">선택삭제</button>
									</li>
									<li style="float: left;">
										<select name="orderKeyword" id="orderKeyword"  >
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">시작일 내림차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="2">시작일 오름차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="3">수정일 내림차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="4">수정일 오름차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="5">등록일 내림차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="6">등록일 오름차순</option>
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
										<th><input type="checkbox" id="allChk" ></th>
										<th>No</th>
										<th>프로젝트</th>
										<th>팝업제목</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>등록일</th>
										<th>관리</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach var="listview" items="${listview}" varStatus="status">
										<tr>
											<td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
											<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
											<td>${listview.project}</td>
											<td>${listview.title}</td>
											<td>${listview.sdate}</td><td>${listview.edate}</td>
											<td>${listview.regDate}</td>
											<td>
												<button type="button" class="btn btn-gray" onclick="fn_readGo(${listview.sn})">수정</button>
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


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />

<script>

    $(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });
    });

    function fn_readGo(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "appmain1Read";
        document.form1.submit();
    }

    function deletePost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function() {
            arr.push($(this).attr('value'));
        });
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
        }
        else{
            $.ajax({
                type: "POST",
                url: "/admin/popChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){
                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/AppMain1";
                    }
                },
                error: function(data){location.href = "/admin/AppMain1";}
            });
        }
    }

    function fn_formSv() {

        var frm = document.searchFrm;

        if ( frm.title.value == ""){
            alert("검색어를 입력해주세요.");
            frm.title.focus();
            return false;
        }
        frm.submit();
    }
</script>
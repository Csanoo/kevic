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
                                <h1 class="title">Crawler</h1>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Data Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="ytbPost" method="post"
								enctype="multipart/form-data">

								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<td class="tdl" style="width: 25%">검색어</td>
												<td style="width: 75%"><input name="title" type="text"	value="" class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">컨텐츠 타입</td>
												<td style="width: 75%"><input name="kind" type="text"	value="" class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">카테고리</td>
												<td style="width: 75%">
												<select name="kind"  class="form-control" >
													<c:forEach var="cateview" items="${cateview}"   varStatus="status">
													<option value="${cateview.code2}" <c:if test="${banner1Info.category eq cateview.code2}">selected</c:if>>${cateview.title}</option>
													</c:forEach>

												</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">SNS</td>
												<td style="width: 75%">
													<select name="snsType" class="form-control" >
														<option>크롤링할 SNS를 선택해주세요.</option>
														<option value="ytb">유튜브</option>
														<option value="insta">인스타</option>
														<option value="fb">페이스북</option>
														<option value="twi">트위터</option>
													</select>
												</td>
											</tr>
										</table>
										<div class="form-group" style="margin-top: 20px">
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">크롤링 시작</button>
										</div>
									</div>
								</div>
							</form>
							<script>
								function fn_formSv() {
									
									if ( document.form1.title.value == ""){
                                        alert("검색어를 입력해주세요.");
								//	}
								//	if ( document.form1.kind.value == "" ){
										//alert("분류값을 입력해주세요");
									}else{
                                        $("#loading").show();
									    document.form1.submit();
									}

								}

							</script>

						</div>
					</div>
				</div>
			</section>
		</div>

					<form id="formBoard" name="formBoard" method="post" action="/admin/ytbForm">
						<input type="hidden" name="orderKeyword" id="orderKeyword" value="${searchVO.orderKeyword}" />
						<input type="hidden" name="sn" id="sn" value="" />
						<input type="hidden" name="srch" id="srch" value="SRCH" />
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


											<li style="float: left;">
												<!--<button type="button" class="btn btn-primary " onclick="fn_formSubmit()">기본컨텐츠 등록</button>-->
												<button type="button" class="btn btn-orange" onclick="fn_write();">컨텐츠 등록</button>
											</li>
											<!--
											<li style="float: left;"><input type="checkbox" name="searchType" value="title" <c:if test="${fn:indexOf(searchVO.searchType, 'title')!= -1}">checked="checked"</c:if> />
												<label class="chkselect" for="searchType1">이름</label>&nbsp;&nbsp;
													<input type="checkbox" name="searchType" value="code2" <c:if test="${fn:indexOf(searchVO.searchType, 'code2')!=-1}">checked="checked"</c:if> />
												<label class="chkselect" for="searchType2">분류</label>&nbsp;&nbsp;
											</li>
											<li style="float: left;">
												<input type="text" style="width: 150px; height: 28px" name="searchKeyword"	value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
											</li>
											<li style="float: left;">&nbsp;&nbsp;
												<button type="button" class="btn btn-primary " onclick="fn_formSubmit()">검색</button>

											</li>
												-->
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
														<td>
															<c:if test="${listview.code2 != 'YTB'}">
															<a href="${listview.url}">${listview.title}</a>
															</c:if>
															<c:if test="${listview.code2 eq 'YTB'}">
																<a href="https://www.youtube.com/watch?v=${listview.url}">${listview.title}</a>
															</c:if>
														</td>
														<td>${listview.regdate}</td>
														<td>
															<button type="button" class="btn btn-orange" onclick="window.location.href='/admin/postDelete?sn=${listview.sn}'">삭제</button>
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
					</form>
				</section>
			</section>
		<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript">

	$(function(){
	    $("#allChk").on("click",function(){

	        $("input[name=chkId]").each(function(){
	            if(this.checked){
	                this.checked=false;
				}else{
                    this.checked=true;
				}
			});
		});
	});
	function fn_write(){
        location.href = "/admin/ContentsForm";
	}
</script>

<div class="loader" id ="loading"></div>
<style>
	.loader {
		display:none;
		border: 16px solid #f3f3f3; /* Light grey */
		border-top: 16px solid #3498db; /* Blue */
		border-radius: 50%;
		width: 120px;
		height: 120px;
		animation: spin 2s linear infinite;
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		z-index:100
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

</style>
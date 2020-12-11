<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">

<input type="hidden" name="sn" id="sn" value="" />
	<section id="main-content" class=" ">
		<section class="wrapper" style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">
				<div class="pull-left">
					<h1 class="title">Banner List</h1>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">
					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">

								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<td class="tdl" style="width: 25%">프로젝트</td>
												<td style="width: 25%">
													<select name="sproject">
														<option value="">프로젝트</option>
														<option <c:if test="${searchVO.sproject eq '001'}">selected</c:if> value="01">프로젝트01</option>
														<option <c:if test="${searchVO.sproject eq '002'}">selected</c:if> value="02">프로젝트02</option>
													</select>
												</td>
												<td class="tdl" style="width: 25%">사용 여부</td>
												<td style="width: 25%">
													<input type="radio" name="state" value=""><label>전체</label>
													<input type="radio" name="state" value="100"><label>사용</label>
													<input type="radio" name="state" value="200"><label>사용안함</label>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">배너 타이틀</td>
												<td style="width: 75%" colspan="3">
													<input name="searchTitle" type="text"	value="${searchVO.searchTitle}" class="form-control">
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">검색 기간</td>
												<td style="width: 75%" colspan="3">
													<input name="startDate" type="text"	value="${searchVO.startDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block"> ~
													<input name="endDate" type="text"	value="${searchVO.endDate}" class="form-control datepicker" data-format="yyyy-mm-dd" style="width:100px;display:inline-block">
												</td>
											</tr>
										</table>
										<div class="form-group" style="margin-top: 20px;float:right">
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">검색</button>
										</div>
									</div>
								</div>
								<script>
                                    function fn_formSv() {
                                        $("#loading").show();
                                        document.form1.submit();
                                    }
								</script>

							</div>
						</div>
					</div>

					<div class="content-body">
						<header class="panel_header">
							<h2 class="title pull-left">목록 </h2>
							<div class="pull-right" style="padding-top: 10px">
								<ul class="list-unstyled">
									<li style="float: left;">
										<button type="button" class="btn btn-gray" onclick="deletePost()">선택 삭제</button>
									</li>
									<li style="float: left;">
										<select name="orderKeyword" id="orderKeyword"  >
											<option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">타이틀 내림차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">타이틀 오름차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">키워드 내림차순</option>
											<option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">키워드 오름차순</option>
										</select>
									</li>
								</ul>
							</div>
						</header>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<table class="table">
									<thead>
										<tr>
											<th><input type="checkbox" id="allChk" ></th>
											<th>No</th>
											<th>사용여부</th>
											<th>프로젝트명</th>
											<th>이미지</th>
											<th>배너타이틀</th>
											<th>시작</th>
											<th>종료일</th>
											<th>수정일</th>
											<th>동록일</th>
											<th>등록자</th>
											<th>수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="listview" items="${listview}" varStatus="status">
											<tr>
												<td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
												<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" />
												</td>
												<td><c:if test="${listview.state eq '100'}">사용</c:if><c:if test="${listview.state eq '200'}">사용안함</c:if></td>
												<td>${listview.project}</td>
												<td><img src="/admin/upload/images/${listview.imgfile}" width="110"></td>
												<td>${listview.title}</td>
												<td>${listview.sdate}</td>
												<td>${listview.edate}</td>
												<td>${listview.updateDate}</td>
												<td>${listview.regDate}</td>
												<td>admin</td>
												<td><a href="javascript:fn_readGo('${listview.sn}')">수정</a></td>
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
		location.href = "/admin/banner1Form";
	}
</script>

<script>
	function fn_readGo(_a) {
		document.form1.sn.value = _a;
		document.form1.action = "banner1Read";
		document.form1.submit();
	}
</script>


<script>
	function fn_formExSubmit() {
		document.form1.action = "/admin/banner1Excel";
		document.form1.target = "_new";
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
                url: "/admin/bannerChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){
                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/BannerList";
                    }
                },
                error: function(data){location.href = "/admin/AppMain1";}
            });
        }
    }


</script>


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript">
    $(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });
    })
</script>
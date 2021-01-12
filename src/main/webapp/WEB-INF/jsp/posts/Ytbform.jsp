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

							<form name="form2" id="form2" action="ytbPost" method="post" >
								<input type="hidden" name="sn" id="sn" value="" />
								<input type="hidden" name="srch" id="srch" value="SRCH" />
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<td class="tdl" style="width: 25%">검색어(키워드)</td>
												<td style="width: 75%"><input name="title" type="text"	value="" class="form-control"></td>
											</tr>
											<!--
											<tr>
												<td class="tdl" style="width: 25%">컨텐츠 타입</td>
												<td style="width: 75%">
												<select name="type"  class="form-control" >
													<c:forEach var="cateview" items="${cateview}"   varStatus="status">
													<option value="${cateview.code2}" <c:if test="${banner1Info.category eq cateview.code2}">selected</c:if>>${cateview.title}</option>
													</c:forEach>
												</select>
												</td>
											</tr>
											-->
											<tr>
												<td class="tdl" style="width: 25%">검색할 컨텐츠 수</td>
												<td style="width: 75%">
													<input type="number" name="CountCt" class="form-control" placeholder="50건 단위로 입력해주세요." step="50" min="0" max="1000" style="width:170px;display:inline-block">
													<br><span>*"크롤링 매체의 API 정책 및 제공 데이터량에 따라 입력한 숫자 만큼 컨텐츠가 크롤링되지 않을 수 있습니다."</span>
												</td>
											</tr>

											<tr>
												<td class="tdl" style="width: 25%">출처</td>
												<td style="width: 75%">
													<div style="width:200px;display: inline-block">
													<select name="snsType" id="snsType" class="form-control" >
														<option value="">출처를 선택해주세요.</option>
														<option value="ytb">유튜브</option>
														<option value="twi">트위터</option>
														<!--
														<option value="insta">인스타</option>
														<option value="fb">페이스북</option>

														-->
													</select>
													</div>
													<div id="ytbQua" style="display:none;position:relative;width: 100%;max-width: 150px;height: 30px;margin-left: 20px;border: 1px solid #EEE;background: #999999;box-sizing: border-box;">
														<div style="width: ${QuataSum}%;height: 28px;background: #1b2;display: inline-block;box-sizing: border-box;color:#FFFFFF;text-align: center;vertical-align: middle;line-height: 28px;">

														</div>
														<div style="top:3px;left: 25px;position: absolute;color: #FFFFFF;">
															<c:if test="${QuataSum < 1}" >
																<c:set var = "QuataSum" value = "0"/>
															</c:if>
															남은 할당량:${QuataSum}%
														</div>

													</div>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 25%">크롤링 대상기간</td>
												<td style="width: 75%">
													<input name="sdate" type="text" autocomplete="off" class="form-control datepicker" data-format="yyyy-mm-dd" value="" >
													<input name="edate" type="text" autocomplete="off" class="form-control datepicker" data-format="yyyy-mm-dd" value="" >
												</td>
											</tr>
										</table>
										<div class="form-group" style="margin-top: 20px">
											<button type="button" class="btn btn-gray" onclick="fn_scInit2()">초기화</button>
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">크롤링 시작</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
<form name="form1" method="post" >

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
												<button type="button" class="btn btn-orange" onclick="publishPost();">컨텐츠 등록</button>
												<button type="button" class="btn btn-gray"  onclick="excelDownload()">엑셀다운로드</button>
												<button type="button" class="btn btn-gray" onclick="deletePost()">선택 삭제</button>
											</li>
											<li style="float: left;">
												<select name="orderKeyword" id="orderKeyword"  >
                                                    <option <c:if test="${searchVO.orderKeyword eq '1'}">selected</c:if> value="1">등록일 내림차순</option>
                                                    <option <c:if test="${searchVO.orderKeyword eq '2'}">selected</c:if> value="2">등록일 오름차순</option>
													<option <c:if test="${searchVO.orderKeyword eq '3'}">selected</c:if> value="3">타이틀 내림차순</option>
													<option <c:if test="${searchVO.orderKeyword eq '4'}">selected</c:if> value="4">타이틀 오름차순</option>
													<option <c:if test="${searchVO.orderKeyword eq '5'}">selected</c:if> value="5">키워드 내림차순</option>
													<option <c:if test="${searchVO.orderKeyword eq '6'}">selected</c:if> value="6">키워드 오름차순</option>
												</select>
												<select name="pageNo" id="pageNo"  >
													<option <c:if test="${searchVO.pageNo eq '50'}">selected</c:if> value="50">50개</option>
													<option <c:if test="${searchVO.pageNo eq '100'}">selected</c:if> value="100">100개</option>
													<option <c:if test="${searchVO.pageNo eq '200'}">selected</c:if> value="200">200개</option>
													<option <c:if test="${searchVO.pageNo eq '300'}">selected</c:if> value="300">300개</option>
													<option <c:if test="${searchVO.pageNo eq '500'}">selected</c:if> value="500">500개</option>
												</select>
											</li>
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
														<th>컨텐츠타입</th>
														<th>이미지</th>
														<th>출처이미지URL</th>
														<th>원본URL</th>
														<th>출처</th>
														<th>타이틀</th>
														<th>키워드</th>
														<th>등록일</th>
														<th>관리</th>
													</tr>
													</thead>
													<tbody>

													<c:forEach var="listview" items="${listview}" varStatus="status">
														<tr>
															<td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
															<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
															<td> ${listview.type}</td>
															<td><img src="${listview.imageUrl}" width="110"></td>
															<td><div style="width:100px;word-break:break-all;white-space: normal">${listview.imageUrl}</div></td>
															<td><div style="width:100px;word-break:break-all;white-space: normal"><a href="${listview.videoUrl}" target="_blank">${listview.videoUrl}</a></div></td>
															<td><div style="width:100px;overflow:hidden">${listview.ctSource}</div></td>
															<td class="title" style="display: flex">${listview.title}</td>
															<td>${listview.keyword}</td>
															<td>${listview.regDate}<br>${listview.userid}</td>
															<td><button type="button" class="btn btn-orange" onclick="delContents(${listview.sn});">삭제</button></td>
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

    function publishPost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function () {
          //  alert($(this).attr('value'));
            arr.push($(this).attr('value'));
        });
        if (cnt == 0) {
            alert("컨텐츠를 선택해주세요.");
        }
        else {
            $.ajax({
                type: "POST",
                url: "/admin/contentsChkMove",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,

                success: function (jdata) {
                    if (jdata != 'TRUE') {
                        alert("삭제 오류");
                    } else {
                        alert("노출 성공");
                        location.href = "/admin/contents";
                    }
                },
                error: function (data) {
                    //location.href = "/admin/project";
                }
            });
        }
    }
	$(function(){
        $("#orderKeyword").on("change",function(){
            document.form1.submit();
        });
        $("#pageNo").on("change",function(){
            document.form1.submit();
        });
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
    function fn_formSv() {

        if ( document.form2.title.value == ""){
            alert("검색어를 입력해주세요.");
            return false;
        }

        if (document.form2.CountCt.value == ""){
            alert("검색할 컨텐츠 수를 입력해주세요.");
            return false;
        }
        var numChk = "/^(\\-|\\+)?([0-9]+)$/";

		var cCt = document.form2.CountCt.value;

		var cCtChk = /^(\-|\+)?([0-9]+)$/.test(cCt/50)
		if ($("select[name='snsType'] option:selected").val() =='ytb'){
			if(!cCtChk){
				alert("50건 단위로 입력해주세요.");
				return false;
			}
        }
        if(cCt > 1000){
            alert("1000건 초과 조회되지 않습니다.");
            return false;
		}
        if(cCt <= 0){
            alert("1건 이상 조회 해야합니다..");
            return false;
        }
		if(document.form2.sdate.value != '' && document.form2.edate.value != ''){
			var sDate = new Date(document.form2.sdate.value);
			var eDate = new Date(document.form2.edate.value);
            if ($("select[name='snsType'] option:selected").val() =='twi'){
                if((Date.now() - sDate) > 691200000){
                    alert("금일부터 최대 7일전까지 검색할 수 있습니다.");
                    return false;
                }
            }


			if(eDate < sDate){
				alert("검색 시작일이 종료일보다 늦을수는 없습니다.");
				return false;
			}
        }
        if ( $("#snsType option:selected").val() == ""){
            alert("크롤링할 출처를 선택해주세요.");
            return false;
        }
        if (${QuataSum}<=0 ){
            alert("금일 유튜브 API사용량이 소진되었습니다. 16시에 초기화 됩니다.");
            return false;
        }

        $("#loading").show();
        $.ajax({
            type: "POST",
            url: "/admin/ytbPost",
            data: $("form[name=form2]").serialize(),
            success: function(jdata){
                if(jdata != 'TRUE') {
                    alert("수집 오류");
                }else{
                    alert("수집 성공");
                    location.href = "/admin/ytbForm";
                }
            },
            error: function(data){alert("수집 오류");}
        });
    }

	$(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {
                $("input[name='chkSn']").prop('checked', false);
            }
        });

        $("select[name='snsType']").on("change",function(){
			var valType = $("select[name='snsType'] option:selected").val();
			if(valType=='ytb'){
                $("input[name='CountCt']").attr("placeholder","50건 단위로 입력해주세요.(1000건 초과 검색이 불가합니다.)");
                $("input[name='CountCt']").attr("step","50");
                $("input[name='CountCt']").val();
				$("#ytbQua").css('display','inline-block');
			}else{
				$("input[name='CountCt']").attr("placeholder","1000건 초과 검색이 불가합니다.");
				$("input[name='CountCt']").attr("step","1");
                $("input[name='CountCt']").val();
                $("#ytbQua").css('display','none');
			}
        });
	});
    function excelDownload() {
        document.form1.action='ExcelDownloadC';
        document.form1.submit();
        document.form1.action='';
    }


    function delContents(sn){
        $.ajax({
            type: "POST",
            url: "/admin/contentsChkDelete",
            data: "RPRT_ODR=" + sn + "&CNT=1",
            success: function(jdata){
                if(jdata != 'TRUE') {
                    alert("삭제 오류");
                }else{
                    alert("삭제 성공");
                    location.href = "/admin/ytbForm";
                }
            },
            error: function(data){alert(data);location.href = "/admin/ytbForm";}
        });
    }

    function deletePost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function() {
            arr.push($(this).attr('value'));
        });
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
            return false;
        }
        else{
            $.ajax({
                type: "POST",
                url: "/admin/contentsChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                success: function(jdata){
                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/ytbForm";
                    }
                },
                error: function(data){alert(data);location.href = "/admin/ytbForm";}
            });
        }
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
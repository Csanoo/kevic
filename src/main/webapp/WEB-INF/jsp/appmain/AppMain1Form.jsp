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
					<h1 class="title">팝업 </h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">팝업 등록</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="appmain1Save" method="post"	enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">


										<table id="customers">
											<tr>

												<input value="1" name="appkind" type="hidden" class="form-control">

												<td class="tdl" style="width: 15%">프로트젝트명 </td>

												<td style="width: 35%">
													<select name="project">
														<c:forEach var="projectview" items="${projectview}"   varStatus="status">
															<option value="${projectview.sn}" <c:if test="${searchVO.sproject eq projectview.sn}">selected</c:if>>${projectview.title}</option>
														</c:forEach>
													</select>
												</td>

												<td class="tdl" style="width: 15%">사용 여부</td>

												<td style="width: 35%">
													<input type="radio" value="100" name="state" checked><label>사용</label>
													<input type="radio" value="000" name="state"><label>사용안함</label>
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 타이틀</td>

												<td style="width: 35%" colspan="3"><input name="title" type="text" value="" class="form-control"></td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 기간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="displaytype" checked><label>상시 노출</label>
													<input type="radio" value="N" name="displaytype"><label>기간 노출</label>
													<input name="sdate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd">
													<input name="edate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd">
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 시간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="dtimetype" checked><label>상시 노출</label>
													<input type="radio" value="N" name="dtimetype"><label>기간 노출</label>
													<input name="stime" type="text" class="form-control" value="${appmain1Info.stime}" placeholder="24:00:00" >
													<input name="etime" type="text" class="form-control" value="${appmain1Info.etime}" placeholder="01:00:00">
												</td>
											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 위치</td>

												<td style="width: 35%" colspan="3">상단<input name="positionY" type="text" class="form-control">
													좌측<input name="positionX" type="text" class="form-control">
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 크기</td>

												<td style="width: 35%" colspan="3">
													가로(pixel)<input name="sWidth" type="text" class="form-control" placeholder="px단위 입력해야합니다.">
													세로(pixel)<input name="sHeight" type="text" class="form-control" placeholder="px단위 입력해야합니다.">
												</td>

											</tr>
											<tr>
												<td class="tdl" style="width: 15%">팝업 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="100" name="closeType" checked><label>오늘 이창을 열지 않음</label>
													<input type="radio" value="200" name="closeType"><label>이 창을 7일간 열지 않음</label>
													<input type="radio" value="300" name="closeType"><label>이 창을 다시 열지 않음</label>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">상세 디자인</td>

												<td style="width: 35%" colspan="3">
													<textarea name="umemo" id="umemo"></textarea>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">링크설정 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="200" name="linkState" checked><label>사용안함</label>
													<input type="radio" value="100" name="linkState"><label>사용</label>
													<select name="linkTarget">
														<option value="100">부모창</option>
														<option value="200">새창열기</option>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">URL</td>

												<td style="width: 35%" colspan="3">
													<input type="text" value="" name="url" >
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


						</div>
					</div>
				</div>
			</section>
		</div>

		<form name="formList" action="AppMain1List" method="post">
			<input type="hidden" name="searchType" value="<c:out value="${searchVO.searchType}"/>">
			<input type="hidden" name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>">
			<input type="hidden" name="orderKeyword" value="<c:out value="${fn:trim(searchVO.orderKeyword)}"/>">
			<input	type="hidden" name="page" value="<c:out value="${pageVO.page}"/>">
		</form>



	</section>
</section>
<!-- END CONTENT -->


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript" src="/admin/design/assets/plugins/smart/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: umemo,
        elPlaceHolder: "umemo",
        sSkinURI: "/admin/design/assets/plugins/smart/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
            fOnBeforeUnload: function () {
                //alert("완료!");
            }
        }, //boolean
        fOnAppLoad: function () {
            //예제 코드
            //oEditors.getById["editor"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
        },
        fCreator: "createSEditor"
    });
</script>
<script>
    function fn_formSv() {
       // oEditors.getById["umemo"].exec("UPDATE_CONTENTS_FIELD", []);
        document.form1.submit();

    }
    function fn_formRtn() {
        document.formList.submit();

    }
    $(function(){
        $('.timepicker').timepicker();
    });
</script>
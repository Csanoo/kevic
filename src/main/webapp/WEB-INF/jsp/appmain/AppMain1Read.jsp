<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />

<section id="main-content" class=" ">
	<section class="wrapper" style='margin-top:60px;display:inline-block;width:100%;
                padding:15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">팝업 수정페이지</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="appmain1Up" method="post"  enctype="multipart/form-data">
								<input name="sn" type="hidden"  value="${appmain1Info.sn}">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<input value="1" name="appkind" type="hidden" class="form-control">

												<td class="tdl" style="width: 15%">프로트젝트명 </td>

												<td style="width: 35%">
													<select name="project">
														<option value="">프로젝트</option>
														<c:forEach var="projectview" items="${projectview}"   varStatus="status">
															<option value="${projectview.sn}" <c:if test="${projectview.sn eq appmain1Info.project}">selected</c:if>>${projectview.title}</option>
														</c:forEach>
													</select>
												</td>

												<td class="tdl" style="width: 15%">사용 여부</td>

												<td style="width: 35%">
													<input type="radio" value="100" name="state" <c:if test="${appmain1Info.state eq '100'}">checked</c:if>><label>사용</label>
													<input type="radio" value="000" name="state" <c:if test="${appmain1Info.state eq '000'}">checked</c:if>><label>사용안함</label>
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 타이틀</td>

												<td style="width: 35%" colspan="3"><input name="title" type="text" value="${appmain1Info.title}" class="form-control"></td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 기간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="displaytype" <c:if test="${appmain1Info.displaytype eq 'Y'}">checked</c:if>><label>상시 노출</label>
													<input type="radio" value="N" name="displaytype" <c:if test="${appmain1Info.displaytype eq 'N'}">checked</c:if>><label>기간 노출</label>
													<input name="sdate" type="text" class="form-control datepicker" value="${appmain1Info.sdate}" data-format="yyyy-mm-dd" <c:if test="${appmain1Info.displaytype eq 'Y'}">disabled</c:if>>
													<input name="edate" type="text" class="form-control datepicker" value="${appmain1Info.edate}" data-format="yyyy-mm-dd" <c:if test="${appmain1Info.displaytype eq 'Y'}">disabled</c:if>>
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 시간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="dtimetype" <c:if test="${appmain1Info.dtimetype eq 'Y'}">checked</c:if>><label>상시 노출</label>
													<input type="radio" value="N" name="dtimetype" <c:if test="${appmain1Info.dtimetype eq 'N'}">checked</c:if>><label>기간 노출</label>
														<input name="stime" type="time" class="form-control" value="${appmain1Info.stime}" <c:if test="${appmain1Info.dtimetype eq 'Y'}">disabled</c:if>>
														<input name="etime" type="time" class="form-control" value="${appmain1Info.etime}" <c:if test="${appmain1Info.dtimetype eq 'Y'}">disabled</c:if>>

												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 위치</td>

												<td style="width: 35%" colspan="3">상단<input name="positionY" type="number" class="form-control" value="${appmain1Info.positionY}">
													좌측<input name="positionX" type="number" class="form-control" value="${appmain1Info.positionX}">
												</td>

											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 크기</td>

												<td style="width: 35%" colspan="3">
													가로(pixel)<input name="sWidth" type="number" class="form-control" value="${appmain1Info.sWidth}">
													세로(pixel)<input name="sHeight" type="number" class="form-control" value="${appmain1Info.sHeight}">
												</td>

											</tr>
											<tr>
												<td class="tdl" style="width: 15%">팝업 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="100" name="closeType" <c:if test="${appmain1Info.closeType eq '100'}">checked</c:if>><label>오늘 이창을 열지 않음</label>
													<input type="radio" value="200" name="closeType" <c:if test="${appmain1Info.closeType eq '200'}">checked</c:if>><label>이 창을 7일간 열지 않음</label>
													<input type="radio" value="300" name="closeType" <c:if test="${appmain1Info.closeType eq '300'}">checked</c:if>><label>이 창을 다시 열지 않음</label>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 30%">상세 디자인</td>

												<td style="width:70%" colspan="3">
													<textarea name="umemo" id="umemo"></textarea>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">링크설정 닫기</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="200" name="linkState" <c:if test="${appmain1Info.linkState eq '200'}">checked</c:if>><label>사용안함</label>
													<input type="radio" value="100" name="linkState" <c:if test="${appmain1Info.linkState eq '100'}">checked</c:if>><label>사용</label>
													<select name="linkTarget" <c:if test="${appmain1Info.linkState eq '200'}">disabled</c:if>>
														<option value="100" <c:if test="${appmain1Info.linkTarget eq '100'}">selected</c:if>>부모창</option>
														<option value="200" <c:if test="${appmain1Info.linkTarget eq '200'}">selected</c:if>>새창열기</option>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">URL</td>

												<td style="width: 35%" colspan="3">
													<input type="text" value="${appmain1Info.link}" name="link" <c:if test="${appmain1Info.linkState eq '200'}">disabled</c:if>>
												</td>
											</tr>
										</table>

										<br>
										<div class="form-group" style="margin-top: 10px">

											<button type="button" class="btn btn-gray" onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange" data-popup-open="example">미리보기</button>
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>


										</div>

									</div>

								</div>
							</form>





							<script>

                                function fn_formSv() {
                                    oEditors.getById["umemo"].exec("UPDATE_CONTENTS_FIELD", []);
                                    var frm = document.form1;
                                    if($("select[name='project']").val()==''){
                                        alert('프로젝트를 선택해주세요.');
                                        frm.project.focus();
                                        return false;
                                    }
                                    if(frm.title.value == ''){
                                        alert('팝업 타이틀을 확인해주세요.');
                                        frm.title.focus();
                                        return false;
                                    }
                                    if(frm.displaytype.value == 'N' ){
                                        if( frm.sdate.value == '' || frm.edate.value == '') {
                                            alert('기간노출시 시작일과 종료일을 모두 입력해주세요.');
                                            frm.sdate.focus();
                                            return false;
                                        }

                                        var sDate = new Date(document.form1.sdate.value);
                                        var eDate = new Date(document.form1.edate.value);
                                        if(eDate < sDate){
                                            alert("검색 시작일이 종료일보다 늦을수는 없습니다.");
                                            return false;
                                        }

                                    }
                                    if(frm.dtimetype.value == 'N' ){
                                        if( frm.stime.value == '' || frm.etime.value == '') {
                                            alert('시간제한시 시작시간과 종료시간을 모두 입력해주세요.');
                                            frm.stime.focus();
                                            return false;
                                        }
                                    }
                                    if(frm.positionY.value == ''){
                                        alert('팝업위치를 확인해주세요.');
                                        frm.positionY.focus();
                                        return false;
                                    }
                                    if(frm.positionX.value == ''){
                                        alert('팝업위치를 확인해주세요.');
                                        frm.positionX.focus();
                                        return false;
                                    }
                                    if(frm.sHeight.value == ''){
                                        alert('팝업 크기를 확인해주세요.');
                                        frm.sHeight.focus();
                                        return false;
                                    }
                                    if(frm.sWidth.value == ''){
                                        alert('팝업 크기를  확인해주세요.');
                                        frm.sWidth.focus();
                                        return false;
                                    }
                                    if(frm.linkState.value == '100' ){
                                        if( frm.link.value == '' ) {
                                            alert('링크 타겟 사용시 URL을 입력해주세요)');
                                            frm.link.focus();
                                            return false;
                                        }
                                    }

                                    var umemo = $("#umemo").val();
                                    if( umemo == ""  || umemo == null || umemo == '&nbsp;' || umemo == '<p>&nbsp;</p>')  {
                                        alert("상세디자인 입력하세요.");
                                        oEditors.getById["umemo"].exec("FOCUS"); //포커싱
                                        return;
                                    }
                                    document.form1.submit();

                                }
                                function fn_formRtn() {
                                    document.formList.submit();

                                }
                                function fn_formDel() {
                                    document.form1.action="appmain1Delete";
                                    document.form1.submit();

                                }

							</script>

						</div>
					</div>
				</div>
			</section>
		</div>

		<form name="formList" action="AppMain1" method="post">
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
<script type="text/javascript" src="/admin/design/assets/plugins/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "umemo",
        sSkinURI: "/admin/design/assets/plugins/se2/SmartEditor2Skin.html",
        htParams: {
            bUseToolbar: false,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
            fOnBeforeUnload: function () {
                //alert("완료!");
            }
        }, //boolean
        fOnAppLoad: function () {
            //예제 코드
            oEditors.getById["umemo"].exec("PASTE_HTML", ['${appmain1Info.umemo}']);
        },
        fCreator: "createSEditor"
    });
    $(function() {
        //----- OPEN
        $('[data-popup-open]').on('click', function(e)  {
            var xposition = $("input[name=positionX]").val();
            var yposition = $("input[name=positionY]").val();
			$("#popup-title").html($("input[name=title]").val());
            oEditors.getById["umemo"].exec("UPDATE_CONTENTS_FIELD", []);
            $("#popup-content").html($("#umemo").val());
            var closetype = '';

            if($("input[name='closeType']:checked").val()=='100'){
                closetype='오늘 이창을 열지 않음';
			}
            if($("input[name='closeType']:checked").val()=='200'){
                closetype='이 창을 7일간 열지 않음';
            }
            if($("input[name='closeType']:checked").val()=='300'){
                closetype='이 창을 다시 열지 않음';
            }
            $("#chkTxt").html(closetype);
            $(".popup-inner").height($("input[name=sHeight]").val());
            $(".popup-inner").width($("input[name=sWidth]").val());
            $(".popup-inner").css("top",yposition+"px");
            $(".popup-inner").css("left",xposition+"px");
            var targeted_popup_class = jQuery(this).attr('data-popup-open');
            $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

            e.preventDefault();
        });

        //----- CLOSE
        $('[data-popup-close]').on('click', function(e)  {
            var targeted_popup_class = jQuery(this).attr('data-popup-close');
            $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);

            e.preventDefault();
        });
        $("input[name='displaytype']").on("change",function(){
            if($(this).val()=='Y'){
                $("input[name='sdate']").attr("disabled",true);
                $("input[name='edate']").attr("disabled",true);
                $("input[name='sdate']").val('');
                $("input[name='edate']").val('');
            }else{
                $("input[name='sdate']").attr("disabled",false);
                $("input[name='edate']").attr("disabled",false);
            }
        });
        $("input[name='dtimetype']").on("change",function(){
            if($(this).val()=='Y'){
                $("input[name='stime']").attr("disabled",true);
                $("input[name='etime']").attr("disabled",true);
                $("input[name='stime']").val('');
                $("input[name='etime']").val('');
            }else{
                $("input[name='stime']").attr("disabled",false);
                $("input[name='etime']").attr("disabled",false);

            }
        });
        $("input[name='linkState']").on("change",function(){
            if($(this).val()=='200'){
                $("input[name='link']").attr("disabled",true);
                $("select[name='linkTarget']").attr("disabled",true);
            }else{
                $("input[name='link']").attr("disabled",false);
                $("select[name='linkTarget']").attr("disabled",false);
            }
        })
    });
</script>

<div class="popup" data-popup="example">
	<div class="popup-inner">
		<div class="popup-contents"> <a class="popup-close" data-popup-close="example" href="#">X</a>
			<span id="popup-title"></span>
			<div id="popup-content">

			</div>
			<div style="position: absolute;bottom: 10px;width: 98%;box-sizing: border-box;height: 40px;line-height: 40px;padding: 10px 20px;border-top: 1px solid #999999;">
				<input type="checkbox" value="Y">
				<span id="chkTxt"></span>
				<button type="button" class="btn btn-gray pull-right" data-popup-close="example">닫기</button>
			</div>
		</div>

	</div>
</div>
<style>
	.popup { /* 팝업이 열렸을 때, 팝업창 주변 전체를 어둡게 합니다 */ display: none; position:fixed; width: 100%; height: 100%; top:0; left:0; background:rgba(0,0,0,0.5);
		z-index: 2000;}
	.popup-inner { /* 열렸을 때 팝업창 크기와 색상을 지정합니다. */ position:absolute; width: 50%; height: 50%; padding : 10px; background:#fff; z-index:2001}
	.popup-close{ /* 팝업창 내 닫기 버튼의 위치를 지정합니다. */ position: absolute; display: block; top:10px; right: 10px; }
	#popup-content{margin:20px 0 0 0;border-top:1px solid #999999}

</style>
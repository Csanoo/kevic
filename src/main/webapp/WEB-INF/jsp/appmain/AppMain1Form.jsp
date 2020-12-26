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
													<input name="sdate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd" disabled>
													<input name="edate" type="text" class="form-control datepicker" data-format="yyyy-mm-dd" disabled>
												</td>


											</tr>
											<tr>

												<td class="tdl" style="width: 15%">노출 시간</td>

												<td style="width: 35%" colspan="3">
													<input type="radio" value="Y" name="dtimetype" checked><label>상시 노출</label>
													<input type="radio" value="N" name="dtimetype"><label>기간 노출</label>
													<input name="stime" type="text" class="form-control" value="${appmain1Info.stime}" disabled placeholder="24:00:00" >
													<input name="etime" type="text" class="form-control" value="${appmain1Info.etime}" disabled placeholder="01:00:00">
												</td>
											</tr>

											<tr>
												<td class="tdl" style="width: 15%">노출 위치</td>
												<td style="width: 35%" colspan="3">상단<input name="positionY" type="text" class="form-control" placeholder="px단위를 입력해야합니다.">
													좌측<input name="positionX" type="text" class="form-control" placeholder="px단위를 입력해야합니다.">
												</td>
											</tr>
											<tr>

												<td class="tdl" style="width: 15%">팝업 크기</td>

												<td style="width: 35%" colspan="3">
													가로(pixel)<input name="sWidth" type="text" class="form-control" placeholder="px단위를 입력해야합니다.">
													세로(pixel)<input name="sHeight" type="text" class="form-control" placeholder="px단위를 입력해야합니다.">
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
													<select name="linkTarget" disabled>
														<option value="100">부모창</option>
														<option value="200">새창열기</option>
													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">URL</td>

												<td style="width: 35%" colspan="3">
													<input type="text" value="" name="url" disabled>
												</td>
											</tr>
										</table>


										<div class="form-group" style="margin-top: 10px">
											<button type="button" class="btn btn-gray"
													onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange" data-popup-open="example">미리보기</button>
											<button type="button" class="btn btn-orange"기
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

		<form name="formList" action="AppMain1" method="post">
			<input type="hidden" name="searchType" value="<c:out value="${searchVO.searchType}"/>">
			<input type="hidden" name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>">
			<input type="hidden" name="orderKeyword" value="<c:out value="${fn:trim(searchVO.orderKeyword)}"/>">
			<input	type="hidden" name="page" value="<c:out value="${pageVO.page}"/>">
		</form>



	</section>
</section>
<!-- END CONTENT -->


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />
<script type="text/javascript" src="/admin/design/assets/plugins/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
    $(function(){
        $('.timepicker').timepicker();
        $("input[name='displaytype']").on("change",function(){
            if($(this).val()=='Y'){
                $("input[name='sdate']").attr("disabled",true);
                $("input[name='edate']").attr("disabled",true);
            }else{
                $("input[name='sdate']").attr("disabled",false);
                $("input[name='edate']").attr("disabled",false);
            }
        });
        $("input[name='dtimetype']").on("change",function(){
            if($(this).val()=='Y'){
                $("input[name='stime']").attr("disabled",true);
                $("input[name='etime']").attr("disabled",true);
            }else{
                $("input[name='stime']").attr("disabled",false);
                $("input[name='etime']").attr("disabled",false);
            }
        });
        $("input[name='linkState']").on("change",function(){
            if($(this).val()=='200'){
                $("input[name='url']").attr("disabled",true);
                $("select[name='linkTarget']").attr("disabled",true);
            }else{
                $("input[name='url']").attr("disabled",false);
                $("select[name='linkTarget']").attr("disabled",false);
            }
        });
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
    });
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
            if( frm.url.value == '' ) {
                alert('링크 타겟 사용시 URL을 입력해주세요)');
                frm.url.focus();
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
            //oEditors.getById["editor"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
        },
        fCreator: "createSEditor"
    });

    function fn_preview(){


	}

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

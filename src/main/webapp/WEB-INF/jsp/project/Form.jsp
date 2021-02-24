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
                                <h1 class="title">프로젝트 관리</h1>
                            </div>


                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">컨텐츠 수동 등록</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<form name="form1" action="projectSave" method="post"	enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<table id="customers">
											<tr>
												<input value="1" name="appkind" type="hidden" class="form-control">
												<input value="200" name="state" type="hidden" class="form-control">
												<td class="tdl" style="width: 15%">프로트젝트명 </td>

												<td style="width: 35%" colspan="3">
													<select name="project"  id="project" class="form-control">

														<c:forEach var="projectview" items="${projectview}"   varStatus="status">
															<option value="${projectview.sn}" <c:if test="${projectInfo.project eq projectview.sn}">selected</c:if>>${projectview.title}</option>
														</c:forEach>
													</select>
												</td>
											
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">컨텐츠 타입</td>
												<td style="width: 35%" colspan="3">
													<select name="type"  class="form-control" >
														<c:forEach var="cateview" items="${cateview}"   varStatus="status">
															<option value="${cateview.code2}" <c:if test="${projectInfo.type eq cateview.code2}">selected</c:if>>${cateview.title}</option>
														</c:forEach>

													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">전시 카테고리</td>
												<td style="width: 35%" colspan="3">
													<div id="category01">
													<select name="category01" id="category1" class="form-control" >
														<option value="">카테고리</option>
														<c:forEach var="cateview" items="${cateview1}"   varStatus="status">
															<option value="${cateview1.code2}" <c:if test="${projectInfo.catesn eq cateview1.sn}">selected</c:if>>${cateview1.title}</option>
														</c:forEach>

													</select>
													</div>
													<div id="category02">
														<select name="category02" id="category2" class="form-control" >
															<option value="">카테고리</option>

														</select>
													</div>
												</td>
											</tr>
											<tr>

												<td class="tdl" style="width: 15%">출처 이미지 URL</td>

												<td style="width: 35%" colspan="3"><input name="imageUrl" type="text"  class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">원본 URL</td>

												<td style="width: 35%" colspan="3"><input name="videoUrl" type="text"  class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">출처</td>
												<td style="width: 35%" colspan="3">
													<select name="ctSource" id="ctSource" class="form-control" >
														<c:forEach var="sourceview" items="${sourceview}"   varStatus="status">
															<option value="${sourceview.code2}">${sourceview.title}</option>
														</c:forEach>

													</select>
												</td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">타이틀</td>
												<td style="width: 35%"  colspan="3"><input name="title" type="text"	class="form-control"></td>
											</tr>
											<tr>
												<td class="tdl" style="width: 15%">키워드</td>
												<td style="width: 35%"  colspan="3"><input name="keyword" type="text"	class="form-control"></td>
											</tr>
										</table>

										<div class="form-group" style="margin-top: 10px">
											<button type="button" class="btn btn-gray"	onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-gray" data-toggle="modal" data-target="#myModal" id="preview">미리보기</button>
											<button type="button" class="btn btn-orange" onclick="fn_formSv()">저장</button>
										</div>

									</div>

								</div>
							</form>
							<script>
								function fn_formSv() {
								    var frm =  document.form1;
                                    if(frm.keyword.value == ''){
                                        alert('키워드를 확인해주세요.');
                                        frm.keyword.focus();
                                        return false;
                                    }
                                    if(frm.title.value == ''){
                                        alert('타이틀 확인해주세요.');
                                        frm.title.focus();
                                        return false;을
                                    }
                                    if(frm.imageUrl.value == ''){
                                        alert('이미지URL을 확인해주세요.');
                                        frm.imageUrl.focus();
                                        return false;
                                    }
                                    if(frm.ctSource.value == ''){
                                        alert('출처를 확인해주세요.');
                                        frm.ctSource.focus();
                                        return false;
                                    }
									document.form1.submit();

								}
								function fn_formRtn() {
									document.formList.submit();

								}
							</script>

						</div>
					</div>
				</div>
			</section>
		</div>

	<form name="formList" action="AppMain1List" method="post">
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

<script>

    $(function(){
        var sn = $("#project option:selected").val();
        $.get("/admin/category01?sn="+sn,function(data){
            $( "#category1" ).html( data );
            //alert( "Load was performed." );
        });
        $("#preview").on("click",function(){
			$("#preview-img").attr("src",$("input[name='imageUrl']").val());
            $("#preview-keyword").html('('+$("input[name='keyword']").val()+')');
            $("#preview-title").html($("input[name='title']").val());

        });
		$("#project").on("change",function(){
            var sn = $("#project option:selected").val();
            $( "#category2" ).html('<option value="0">카테고리</option>');
            $( "#category1" ).html('<option value="0">카테고리</option>');
            $.get("/admin/category01?sn="+sn,function(data){
                $( "#category1" ).html( data );
                //alert( "Load was performed." );
            });
		});
        $("#category1").on("change",function(){

            var sn = $("#category1 option:selected").val();
            $.get("/admin/category02?sn="+sn,function(data){
                $( "#category2" ).html( data );
                //alert( "Load was performed." );
            });
        });
    })
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<img src="" id="preview-img">
			</div>
			<div class="modal-footer">
				<p id="preview-keyword" style="text-align:left;font-size:12px">
				</p>
				<p id="preview-title" style="text-align:left;font-size:16px">
				</p>
			</div>
		</div>
	</div>
</div>
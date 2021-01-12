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
                                <h1 class="title">Code View</h1>                            
                            </div>


                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Code Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
					<form name="form1" action="codeSave" method="post"	enctype="multipart/form-data">
						<input name="sn" type="hidden"	value="${mvo.sn}">

						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table id="customers">
									<tr>


										<td class="tdl" style="width: 15%">상위코드</td>

										<td style="width: 35%">
											${mvo.code1}
											<c:forEach var="listsel" items="${listsel}"	   varStatus="status">

												<c:if test="${mvo.code1 eq listsel.code1}">${listsel.code1memo}</c:if></c:forEach>

											<input type="hidden" name="code1" value="${mvo.code1}" >
										</td>


										<td class="tdl" style="width: 15%">코드</td>
										<td style="width: 35%"><input name="code2" type="text" maxlength="3" class="form-control" style="width: 100px;ime-mode:disabled;display:inline-block" value="${mvo.code2}">
											<input type="hidden" name="titleCk" id="titleCk" value="3">
											<button type="button" class="btn btn-gray" id="dupTit">중복 확인</button>
											<br>*3자이하, 영문, 숫자만 입력가능, 대소문자 구분 안함
										</td>
									</tr>
									
									<tr>


										<td class="tdl" style="width: 15%">코드명</td>
										<td style="width: *" colspan="3">
										<input name="title" type="text" class="form-control" value="${mvo.title}"></td>
								
								</tr>
								
								<tr>


										<td class="tdl" style="width: 15%">설명</td>
										<td style="width: *" colspan="3">
										<input name="memo" type="text" class="form-control"
										value="${mvo.memo}"></td>
								
								</tr>
								</table>

							</div>

						</div>


										<div class="form-group" style="display:none">
											<label class="form-label" for="field-1">첨부파일</label>
											<div class="controls">
												<c:forEach var="listview" items="${listview}"
													varStatus="status">
													<input type="checkbox" name="fileno"
														value="<c:out value="${listview.fileno}"/>">
													<a
														href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
														<c:out value="${listview.filename}" />
													</a>
													<c:out value="${listview.size2String()}" />
													<br />
												</c:forEach>


												<input type="file" name="uploadfile" multiple="" />
											</div>
										</div>

										<div class="form-group" style="margin-top:20px">

											<button type="button" class="btn btn-gray"
												onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange"
												onclick="fn_formSv()">저장</button>
											<button type="button" class="btn btn-purple"
												onclick="fn_formDel()">삭제</button>
										</div>

									
							
							
							</form>
					<script>
						function fn_formSv() {
                            if ( document.form1.code2.value == '' ) {
                                alert("코드를 입력 해주세요.");
                                document.form1.code2.focus();
                                return false;
                            }
                            if(document.form1.titleCk.value == '0'){
                                alert('코드 중복을 확인해주세요.');
                                frm.code2.focus();
                                return false;
                            }
                            if ( document.form1.title.value == '' ) {
                                alert("코드명 입력 해주세요.");
                                document.form1.code2.focus();
                                return false;
                            }
                            if ( document.form1.memo.value == '' ) {
                                alert("설명을 입력 해주세요.");
                                document.form1.code2.focus();
                                return false;
                            }
                            $.ajax({
                                type: "POST",
                                url: "/admin/codeUp",
                                data: $("form[name=form1]").serialize(),
                                success: function(jdata){
                                    if(jdata != 'TRUE') {
                                        alert("수정 오류");
                                    }else{
                                        alert("수정 성공");
                                        location.href = "/admin/codeList";
                                    }
                                },
                                error: function(data){alert(data);location.href = "/admin/codeList";}
                            });

						}
						function fn_formRtn() {
							document.formList.submit();

						}
                        function fn_formDel() {
						    if(confirm('삭제하겠습니까?')){
								$.ajax({
									type: "POST",
									url: "/admin/codeDelete",
									data: "sn=${mvo.sn}",
									success: function(jdata){
										if(jdata != 'TRUE') {
											alert("삭제 오류");
										}else{
											alert("삭제 성공");
											location.href = "/admin/codeList";
										}
									},
									error: function(data){alert(data);location.href = "/admin/codeList";}
								});
                            }
                        }




					</script>

				</div>
					</div>
				</div>
			</section>
		</div>


<form name="formList" action="codeList" method="post">
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
    $(document).ready(function(){

        //한글입력 안되게 처리

        $("input[name=code2]").on("propertychange change keyup paste input",function(event){

            if (!(event.keyCode >=37 && event.keyCode<=40)) {

                var inputVal = $(this).val();

                $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

            }
            //  $("#titleCk").val(0);
        });
        var oldTitle = "${mvo.code2}";
        $("input[name='code2']").on("propertychange change keyup paste input", function() {
            var currentVal = $(this).val();
            if(currentVal == oldTitle) {
                return;
            }

            oldTitle = currentVal;
            $("#titleCk").val(0);
        });
        $("#dupTit").on("click",function(){
            var title = $("input[name='code2']").val();
            if(title==""){
                alert("코드를 입력해주세요");
                return false;
            }

            if(title == "${mvo.code2}"){
                alert("코드 변경후 중복확인해주세요");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "/admin/selCodeTitCt",
                data: "code2=" + title,
                success: function (jdata) {
                    if(jdata<1){
                        alert("사용할 수 있는 코드입니다.");
                        $("#titleCk").val(1);
                    }else{
                        alert("중복 된 코드입니다.");
                        $("#titleCk").val(0);
                    }
                },
                error: function (data) {
                    alert("오류 관리자에게 문의해주세요");
                }
            });
        });
    });
</script>


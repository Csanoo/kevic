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
                                <h1 class="title">Member Regist</h1>                            
                            </div>


                        </div>
                    </div>
                    <div class="clearfix"></div>

		<div class="col-lg-12">
			<section class="box ">
				<header class="panel_header">
					<h2 class="title pull-left">Member Info</h2>
					<div class="actions panel_actions pull-right">
						<i class="box_toggle fa fa-chevron-down"></i> <i
							class="box_setting fa fa-cog" data-toggle="modal"
							href="#section-settings"></i> <i class="box_close fa fa-times"></i>
					</div>
				</header>
				<div class="content-body">
							<form name="form1" action="memberSave" method="post"
								enctype="multipart/form-data">
								
								<input name="userid" type="hidden" value="${mvo.userid}">




						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table id="customers">
									<tr>


										<td class="tdl" style="width: 15%">아이디</td>

										<td style="width: 35%">
												${mvo.userid}
										</td>


										<td class="tdl" style="width: 15%">이름</td>
										<td style="width: 35%"><input name="username" type="text"
											value="${mvo.username}"
											class="form-control" style="width: 200px"></td>
									</tr>
									
									<tr>


										<td class="tdl" style="width: 15%">비밀번호</td>
										<td style="width: 35%" >
										<input name="userpw" type="password" 
										value="${mvo.userpw}"
										class="form-control" style="width: 200px"></td>

										<td class="tdl" style="width: 15%">비밀번호</td>
										<td style="width: 35%" >
											<input name="userpw1" type="password"   value=""   class="form-control" style="width: 200px"></td>



								
								</tr>
								
								<tr>


									<td class="tdl" style="width: 15%">회원타입</td>
									<td style="width: 35%" >


										<select name="usertype" class="form-control" style="width: 100px">
											<option value="SA" <c:if test="${mvo.usertype eq 'SA'}">selected</c:if>>관리자</option>
											<option value="EU" <c:if test="${mvo.usertype eq 'EU'}">selected</c:if>>일반관리자</option>
										</select>

									</td>
								
								


										<td class="tdl" style="width: 15%">Email</td>
										<td style="width: 35%" >
										<input name="email" type="text" 
										value="${mvo.email}"
										class="form-control" style="width: 250px"></td>
								
								</tr>
								</table>

							</div>

						</div>





<c:if test="${mvo.imgfile ne ''}">
<div><img src="/images/${mvo.imgfile}"></div>
</c:if>					




										<div class="form-group" style="margin-top:20px">

											<button type="button" class="btn btn-gray"
												onclick="fn_formRtn()">목록</button>
											<button type="button" class="btn btn-orange"
												onclick="fn_formSv()">저장</button>
										</div>

									
							
							
							</form>
							<script>
						function fn_formSv() {
                            if ( f.userpw.value != f.userpw1.value ) {
                                alert("비번 확인 바랍니다.");
                            } else {

                                document.form1.submit();
                            }


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


<form name="formList" action="memberList" method="post">
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



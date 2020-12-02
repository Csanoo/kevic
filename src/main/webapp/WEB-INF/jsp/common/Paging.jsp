<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${searchVO.totPage>1}">
	<div class="col-md-12 col-sm-12 col-xs-12">


		<nav aria-label="Page navigation example">
			<ul class="pagination">


				<c:if test="${searchVO.page>1}">
					<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(1);">처음</a></li>
					<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.page-1});">이전</a></li>
				</c:if>

				<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1" varStatus="status">
					<li class="page-item">
						<c:choose>
							<c:when test="${i eq searchVO.page}">
								<a class="page-link" href="#" 
								style='color:#f1f1f1;font-weight:800;background-color:#838383'>
									<c:out value="${i}" /></a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="javascript:fnSubmitForm(${i});">
									<c:out value="${i}" /></a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>

				<c:if test="${searchVO.totPage > searchVO.page}">
					<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.page+1});">다음</a></li>
					<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.totPage});">마지막</a></li>
				</c:if>

			</ul>
		</nav>

	</div>


	<input type="hidden" name="page" id="page" value="" />

	<script type="text/javascript">
		function fnSubmitForm(page) {
			document.form1.page.value = page;
			document.form1.submit();
		}
	</script>
</c:if>



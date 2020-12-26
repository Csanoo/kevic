<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form name="form2">
<ul>
    <li style="display: flex;justify-content: flex-start">
        <div></div>
    </li>
<c:forEach var="msglist" items="${msglist}" varStatus="status">

<li style="">
    <div>${msglist.regid} <span aria-hidden="true">×</span></div>
    <div>${msglist.msg}</div>
    <div>${msglist.regDate}</div>
</li>
</c:forEach>
<c:if test="${searchVO.totRow <= 0}">
    <li>
        검색결과가 없습니다.
    </li>
</c:if>
</ul>
</form>

<div style="width:100%;overflow-y:scroll;text-align: center">
<c:if test="${searchVO.totPage>1}">
    <div>


        <nav aria-label="Page navigation example">
            <ul class="pagination">



                <c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1" varStatus="status">
                    <li class="page-item">
                        <c:choose>
                            <c:when test="${i eq searchVO.page}">
                                <a class="page-link" href="#"
                                   style='color:#f1f1f1;font-weight:800;background-color:#838383'>
                                    <c:out value="${i}" /></a>
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="javascript:fn_list('${searchVO.psn}','${i}');">
                                    <c:out value="${i}" /></a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>


            </ul>
        </nav>

    </div>


    <input type="hidden" name="page" id="page" value="" />
</c:if>
</div>
<script type="text/javascript">
    function fn_list(sn, page) {

        if(page ==''){
            page = 1;
        }
        var ppage = page;
        $.get("/admin/msgList?sn="+sn+"&page="+page , function(data){
            $( "#msgList" ).html( data );
        });
    }
</script>
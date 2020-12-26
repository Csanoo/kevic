<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form name="form2">
<ul>
    <li style="display: flex;justify-content: flex-start">
        <span style="width:50px;">No</span>
        <span>로그인 일시</span>
    </li>
<c:forEach var="loginlist" items="${loginlist}" varStatus="status">

<li style="display: flex;justify-content: flex-start">
    <span style="width:50px;"><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></span>
    <span>${loginlist.wdate}</span>
</li>
</c:forEach>
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
                                <a class="page-link" href="javascript:fn_history('${searchVO.userid}','${i}');">
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
    function fn_history(userid, page) {

        if(page ==''){
            page = 1;
        }
        var ppage = page;
        $.get("/admin/loginList?userid="+userid+"&page="+page , function(data){
            $( "#loginlist" ).html( data );
        });
    }
</script>
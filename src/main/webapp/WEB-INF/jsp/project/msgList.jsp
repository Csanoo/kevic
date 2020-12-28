<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form name="form2">
<div style="display: flex;justify-content: flex-start">
    <div>
    <img src="${projectInfo.imageUrl}" width="140" height="60">
    </div>
    <div style="margin-left:20px">
        <div>
            ${projectInfo.title}
        </div>
        <div>
            <c:if test="${projectInfo.ctSource eq 'YTB'}">유튜브</c:if>
        </div>
    </div>
</div>
<ul style="padding:10px 20px 0 0;margin:10px 0 0 0;border-top:1px solid #CCCCCC;overflow-y: auto;height: 500px;">
    <li style="display: flex;justify-content: flex-start">
        <div></div>
    </li>
<c:forEach var="msglist" items="${msglist}" varStatus="status">

<li style="list-style: none;border-bottom: 1px solid #CCCCCC">
    <div>${msglist.regid} <span aria-hidden="true" class="pull-right" style="cursor:pointer" onclick="deletemsg('${msglist.sn}','${searchVO.psn}','${searchVO.page}')">×</span></div>
    <div>${msglist.msg}</div>
    <div style="font-size:13px;color:#999;">${msglist.regDate}</div>
</li>
    <c:if test="${status.end <= 0}">
        <li style="list-style: none">
            메세지가 없습니다.
        </li>
    </c:if>
</c:forEach>

</ul>
</form>

<div style="width:90%;overflow-x:scroll;text-align: center">
<c:if test="${searchVO.totPage>0}">
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
    function deletemsg(sn,psn,page) {
        $.ajax({
            type: "POST",
            url: "/admin/msgDelete",
            data: "sn=" + sn,
            success: function(jdata){

                if(jdata != 'True') {
                    alert("삭제 오류");
                }else{
                    fn_list(psn, page)
                    $("#msg_" + psn).html(parseInt($("#msg_" + psn).text()) - 1);
                    alert("삭제 성공");

                }
            },
            error: function(data){location.href = "/admin/project";}
        });

    }
</script>
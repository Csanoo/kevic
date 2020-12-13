<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table class="table" id="1depthT">
<tbody>
<c:forEach var="listview" items="${listview}" varStatus="status">
<tr>
<td>
    <input type="hidden" value="${listview.sn}" name="Sn" >
    <input type="hidden" value="${listview.title}" name="title" >
    <input type="hidden" value="${listview.bannerImg}" name="bannerImg" >
    <input type="hidden" value="${listview.iconImg}" name="iconImg" >
    <input type="hidden" value="${listview.adTag}" name="adTag" >
    <input type="hidden" value="${listview.adinfo}" name="adinfo" >
    <input type="hidden" value="${listview.adtime}" name="adinfo" >
        ${listview.title}
</td>
</tr>
</c:forEach>
</tbody>
</table>


<script src="/admin/design/assets/js/dnd.js" type="text/javascript"></script>
<script>
    $(".table").tableDnD({
        onDragClass: "dragRow"
    });
</script>



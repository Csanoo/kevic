<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach var="listview" items="${listview}" varStatus="status">
    <tr>
        <td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
        <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
        <td>${listview.type}</td>
        <td><img src="${listview.imageUrl}" width="110"></td>
        <td><div style="width:150px;word-break:break-all;">${listview.imageUrl}</div></td>
        <td><div style="width:150px;word-break:break-all;"><a href="${listview.videoUrl}" target="_blank">${listview.videoUrl}</a></div></td>
        <td>${listview.ctSource}</td>
        <td class="title" style="display: flex"><input type="text" value="${listview.title}" name="title" readonly style="width:100%"> <button type="button" class="btn btn-modify"  data="${listview.sn}" style="display: none">수정</button></td>
        <td>${listview.keyword}</td>
        <td>
                ${listview.regDate}<br>
                ${listview.userid}
        </td>
        <td>
            <button type="button"  class="btn btn-orange" onclick="delContent(${listview.sn});">삭제</button>
        </td>
    </tr>
</c:forEach>

<c:if test="${searchVO.totRow <= 0}">
    <tr>
        <td colspan="8">검색결과가 없습니다.</td>
    </tr>
</c:if>
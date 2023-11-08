<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach var="listview" items="${listview}" varStatus="status">
    <tr>
        <td ><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
        <td>${listview.regDate}</td>
        <td>${listview.department}</td>
        <td>${listview.hName}</td>
        <td>${listview.corpName}</td>
        <td>${listview.cAgency}</td>
        <td>${listview.ctName}</td>
        <td>${listview.finishChk}</td>
        <td>${listview.gdPrice}</td>
        <td>${listview.cAgency}</td>
        <td>${listview.dwDate}</td>
        <td>${listview.ddDate}</td>
        <td>${listview.proDate}</td>
        <td>${listview.chkDate}</td>
        <td>${listview.chgPriceDate}</td>
        <td>${listview.reqDate}</td>
        <td>${listview.getmDate}</td>
        <td>${listview.payPrice}</td>
        <td>${listview.accDate}</td>
        <td>${listview.draftDate}</td>
    </tr>
</c:forEach>

<c:if test="${searchVO.totRow <= 0}">
    <tr>
        <td colspan="8">검색결과가 없습니다.</td>
    </tr>
</c:if>
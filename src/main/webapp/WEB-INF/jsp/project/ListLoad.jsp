<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach var="listview" items="${listview}" varStatus="status">
    <tr>
        <td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
        <td ><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
        <td>${listview.type}</td>
        <td style="width:150px;">${listview.projectTitle}<br>${listview.category01Title}<br>${listview.category02Title}</td>
        <td><img src="${listview.imageUrl}" width="110"></td>
        <td><div style="width:150px;word-break:break-all;">${listview.imageUrl}</div></td>
        <td><div style="width:150px;word-break:break-all;"><a href="${listview.videoUrl}" target="_blank">${listview.videoUrl}</a></div></td>
        <td>${listview.title}</td>
        <td>${listview.keyword}</td>
        <td>${listview.regDate}<br>${listview.userid}</td>
        <td onClick="javascript:fn_list('${listview.sn}',1)" id="msg_${listview.sn}" data-toggle="modal" data-target="#myModal" ><a>${listview.msgCt}</a></td>
        <td >${listview.like}</td>
        <td ><input type="checkbox" name="suggest" value="${listview.sn}" <c:if test="${listview.suggest eq 'Y'}" >checked </c:if></td>
        <!-- <td>
                                                이동
                                                <input type="hidden" value="${listview.sn}" name="sort">
                                            </td>-->
        <td>
            <button type="button" class="btn btn-orange"  onclick="fn_notPublish(${listview.sn})">X</button>
        </td>
    </tr>
</c:forEach>

<c:if test="${searchVO.totRow <= 0}">
    <tr>
        <td colspan="8">검색결과가 없습니다.</td>
    </tr>
</c:if>
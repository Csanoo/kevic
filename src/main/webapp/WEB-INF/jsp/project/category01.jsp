<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<option value="0">카테고리</option>
    <c:forEach var="listview" items="${listview}" varStatus="status">
        <option value="${listview.category01}" <c:if test="${projectVO.category eq listview.category01}">selected</c:if>>${listview.title}</option>
    </c:forEach>


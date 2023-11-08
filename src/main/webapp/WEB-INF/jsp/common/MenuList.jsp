<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String HEADERURL = request.getRequestURL().toString();
main.java.common.satelite.kr.LeftMenuUtil btr = new main.java.common.satelite.kr.LeftMenuUtil();
//btr.setUserProgram(HEADERURL);
%>



<ul class='wraplist'>
	<c:if test="${menu01 eq 'Y'}">
	<li class="<%=btr.CLASSOPEN(HEADERURL, "project/list")%> <%=btr.CLASSOPEN(HEADERURL, "contents")%> <%=btr.CLASSOPEN(HEADERURL, "excel/Form")%>">
		<a href="javascript:;">
			<i class="fa fa-folder-open"></i> <span class="title">영업지원</span><span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li>
				<a href="/admin/project" class="<%=btr.CLASSACTIVE(HEADERURL, "project/list")%>">
					<span class="title">프로젝트 관리</span>
				</a>
			</li>
		</ul>
	</li>
	</c:if>
	<c:if test="${menu02 eq 'Y'}">
		<li class="<%=btr.CLASSOPEN(HEADERURL, "project/list")%> <%=btr.CLASSOPEN(HEADERURL, "contents")%> <%=btr.CLASSOPEN(HEADERURL, "excel/Form")%>">
			<a href="javascript:;">
				<i class="fa fa-folder-open"></i> <span class="title">설계실</span><span class="arrow "></span>
			</a>
			<ul class="sub-menu">
				<li>
					<a href="/admin/contents" class="<%=btr.CLASSACTIVE(HEADERURL, "contents/list")%>">
						<span class="title">내역서 관리</span>
					</a>
				</li>
			</ul>
		</li>
	</c:if>
	<c:if test="${USERTYPE eq 'SA'}">
	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Member")%> <%=btr.CLASSOPEN(HEADERURL, "member1/Register")%> <%=btr.CLASSOPEN(HEADERURL, "member1/usertypelist")%>">

		<a href="javascript:;"> <i
				class="fa fa-folder-open"></i> <span class="title">환경설정</span>
			<span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li><a href="/admin/memberList"	class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Member")%>"> <span class="title">관리자 계정 관리</span></a></li>
			<li><a href="/admin/regist"	class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Register")%>"> <span class="title">관리자 계정 등록</span>	</a></li>
		</ul>
	</li>
	</c:if>
</ul>
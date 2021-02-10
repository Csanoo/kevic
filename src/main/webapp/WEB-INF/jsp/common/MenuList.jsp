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
			<i class="fa fa-folder-open"></i> <span class="title">컨텐츠 관리</span><span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li>
				<a href="/admin/project" class="<%=btr.CLASSACTIVE(HEADERURL, "project/list")%>">
					<span class="title">프로젝트 컨텐츠 관리</span>
				</a>
			</li>
			<li>
				<a href="/admin/contents" class="<%=btr.CLASSACTIVE(HEADERURL, "contents")%>">
					<span class="title">기본 컨텐츠 관리</span>
				</a>
			</li>
			<li>
				<a href="/admin/excelForm" class="<%=btr.CLASSACTIVE(HEADERURL, "excel/Form")%>">
					<span class="title">컨텐츠 엑셀 등록 </span>
				</a>
			</li>
		</ul>
	</li>
	</c:if>
	<c:if test="${menu02 eq 'Y'}">
	<li class="<%=btr.CLASSOPEN(HEADERURL, "PostsList")%>  <%=btr.CLASSOPEN(HEADERURL, "appmain/AppMain1List")%> <%=btr.CLASSOPEN(HEADERURL, "appmain1Form")%><%=btr.CLASSOPEN(HEADERURL, "BannerList")%><%=btr.CLASSOPEN(HEADERURL, "banner/BannerForm")%>">
		<a href="javascript:;"> <i class="fa fa-folder-open"></i>
			<span class="title">운영 관리</span> <span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<!--li>
				<a href="/admin/PostList" class="<%=btr.CLASSACTIVE(HEADERURL, "posts/PostsList")%>">
					<span class="title">공지사항-알림</span>
				</a>
			</li-->
			<li><a href="/admin/AppMain1" class="<%=btr.CLASSACTIVE(HEADERURL, "appmain/AppMain1List")%>"> <span class="title">팝업 관리</span></a></li>
			<li><a href="/admin/appmain1Form" class="<%=btr.CLASSACTIVE(HEADERURL, "appmain/AppMain1Form")%>"> <span class="title">팝업 등록</span></a></li>
			<li><a href="/admin/BannerList"	class="<%=btr.CLASSACTIVE(HEADERURL, "BannerList")%>"> <span
					class="title">프로젝트 배너관리</span>
			</a></li>
			<li><a href="/admin/bannerForm" class="<%=btr.CLASSACTIVE(HEADERURL, "banner/BannerForm")%>"> <span
					class="title">프로젝트 배너등록</span>
			</a></li>
		</ul>
	</li>
	</c:if>
	<c:if test="${menu03 eq 'Y'}">
	<li class="<%=btr.CLASSOPEN(HEADERURL, "posts/ytbForm")%> <%=btr.CLASSOPEN(HEADERURL, "codeList")%> <%=btr.CLASSOPEN(HEADERURL, "reserveForm")%> <%=btr.CLASSOPEN(HEADERURL, "rssReg")%>">
		<a	href="javascript:;"> <i class="fa fa-folder-open"></i>
			<span class="title">크롤링 관리</span> <span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li><a href="/admin/ytbForm" class="<%=btr.CLASSACTIVE(HEADERURL, "ytbForm")%>"> <span class="title">크롤링</span></a></li>
			<li><a href="/admin/reserveForm" class="<%=btr.CLASSACTIVE(HEADERURL, "reserveForm")%>"> <span class="title">크롤링 예약</span></a></li>
			<li><a href="/admin/rssReg" class="<%=btr.CLASSACTIVE(HEADERURL, "rssReg")%>"> <span class="title">rss주소 관리</span></a></li>
			<li><a href="/admin/codeList" class="<%=btr.CLASSACTIVE(HEADERURL, "codeList")%>"> <span class="title">코드목록</span></a></li>
		</ul>
	</li>
	</c:if>
	<c:if test="${menu04 eq 'Y'}">
	<li class="<%=btr.CLASSOPEN(HEADERURL, "project/projectList")%><%=btr.CLASSOPEN(HEADERURL, "project/projectForm")%>">

		<a	href="javascript:;"> <i class="fa fa-folder-open"></i>
			<span class="title">프로젝트 관리</span> <span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li><a href="/admin/projectList" class="<%=btr.CLASSACTIVE(HEADERURL, "project/projectList")%>"> <span class="title">프로젝트 목록</span></a></li>
			<li><a href="/admin/projectReg" class="<%=btr.CLASSACTIVE(HEADERURL, "project/projectForm")%>"> <span class="title">프로젝트 등록</span></a></li>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class=" ">
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<title>Motiva Admin : Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="" name="description" />
<meta content="" name="author" />

<link rel="shortcut icon" href="/admin/design/assets/images/favicon.png"
	type="image/x-icon" />
<!-- Favicon -->
<link rel="apple-touch-icon-precomposed"
	href="/admin/design/assets/images/apple-touch-icon-57-precomposed.png">
<!-- For iPhone -->
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/admin/design/assets/images/apple-touch-icon-114-precomposed.png">
<!-- For iPhone 4 Retina display -->
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/admin/design/assets/images/apple-touch-icon-72-precomposed.png">
<!-- For iPad -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/admin/design/assets/images/apple-touch-icon-144-precomposed.png">
<!-- For iPad Retina display -->




<!-- CORE CSS FRAMEWORK - START -->
<link href="/admin/design/assets/plugins/pace/pace-theme-flash.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="/admin/design/assets/plugins/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link href="/admin/design/assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />
<link href="/admin/design/assets/css/animate.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="/admin/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" type="text/css" />
<!-- CORE CSS FRAMEWORK - END -->

<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
<link href="/admin/design/assets/plugins/morris-chart/css/morris.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="/admin/design/assets/plugins/jquery-ui/smoothness/jquery-ui.min.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/graph.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/detail.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/legend.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/extensions.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/rickshaw.min.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/rickshaw-chart/css/lines.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="/admin/design/assets/plugins/jvectormap/jquery-jvectormap-2.0.1.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="/admin/design/assets/plugins/icheck/skins/minimal/white.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->


<!-- CORE CSS TEMPLATE - START -->
<link href="/admin/design/assets/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/admin/design/assets/css/responsive.css" rel="stylesheet"
	type="text/css" />
<!-- CORE CSS TEMPLATE - END -->

<style>

a[href*="http"] {
  background: url('https://mdn.mozillademos.org/files/12982/external-link-52.png') no-repeat 100% 0;
  background-size: 16px 16px;
  padding-right: 19px;
}

a:link {
  text-decoration: none;
  font-weight:700;
  cursor: pointer;
}

a:visited {
  text-decoration: none;
  font-weight:700;
  cursor: pointer;
}

a:hover {
  text-decoration: underline;
  background-color: #e9e9ff;
  cursor: pointer;
}

a:active {
  text-decoration: underline;
  font-weight:700;
  background-color: #e9e9ff;
  cursor: pointer;
}
</style>
<style>
#customers {
	font-family: Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #888888;
	padding: 8px;
}

.tdl {
	background-color: #e3e3e3;
	color: #424242;
}

table{font-size:14px}
</style>

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body >


	<!-- START TOPBAR -->
	<div class='page-topbar '>
		<div class='logo-area'></div>
		<div class='quick-area'>
			<div class='pull-left'>
				<ul class="info-menu left-links list-inline list-unstyled">
					<li class="sidebar-toggle-wrap"><a href="#"
						data-toggle="sidebar" class="sidebar_toggle"> <i
							class="fa fa-bars"></i>
					</a></li>
					<li class=""><a href="#" data-toggle="dropdown" class="toggle">
							<i class="fa fa-envelope"></i> <span class="badge badge-primary">7</span>
					</a>
						<ul class="dropdown-menu messages animated fadeIn">

							<li class="list">

								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<li class="unread status-available"><a href="javascript:;">
											<div>자
												<span class="name"> <strong>관리</strong> <span
													class="time small">- 15 mins ago</span> <span
													class="profile-status available pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-away"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-2.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Brooks Latshaw</strong> <span
													class="time small">- 45 mins ago</span> <span
													class="profile-status away pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-busy"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-3.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Clementina
														Brodeur</strong> <span class="time small">- 1 hour ago</span> <span
													class="profile-status busy pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-offline"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-4.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Carri Busey</strong> <span
													class="time small">- 5 hours ago</span> <span
													class="profile-status offline pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-offline"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-5.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Melissa Dock</strong> <span
													class="time small">- Yesterday</span> <span
													class="profile-status offline pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-available"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-1.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Verdell Rea</strong> <span
													class="time small">- 14th Mar</span> <span
													class="profile-status available pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-busy"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-2.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Linette Lheureux</strong>
													<span class="time small">- 16th Mar</span> <span
													class="profile-status busy pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-away"><a href="javascript:;">
											<div class="user-img">
												<img src="/design/data/profile/avatar-3.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Araceli
														Boatright</strong> <span class="time small">- 16th Mar</span> <span
													class="profile-status away pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>

								</ul>

							</li>

							<li class="external"><a href="javascript:;"> <span>Read
										All Messages</span>
							</a></li>
						</ul></li>
					<li class=""><a href="#" data-toggle="dropdown" class="toggle">
							<i class="fa fa-bell"></i> <span class="badge badge-orange">3</span>
					</a>
						<ul class="dropdown-menu notifications animated fadeIn">
							<li class="total"><span class="small"> You have <strong>3</strong>
									new notifications. <a href="javascript:;" class="pull-right">Mark
										all as Read</a>
							</span></li>
							<li class="list">

								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<li class="unread available">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-check"></i>
											</div>
											<div>
												<span class="name"> <strong>Server needs to
														reboot</strong> <span class="time small">15 mins ago</span>
												</span>
											</div>
									</a>
									</li>
									<li class="unread away">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-envelope"></i>
											</div>
											<div>
												<span class="name"> <strong>45 new messages</strong>
													<span class="time small">45 mins ago</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" busy">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-times"></i>
											</div>
											<div>
												<span class="name"> <strong>Server IP
														Blocked</strong> <span class="time small">1 hour ago</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" offline">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-user"></i>
											</div>
											<div>
												<span class="name"> <strong>10 Orders
														Shipped</strong> <span class="time small">5 hours ago</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" offline">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-user"></i>
											</div>
											<div>
												<span class="name"> <strong>New Comment on
														blog</strong> <span class="time small">Yesterday</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" available">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-check"></i>
											</div>
											<div>
												<span class="name"> <strong>Great Speed
														Notify</strong> <span class="time small">14th Mar</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" busy">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-times"></i>
											</div>
											<div>
												<span class="name"> <strong>Team Meeting at
														6PM</strong> <span class="time small">16th Mar</span>
												</span>
											</div>
									</a>
									</li>

								</ul>

							</li>

							<li class="external"><a href="javascript:;"> <span>Read
										All Notifications</span>
							</a></li>
						</ul></li>
					<li class="hidden-sm hidden-xs searchform">
						<div class="input-group">
							<span class="input-group-addon input-focus"> <i
								class="fa fa-search"></i>
							</span>
							<form action="search-page.html" method="post">
								<input type="text" class="form-control animated fadeIn"
									placeholder="Search & Enter"> <input type='submit'
									value="">
							</form>
						</div>
					</li>
				</ul>
			</div>
			<div class='pull-right'>
				<ul class="info-menu right-links list-inline list-unstyled">
					<li class="profile"><a href="#" data-toggle="dropdown"
						class="toggle"> <img src="/design/data/profile/profile.png"
							alt="user-image" class="img-circle img-inline"> <span>Jason
								Bourne <i class="fa fa-angle-down"></i>
						</span>
					</a>
						<ul class="dropdown-menu profile animated fadeIn">
							<li><a href="#settings"> <i class="fa fa-wrench"></i>
									Settings
							</a></li>
							<li><a href="#profile"> <i class="fa fa-user"></i>
									Profile
							</a></li>
							<li><a href="#help"> <i class="fa fa-info"></i> Help
							</a></li>
							<li class="last"><a href="/admin/logout"> <i
									class="fa fa-lock"></i> Logout
							</a></li>
						</ul></li>
					<li class="chat-toggle-wrapper"><a href="#"
						data-toggle="chatbar" class="toggle_chat"> <i
							class="fa fa-comments"></i> <span class="badge badge-warning">9</span>
					</a></li>
				</ul>
			</div>
		</div>

	</div>
	<!-- END TOPBAR -->
	<!-- START CONTAINER -->
	<div class="page-container row-fluid">

		<!-- SIDEBAR - START -->
		<div class="page-sidebar ">


			<!-- MAIN MENU - START -->
			<div class="page-sidebar-wrapper" id="main-menu-wrapper">

				<!-- USER INFO - START -->
				<div class="profile-info row">

					<div class="profile-image col-md-4 col-sm-4 col-xs-4">
						<a href="ui-profile.html"> <img src="/design/data/profile/profile.png"
							class="img-responsive img-circle">
						</a>
					</div>

					<div class="profile-details col-md-8 col-sm-8 col-xs-8">

						<h3>
							<a href="ui-profile.html">Jason Bourne</a>

							<!-- Available statuses: online, idle, busy, away and offline -->
							<span class="profile-status online"></span>
						</h3>

						<p class="profile-title">Web Developer</p>

					</div>

				</div>
				<!-- USER INFO - END -->



				<jsp:include page="/WEB-INF/jsp/common/MenuList.jsp" />

			</div>
			<!-- MAIN MENU - END -->



			<div class="project-info">

				<div class="block1">
					<div class="data">
						<span class='title'>New&nbsp;Orders</span> <span class='total'>2,345</span>
					</div>
					<div class="graph">
						<span class="sidebar_orders">...</span>
					</div>
				</div>

				<div class="block2">
					<div class="data">
						<span class='title'>Visitors</span> <span class='total'>345</span>
					</div>
					<div class="graph">
						<span class="sidebar_visitors">...</span>
					</div>
				</div>

			</div>



		</div>
		<!--  SIDEBAR - END -->
		<!-- START CONTENT -->
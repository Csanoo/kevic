<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class=" ">
    <head>

        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta charset="utf-8" />
        <title>Kevic office</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="" name="description" />
        <meta content="" name="author" />

        <link rel="shortcut icon" href="/admin/design/assets/images/favicon.png" type="image/x-icon" />    <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" href="/admin/design/assets/images/apple-touch-icon-57-precomposed.png">	<!-- For iPhone -->
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/admin/design/assets/images/apple-touch-icon-114-precomposed.png">    <!-- For iPhone 4 Retina display -->
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/admin/design/assets/images/apple-touch-icon-72-precomposed.png">    <!-- For iPad -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/admin/design/assets/images/apple-touch-icon-144-precomposed.png">    <!-- For iPad Retina display -->




        <!-- CORE CSS FRAMEWORK - START -->
        <link href="/admin/design/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="/admin/design/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="/admin/design/assets/plugins/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="/admin/design/assets/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="/admin/design/assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="/admin/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" type="text/css"/>

        <link href="/admin/design/assets/plugins/timepicker/css/timepicker.css" rel="stylesheet" type="text/css" />
        <link href="/admin/design/assets/plugins/datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="/admin/design/assets/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css" />
        <!-- CORE CSS FRAMEWORK - END -->

        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 


        <!-- CORE CSS TEMPLATE - START -->
        <link href="/admin/design/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="/admin/design/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
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
            <div class='logo-area2'>

            </div>
            <div class='quick-area'>
                <div class='pull-left'>
                    <ul class="info-menu left-links list-inline list-unstyled">
                        <li class="sidebar-toggle-wrap">
                            <a href="#" data-toggle="sidebar" class="sidebar_toggle">
                                <i class="fa fa-bars"></i>
                            </a>
                        </li>
                    </ul>
                </div>		
                <div class='pull-right'>
                    <ul class="info-menu right-links list-inline list-unstyled">
                        <li class="profile">
                            <a href="#" data-toggle="dropdown" class="toggle">
                                <span>관리<i class="fa fa-angle-down"></i></span>
                            </a>
                            <ul class="dropdown-menu profile animated fadeIn">
                                <li class="last">
                                    <a href="/admin/logout">
                                        <i class="fa fa-lock"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li style="width:50px;">

                        </li>
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

                        <div class="profile-details col-md-8 col-sm-8 col-xs-8">

                            <h3>
                                관리

                                <!-- Available statuses: online, idle, busy, away and offline -->

                            </h3>


                            <p class="profile-title"> ${session.UTYPE}</p>

                        </div>

                    </div>
                    <!-- USER INFO - END -->



                    <jsp:include page="/WEB-INF/jsp/common/MenuList.jsp" />

                </div>
                <!-- MAIN MENU - END -->
            </div>
            <!--  SIDEBAR - END -->
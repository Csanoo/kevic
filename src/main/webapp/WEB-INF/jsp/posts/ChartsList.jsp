<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />



<form id="form1" name="form1" method="post">
	<input type="hidden" name="orderKeyword" id="orderKeyword"
		value="${searchVO.orderKeyword}" /> 
		
		<input type="hidden" name="sn"
		id="sn" value="" /> 
		
		<input type="hidden" name="srch" id="srch"
		value="SRCH" />

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">Charts List</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Last 7 days Device chart ( PC / Mobile )</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    
                            
                            <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <canvas id="bar-chartjs" height="450" width="600"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Last 7 days Unique Visit IP Address chart</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <canvas id="line-chartjs" height="450" width="600"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>


                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Donut chart</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                                        <canvas id="donut-chartjs" width="400" height="400"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Pie chart</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-8 col-sm-8 col-xs-8 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                                        <canvas id="pie-chartjs" width="300" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>

                    <div class="clearfix"></div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Polar chart</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-10 col-sm-10 col-xs-10 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                                        <canvas id="polar-chartjs" width="300" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>			

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Radar chart</h2>
                                <div class="actions panel_actions pull-right">
                                    <i class="box_toggle fa fa-chevron-down"></i>
                                    <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                                    <i class="box_close fa fa-times"></i>
                                </div>
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-10 col-sm-10 col-xs-10 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                                        <canvas id="radar-chartjs" width="300" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </section></div>
		</section>
	</section>


</form>






<div class="page-chatapi hideit">

                <div class="search-bar">
                    <input type="text" placeholder="Search" class="form-control">
                </div>

                <div class="chat-wrapper">
                    <h4 class="group-head">Groups</h4>
                    <ul class="group-list list-unstyled">
                        <li class="group-row">
                            <div class="group-status available">
                                <i class="fa fa-circle"></i>
                            </div>
                            <div class="group-info">
                                <h4><a href="#">Work</a></h4>
                            </div>
                        </li>
                        <li class="group-row">
                            <div class="group-status away">
                                <i class="fa fa-circle"></i>
                            </div>
                            <div class="group-info">
                                <h4><a href="#">Friends</a></h4>
                            </div>
                        </li>

                    </ul>


                    <h4 class="group-head">Favourites</h4>
                    <ul class="contact-list">

                        <li class="user-row" id='chat_user_1' data-user-id='1'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-1.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Clarine Vassar</a></h4>
                                <span class="status available" data-status="available"> Available</span>
                            </div>
                            <div class="user-status available">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_2' data-user-id='2'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-2.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Brooks Latshaw</a></h4>
                                <span class="status away" data-status="away"> Away</span>
                            </div>
                            <div class="user-status away">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_3' data-user-id='3'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-3.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Clementina Brodeur</a></h4>
                                <span class="status busy" data-status="busy"> Busy</span>
                            </div>
                            <div class="user-status busy">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>

                    </ul>


                    <h4 class="group-head">More Contacts</h4>
                    <ul class="contact-list">

                        <li class="user-row" id='chat_user_4' data-user-id='4'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-4.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Carri Busey</a></h4>
                                <span class="status offline" data-status="offline"> Offline</span>
                            </div>
                            <div class="user-status offline">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_5' data-user-id='5'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-5.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Melissa Dock</a></h4>
                                <span class="status offline" data-status="offline"> Offline</span>
                            </div>
                            <div class="user-status offline">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_6' data-user-id='6'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-1.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Verdell Rea</a></h4>
                                <span class="status available" data-status="available"> Available</span>
                            </div>
                            <div class="user-status available">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_7' data-user-id='7'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-2.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Linette Lheureux</a></h4>
                                <span class="status busy" data-status="busy"> Busy</span>
                            </div>
                            <div class="user-status busy">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_8' data-user-id='8'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-3.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Araceli Boatright</a></h4>
                                <span class="status away" data-status="away"> Away</span>
                            </div>
                            <div class="user-status away">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_9' data-user-id='9'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-4.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Clay Peskin</a></h4>
                                <span class="status busy" data-status="busy"> Busy</span>
                            </div>
                            <div class="user-status busy">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_10' data-user-id='10'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-5.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Loni Tindall</a></h4>
                                <span class="status away" data-status="away"> Away</span>
                            </div>
                            <div class="user-status away">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_11' data-user-id='11'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-1.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Tanisha Kimbro</a></h4>
                                <span class="status idle" data-status="idle"> Idle</span>
                            </div>
                            <div class="user-status idle">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>
                        <li class="user-row" id='chat_user_12' data-user-id='12'>
                            <div class="user-img">
                                <a href="#"><img src="/design/data/profile/avatar-2.png" alt=""></a>
                            </div>
                            <div class="user-info">
                                <h4><a href="#">Jovita Tisdale</a></h4>
                                <span class="status idle" data-status="idle"> Idle</span>
                            </div>
                            <div class="user-status idle">
                                <i class="fa fa-circle"></i>
                            </div>
                        </li>

                    </ul>
                </div>

            </div>


            <div class="chatapi-windows ">


            </div>    </div>
        <!-- END CONTAINER -->
        <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->

<script>
function winpopup(_a,_b){
window.open("/player.jsp?_a="+_a+"&_b="+_b, "_blank", "toolbar=no,scrollbars=no,resizable=no,left=0,top=0,fullscreen=yes");
}	
</script>

<script>
function winpopup2(_a,_b){
window.open("/player2.jsp?_a="+_a+"&_b="+_b, "_blank", "toolbar=no,scrollbars=no,resizable=no,left=0,top=0,fullscreen=yes");
}	
</script>

        <!-- CORE JS FRAMEWORK - START --> 
        <script src="/design/assets/js/jquery-1.11.2.min.js" type="text/javascript"></script> 
        <script src="/design/assets/js/jquery.easing.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/pace/pace.min.js" type="text/javascript"></script>  
        <script src="/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/viewport/viewportchecker.js" type="text/javascript"></script>  
        <!-- CORE JS FRAMEWORK - END --> 


        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <script src="/design/assets/plugins/chartjs-chart/Chart.min.js" type="text/javascript"></script>
        <script  type="text/javascript">
        jQuery(function($) {

            'use strict';

            var ULTRA_SETTINGS = window.ULTRA_SETTINGS || {};

            /*--------------------------------
                Chart Js Chart
             --------------------------------*/
            ULTRA_SETTINGS.chartJS = function() {



                /*Bar Chart*/
                var randomScalingFactor = function() {
                    return Math.round(Math.random() * 100)
                };

                var barChartData = {
                    labels: [
                    	<c:forEach var="listbarchart" items="${listbarchart}" varStatus="status">
                    	"${listbarchart.wdate1}",
                    	</c:forEach>
                    	],
                    datasets: [{
                    	label : "Windows",
                    	fillColor: "rgba(31,181,172,1)",
                        strokeColor: "rgba(31,181,172,0.8)",
                        highlightFill: "rgba(31,181,172,0.8)",
                        highlightStroke: "rgba(31,181,172,1)",
                        data: [
                        	
                        	<c:forEach var="listbarchart" items="${listbarchart}" varStatus="status">
                        	"${listbarchart.wcnt}",
                        	</c:forEach>
                        	
                        	]
                    }, {
                    	label : "Mobile",
                        fillColor: "rgba(153,114,181,1.0)",
                        strokeColor: "rgba(153,114,181,0.8)",
                        highlightFill: "rgba(153,114,181,0.8)",
                        highlightStroke: "rgba(153,114,181,1.0)",
                        data: [
                        	
                        	<c:forEach var="listbarchart" items="${listbarchart}" varStatus="status">
								"${listbarchart.lcnt}",
                        	</c:forEach>
                        	
                        	]
                    }]

                }

                var ctxb = document.getElementById("bar-chartjs").getContext("2d");
                window.myBar = new Chart(ctxb).Bar(barChartData, {
                    responsive: true
                });


                /*Line Chart*/

                var randomScalingFactor = function() {
                    return Math.round(Math.random() * 100)
                };
                var lineChartData = {
                    labels: [<c:forEach var="listlinechart" items="${listlinechart}" varStatus="status">
                	"${listlinechart.wdate}",
                	</c:forEach>],
                    datasets: [{
                        label: "Visit IP Address Count",
                        fillColor: "rgba(31,181,172,0.5)",
                        strokeColor: "rgba(31,181,172,1)",
                        pointColor: "rgba(31,181,172,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(31,181,172,1)",
                        data: [
                        	<c:forEach var="listlinechart" items="${listlinechart}" varStatus="status">
                        	"${listlinechart.vcnt}",
                        	</c:forEach> ]
                    }]

                }

                var ctx = document.getElementById("line-chartjs").getContext("2d");
                window.myLine = new Chart(ctx).Line(lineChartData, {
                    responsive: true
                });




                /*PIE Chart*/


                var pieData = [{
                        value: 300,
                        color: "rgba(250,133,100,1.0)",
                        highlight: "rgba(250,133,100,0.8)",
                        label: "Orange"
                    }, {
                        value: 150,
                        color: "rgba(31,181,172,1)",
                        highlight: "rgba(31,181,172,0.8)",
                        label: "Primary"
                    }, {
                        value: 50,
                        color: "#FDB45C",
                        highlight: "#FFC870",
                        label: "Yellow"
                    }, {
                        value: 120,
                        color: "rgba(153,114,181,1.0)",
                        highlight: "rgba(153,114,181,0.8)",
                        label: "Purple"
                    }

                ];

                var ctx = document.getElementById("pie-chartjs").getContext("2d");
                window.myPie = new Chart(ctx).Pie(pieData);




                /* Donut Chart*/

                var doughnutData = [{
                        value: 300,
                        color: "rgba(250,133,100,1.0)",
                        highlight: "rgba(250,133,100,0.8)",
                        label: "Orange"
                    }, {
                        value: 150,
                        color: "rgba(31,181,172,1)",
                        highlight: "rgba(31,181,172,0.8)",
                        label: "Primary"
                    }, {
                        value: 50,
                        color: "#FDB45C",
                        highlight: "#FFC870",
                        label: "Yellow"
                    }, {
                        value: 120,
                        color: "rgba(153,114,181,1.0)",
                        highlight: "rgba(153,114,181,0.8)",
                        label: "Purple"
                    }

                ];

                var ctxd = document.getElementById("donut-chartjs").getContext("2d");
                window.myDoughnut = new Chart(ctxd).Doughnut(doughnutData, {
                    responsive: true
                });





                /*Polar Chart*/

                var polarData = [{
                        value: 300,
                        color: "rgba(250,133,100,1.0)",
                        highlight: "rgba(250,133,100,0.8)",
                        label: "Orange"
                    }, {
                        value: 150,
                        color: "rgba(31,181,172,1)",
                        highlight: "rgba(31,181,172,0.8)",
                        label: "Primary"
                    }, {
                        value: 50,
                        color: "#FDB45C",
                        highlight: "#FFC870",
                        label: "Yellow"
                    }, {
                        value: 120,
                        color: "rgba(153,114,181,1.0)",
                        highlight: "rgba(153,114,181,0.8)",
                        label: "Purple"
                    }

                ];

                var ctxp = document.getElementById("polar-chartjs").getContext("2d");
                window.myPolarArea = new Chart(ctxp).PolarArea(polarData, {
                    responsive: true
                });









                /*Radar Chart*/
                var radarChartData = {
                    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
                    datasets: [{
                        label: "My First dataset",
                        fillColor: "rgba(31,181,172,0.4)",
                        strokeColor: "rgba(31,181,172,1)",
                        pointColor: "rgba(31,181,172,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(31,181,172,1)",
                        data: [65, 59, 90, 81, 56, 55, 40]
                    }, {
                        label: "My Second dataset",
                        fillColor: "rgba(153,114,181,0.4)",
                        strokeColor: "rgba(153,114,181,1.0)",
                        pointColor: "rgba(153,114,181,1.0)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(153,114,181,1.0)",
                        data: [28, 48, 40, 19, 96, 27, 100]
                    }]
                };

                window.myRadar = new Chart(document.getElementById("radar-chartjs").getContext("2d")).Radar(radarChartData, {
                    responsive: true
                });


            };






            /******************************
             initialize respective scripts 
             *****************************/
            $(document).ready(function() {});

            $(window).resize(function() {});

            $(window).load(function() {
                ULTRA_SETTINGS.chartJS();
            });

        });       
        
        
        </script>
        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 




        <!-- CORE TEMPLATE JS - START --> 
        <script src="/design/assets/js/scripts.js" type="text/javascript"></script> 
        <!-- END CORE TEMPLATE JS - END --> 

        <!-- Sidebar Graph - START --> 
        <script src="/design/assets/plugins/sparkline-chart/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="/design/assets/js/chart-sparkline.js" type="text/javascript"></script>
        <!-- Sidebar Graph - END --> 




        <!-- General section box modal start -->
        <div class="modal" id="section-settings" tabindex="-1" role="dialog" aria-labelledby="ultraModal-Label" aria-hidden="true">
            <div class="modal-dialog animated bounceInDown">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Section Settings</h4>
                    </div>
                    <div class="modal-body">

                        Body goes here...

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                        <button class="btn btn-success" type="button">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal end -->
    </body>
</html>

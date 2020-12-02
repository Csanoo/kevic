<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class=" ">
    <head>
 
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta charset="utf-8" />
        <title>Motiva Admin : Registration Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="" name="description" />
        <meta content="" name="author" />

        <link rel="shortcut icon" href="/design/assets/images/favicon.png" type="image/x-icon" />    <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" href="/design/assets/images/apple-touch-icon-57-precomposed.png">	<!-- For iPhone -->
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/design/assets/images/apple-touch-icon-114-precomposed.png">    <!-- For iPhone 4 Retina display -->
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/design/assets/images/apple-touch-icon-72-precomposed.png">    <!-- For iPad -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/design/assets/images/apple-touch-icon-144-precomposed.png">    <!-- For iPad Retina display -->




        <!-- CORE CSS FRAMEWORK - START -->
        <link href="/design/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="/design/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="/design/assets/plugins/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="/design/assets/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="/design/assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS FRAMEWORK - END -->

        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <link href="/design/assets/plugins/icheck/skins/square/orange.css" rel="stylesheet" type="text/css" media="screen"/>        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 


        <!-- CORE CSS TEMPLATE - START -->
        <link href="/design/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="/design/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS TEMPLATE - END -->

    </head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body class=" login_page">


        <div class="register-wrapper">
            <div id="register" class="login loginpage col-lg-offset-4 col-lg-4 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-2 col-xs-8">
                <h1><a href="#" title="Login Page" tabindex="-1">Motiva Admin Regist</a></h1>

                <form name="loginform" id="loginform" action="regist2" method="post" autocomplete="off">
                    <p>
                        <label for="user_login">User ID<br />
                            <input autocomplete="off" placeholder="ID" type="text" name="userid" id="userid" 
                            class="input" value="" size="20" /></label>
                    </p>
                    <p>
                        <label for="user_pass">Password<br />
                            <input autocomplete="off" placeholder="PassWord" type="password" name="userpw" id="userpw" 
                            class="input" value="" size="20" /></label>
                    </p>
                    <p>
                        <label for="user_pass">Confirm Password<br />
                            <input type="password" name="userpw1" id="userpw1" class="input" value="" size="20" /></label>
                    </p>
                    
                    <p>
                        <label for="user_login">UserName<br />
                            <input autocomplete="off" placeholder="ID" type="text" name="username" id="username" 
                            class="input" value="" size="20" /></label>
                    </p>
                    
                    <p>
                        <label for="user_login">Mobile Phone<br />
                            <input type="text" name="mobile" id="mobile" class="input" value="" size="20" /></label>
                    </p>
                    <p>
                        <label for="user_login">Email<br />
                            <input type="text" name="email" id="email" class="input" value="" size="20" /></label>
                    </p>
                    
                    <p class="forgetmenot">
                        <label class="icheck-label form-label" for="rememberme">
                        <input name="rememberme" type="checkbox" id="rememberme" value="forever" class="skin-square-orange" checked> I agree to terms to conditions</label>
                    </p>



                    <p class="submit">
                        <input type="button" name="wp-submit" id="wp-submit" 
                        class="btn btn-orange btn-block" value="Sign Up" onclick="fn_chksave()" />
                    </p>
                </form>
				
				
				<script>
				function fn_chksave(){
					var f = document.loginform;
					if ( f.userid.value == "" || f.userpw.value == "" || f.userpw1.value == "" || f.username.value == ""
					|| f.mobile.value == "" || f.email.value == "" ) {
						alert("필수 정보 모두 입력 바랍니다.");
					}else{
						if ( f.userpw.value != f.userpw1.value ) {
							alert("비번 확인 바랍니다.");
						} else {
							
							f.submit();
						}
					}
				}
				</script>
				

                <p id="nav">
                    <a class="pull-left" href="#" title="Password Lost and Found">Forgot password?</a>
                    <a class="pull-right" href="login" title="Sign Up">Sign In</a>
                </p>
                <div class="clearfix"></div>
                <div class="col-md-12 text-center register-social">

                    <a href="#" class="btn btn-primary btn-lg facebook"><i class="fa fa-facebook icon-sm"></i></a>
                    <a href="#" class="btn btn-primary btn-lg twitter"><i class="fa fa-twitter icon-sm"></i></a>
                    <a href="#" class="btn btn-primary btn-lg google-plus"><i class="fa fa-google-plus icon-sm"></i></a>
                    <a href="#" class="btn btn-primary btn-lg dribbble"><i class="fa fa-dribbble icon-sm"></i></a>

                </div>

            </div>
        </div>





        <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->


        <!-- CORE JS FRAMEWORK - START --> 
        <script src="/design/assets/js/jquery-1.11.2.min.js" type="text/javascript"></script> 
        <script src="/design/assets/js/jquery.easing.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/pace/pace.min.js" type="text/javascript"></script>  
        <script src="/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js" type="text/javascript"></script> 
        <script src="/design/assets/plugins/viewport/viewportchecker.js" type="text/javascript"></script>  
        <!-- CORE JS FRAMEWORK - END --> 


        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <script src="/design/assets/plugins/icheck/icheck.min.js" type="text/javascript"></script><!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 


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




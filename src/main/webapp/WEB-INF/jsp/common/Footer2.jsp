<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


        <!-- END CONTAINER -->
        <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->

<script>
function winpopup(_a,_b){
window.open("/player.jsp?_a="+_a+"&_b="+_b, "_blank", "toolbar=no,scrollbars=no,resizable=no,left=0,top=0,width=1280,height=720");
}	
</script>

<script>
function winpopup2(_a,_b){
window.open("/player2.jsp?_a="+_a+"&_b="+_b, "_blank", "toolbar=no,scrollbars=no,resizable=no,left=0,top=0,width=1280,height=720");
}	
</script>

        <!-- CORE JS FRAMEWORK - START --> 
        <script src="/admin/design/assets/js/jquery-1.11.2.min.js" type="text/javascript"></script> 
        <script src="/admin/design/assets/js/jquery.easing.min.js" type="text/javascript"></script>
        <script src="/admin/design/assets/js/dnd.js" type="text/javascript"></script>
        <script src="/admin/design/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/admin/design/assets/plugins/pace/pace.min.js" type="text/javascript"></script>  
        <script src="/admin/design/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js" type="text/javascript"></script> 
        <script src="/admin/design/assets/plugins/viewport/viewportchecker.js" type="text/javascript"></script>
        <script src="/admin/design/assets/plugins/timepicker/js/timepicker.js" type="text/javascript"></script>
        <script src="/admin/design/assets/plugins/datepicker/js/datepicker.js" type="text/javascript"></script>
        <script src="/admin/design/assets/plugins/datetimepicker/js/datetimepicker.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- CORE JS FRAMEWORK - END -->







        <!-- CORE TEMPLATE JS - START --> 
        <script src="/admin/design/assets/js/scripts.js" type="text/javascript"></script> 
        <!-- END CORE TEMPLATE JS - END --> 

        <!-- Sidebar Graph - START --> 
        <script src="/admin/design/assets/plugins/sparkline-chart/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="/admin/design/assets/js/chart-sparkline.js" type="text/javascript"></script>
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
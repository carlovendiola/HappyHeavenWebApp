<%@ include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Trip Assist</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="resources/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="resources/css/morris.css" rel="stylesheet">
    
    <link rel="stylesheet" href="resources/css/happyheaven.css" />
    
    

    <!-- Custom Fonts -->
    <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
		<!-- Bootstrap Core JavaScript -->
		<script src="resources/js/bootstrap.min.js"></script>
		
		<!-- Metis Menu Plugin JavaScript -->
		<script src="resources/js/metisMenu.min.js"></script>
		
		<!-- Custom Theme JavaScript -->
		<script src="resources/js/startmin.js"></script>
		
		<script src="resources/js/happyheaven.js"></script>
		
		<script type="text/javascript">
		
		function addTripPopup(){
			window.open("addTripPopup.html", "Add Trip", "location=no,height=700,width=700,scrollbars=yes,status=yes");
		};
		
		function addTripDetailPopup(){
			
			//var tripDetailIdPopup = popup.document.getElementById("tripDetailId");
			//tripDetailIdPopup.value = document.getElementById("tripDetailId").value;
			
			//alert(tripDetailIdPopup);
			
			
			
		};
		
		function openTab() {
		    // Declare all variables
		    var i, tabContent, tabLinks;

		    // Get all elements with class="tabcontent" and hide them
		    tabContent = document.getElementsByClassName("tabContent");
		    for (i = 0; i < tabContent.length; i++) {
		        tabContent[i].style.display = "none";
		    }

		    // Get all elements with class="tablinks" and remove the class "active"
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }

		    // Show the current tab, and add an "active" class to the link that opened the tab
		    document.getElementById("scheduledTripTable").style.display = "block";
		    
		    
		};
		
		
		function openCostTab() {
		    // Declare all variables
		    var i, tabContent, tabLinks;

		    // Get all elements with class="tabcontent" and hide them
		    tabContent = document.getElementsByClassName("tabContent");
		    for (i = 0; i < tabContent.length; i++) {
		        tabContent[i].style.display = "none";
		    }

		    // Get all elements with class="tablinks" and remove the class "active"
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }

		    // Show the current tab, and add an "active" class to the link that opened the tab
		    document.getElementById("tripCostTable").style.display = "block";
		};
		
		function checkAll(){
			
			var checkVal = document.getElementById('checkall').checked;
			
			var checkBoxes = document.getElementsByClassName('tripcheck');
			
			for(i=0; i < checkBoxes.length; i++){
				
				checkBoxes[i].checked = checkVal;
			}
			
		};
		
		 $(document).ready(function()
				  {
				    $(".del-btn").click(function(){
				    	var tripId = $(this).closest('tr').find(".tripId").find("a").html();
				    	$("#id").val(tripId);
				    	
				    	confirm("Are you sure you want to delete this Trip?");
				    	
				    	if(confirm){
				    		$("#deleteTripForm").submit();
				    	}
				    });
				    
				    $(".tripId").click(function(){
				    	var tripId = $(this).find("a").html();
	
				    	var url = "viewTripDetails.html?tripDetailId=";
						var requestUrl = url.concat(tripId);
						popup = window.open(requestUrl, "Trip Details", "location=no,height=700,width=700,scrollbars=yes,status=yes");
						
				    	
				    });
				    
				    $(".tripName").click(function(){
				    	var tripId = $(this).closest('tr').find(".tripId").find("a").html();
	
				    	var url = "viewTripDetails.html?tripDetailId=";
						var requestUrl = url.concat(tripId);
						popup = window.open(requestUrl, "Trip Details", "location=no,height=700,width=700,scrollbars=yes,status=yes");
						
				    	
				    });
				    
				    $("#delete-selected-btn").click(function(){
				    	
				    	
				    	var all_tr_in_table = $("#tableScheduledTrip tr");
				    	
				    	
				    	var checkboxes = $(".tripcheck");
				    	
				    	var j = 0;
				    	var tripIdArray = "";
				    	
				    	for(i=0; i < checkboxes.length; i++){
				    		
				    		if(checkboxes[i].checked == true){
				    			
				    			
				    			var currTripId = $(checkboxes[i]).closest('tr').find(".tripId").find("a").html();
				    			tripIdArray = tripIdArray  + currTripId + ",";
				    			
				    			$("#id").val(tripIdArray);
				    			
				    			
				    
				    		}
				    		
				    	}
				    	
				    	confirm("Are you sure you want to delete selected trips?");
				    	
				    	if(confirm){
				    		$("#deleteTripForm").submit();
				    	}
				    });
				    
				   
		});
		 
		</script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="openTab()">

<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><b><span>Happy</span></b> <i><span id="heaven">Heaven</span></i></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="welcome.html" class="">Home</a></li>
                        <li><a href="#" class="">The Squad</a></li>
                       <!-- <li class=" dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Departments <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class=" dropdown">
                                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View Departments</a>
                                </li>
                                <li><a href="#">Add New</a></li>
                            </ul>
                        </li> 
                        <li><a href="#">Add New</a></li>
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Managers <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">View Managers</a></li>
                                <li><a href="#">Add New</a></li>
                            </ul>
                        </li> -->
                        <li class="active dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Squad Resources <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="openTripManager.html">Trip Assist</a></li>
                                <li><a href="#">Calendar</a></li>
                                <li><a href="#" onclick="window.open('http://www.secretsanta.com/')">Secret Santa Website</a></li>
                                <li><a href="#" onclick="window.open('http://www.skyscanner.com/')">Skyscanner Website</a></li>
                            </ul>
                        </li>
                        <!-- <li class=" down"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HR <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Change Time Entry</a></li>
                                <li><a href="#">Report</a></li>
                            </ul>
                        </li>-->
                       
                        <c:if test="${user.role eq 'admin'}">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manage Users<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a id="addUser" href="#" class="">Add/Update User</a></li>
                                <li><a id="deleteUser"href="#">Delete User</a></li>
                            </ul>
                        </li>
                       </c:if>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Signed in as <c:out value="${sessionScope.loggedInUser}"></c:out>
						<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Change Password</a></li>
                                <li><a href="#">My Profile</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="logout.html">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<div>

	<nav>
        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form"><br/>
                            <!-- <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>-->
                        </div>
                    </li>
                    <li>
                        <a href="#" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Item</a>
                            </li>
                            <li>
                                <a href="#">Third Level <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Item</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </nav>

    <!-- Page Content -->

	<div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Trip Assist Dashboard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-plane fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        
                                        <div><strong>My Scheduled Trips</strong></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick="openTab()">
                                <div class="tab-links panel-footer">
                                    <span class="pull-left">View/Create/Modify/Delete Trips</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-down"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                                
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-dollar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
        
                                        <div><strong>Cost Calculator</strong></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick="openCostTab()">
                                <div class="panel-footer">
                                    <span class="pull-left" >Track Payments and Costs</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-down"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-list-alt fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        
                                        <div><strong>My Checklist</strong></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Prepare For Your Trips</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-down"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-calendar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                       
                                        <div><strong>My Calendar</strong></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Your Calendar</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-down"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    
                    <!-- /.col-lg-8 -->
                   <form action="deleteTrip.html" method="post" id="deleteTripForm">
                   		<input type="hidden" name="tripId" value="" id="id"/>
                   </form>
                   <form action="viewTripDetails.html" method="get" id="tripDetailForm" target="Trip Details">
                   		<input type="hidden" name="tripDetailId" value="" id="tripDetailId"/>
                   </form>
                  
                    <div class="col-lg-12 tabContent" id="scheduledTripTable">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <i class="fa fa-hand-o-right fa-2x "></i> &nbsp;&nbsp;&nbsp; <strong>My Scheduled Trips (Click on ID or Name to View Details)</strong>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                            <div class="table-responsive">

                				
					              <table class="table table-bordred table-striped" id="tableScheduledTrip">
					                   
					                 <thead>
					                   <tr>
					                   <th><input type="checkbox" id="checkall" onclick="checkAll()"/></th>
					                   <th>Trip ID</th>
					                   <th>Trip Name</th>
					                    <th>Trip Start Date</th>
					                     <th>Trip End Date</th>
					                     <th>Organizer</th>
					                      <th>&nbsp;&nbsp;Edit</th>
					                      
					                       <th>&nbsp;Delete</th>
					                     </tr>
					                 </thead>
					    			<tbody>
										  <c:if test="${requestScope.trips != null}">
										   	<c:forEach items="${requestScope.trips}" var="trip">
										   	
										   	<tr>
										   		<td><input type="checkbox" class="checkthis tripcheck" /></td>
										   		<td class="tripId"><a href="#"><c:out value="${trip.id}"></c:out></a></td>
										   		<td class="tripName"><a href="#"><c:out value="${trip.tripName }"></c:out></a></td>
										   		<td><fmt:formatDate value="${trip.tripStartDate}" pattern="MM-dd-yyyy" /></td>
										   		<td><fmt:formatDate value="${trip.tripEndDate}" pattern="MM-dd-yyyy" /></td>
										   		<td><c:out value="${trip.tripOrganizer }"></c:out></td>
										   		<td><button class="btn btn-primary btn-xs"><div class="edit-button"><span class="glyphicon glyphicon-pencil"></span></div></button></td>
										    	<td><button class="btn btn-danger btn-xs del-btn"><span class="glyphicon glyphicon-trash"></span></button></td>
										   	</tr>
										   	</c:forEach>
										  </c:if>
					    			</tbody>
					    			
					    			</table>
					    		
					    		
					    		</div>
					    		
					    		
                                <!-- <div class="list-group">
                                	<div class="list-group-item">
                                		<div class="name-column"><i class="fa fa-comment fa-fw"></i> New Comment</div>
                            			<div class="name-column"><i class="fa fa-comment fa-fw"></i> New Comment</div>
                                	</div>
                                	
                                		
                                	
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                            <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                            <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                            <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                            <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                            <span class="pull-right text-muted small"><em>11:32 AM</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                            <span class="pull-right text-muted small"><em>11:13 AM</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                            <span class="pull-right text-muted small"><em>10:57 AM</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                            <span class="pull-right text-muted small"><em>9:49 AM</em>
                                            </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-money fa-fw"></i> Payment Received
                                            <span class="pull-right text-muted small"><em>Yesterday</em>
                                            </span>
                                    </a> -->
                                </div>
                                
                                
                                <!-- /.list-group -->
                                <!-- <a href="#" class="btn btn-default btn-block">View All Alerts</a> -->
                            </div>
                            <!-- /.panel-body -->
                            <div class="row">
                        
				                	<div class="col-xs-2 col-sm-2 col-md-2">
				                		
				                	
										<input type="submit" class="btn btn-lg btn-success btn-block" value="Create New Trip" onclick="javascript:addTripPopup()"/>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<input type="submit" class="btn btn-lg btn-danger btn-block" value="Delete Selected" id="delete-selected-btn"/>
									</div>
				                </div>
                        </div>
                        
                        <!-- /.panel -->
                        
                        <div class="col-lg-12 tabContent" id="tripCostTable">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <i class="fa fa-hand-o-right fa-2x "></i> &nbsp;&nbsp;&nbsp; <strong>Select a Trip to view Costs</strong>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                            <div class="table-responsive">

                
					              <table class="table table-bordred table-striped">
					                   
					                 <thead>
					                   <tr>
					                   <th><input type="checkbox" id="checkallcost" /></th>
					                   <th>Trip ID</th>
					                   <th>Trip Name</th>
					                    <th>Trip Start Date</th>
					                     <th>Trip End Date</th>
					                     <th>Organizer</th>
					                      <th>&nbsp;&nbsp;Edit</th>
					                      
					                       
					                     </tr>
					                 </thead>
					    			<tbody>
										  <c:if test="${requestScope.trips != null}">
										   	<c:forEach items="${requestScope.trips}" var="trip">
										   	<tr>
										   		<td><input type="checkbox" class="checkthis costcheck" /></td>
										   		<td><a href="#"><c:out value="${trip.id }"></c:out></a></td>
										   		<td><a href="#"><c:out value="${trip.tripName }"></c:out></a></td>
										   		<td><fmt:formatDate value="${trip.tripStartDate}" pattern="MM-dd-yyyy" /></td>
										   		<td><fmt:formatDate value="${trip.tripEndDate}" pattern="MM-dd-yyyy" /></td>
										   		<td><c:out value="${trip.tripOrganizer }"></c:out></td>
										   		<td><button class="btn btn-primary btn-xs"><div class="edit-button"><span class="glyphicon glyphicon-pencil"></span></div></button></td>
										    	
										   	</tr>
										   	</c:forEach>
										  </c:if>
					    			</tbody>
					    			
					    			</table>
					    		</div>
					    		
					    		
                               
                                </div>
                                
                            </div>
                            <!-- /.panel-body -->
                           
                        </div>
                        
                        <!-- /.panel -->
                        
                        <!-- /.panel .chat-panel -->
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                <!-- /.row -->
                
            
   

</div>





</body>
</html>

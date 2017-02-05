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
<title>Trip Details</title>

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
    
    <link rel="stylesheet" href="resources/css/tripDetail.css" />
    
    

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
		
		<script src="resources/js/tripDetail.js"></script>
		
		
</head>
<body>

        
            <div class="row"><br/></div>
                
                    
                    <div class="board-inner">
                    <ul class="nav nav-tabs" id="myTab">
                    
                     <li class="active">
                     <a href="#tripdetailsummary" data-toggle="tab" title="Trip Detail Summary">
                      <span class="round-tabs one">
                              <i class="glyphicon glyphicon-home"></i>
                      </span> 
                  </a></li>

                  <li><a href="#airtravel" data-toggle="tab" title="Air Travel">
                     <span class="round-tabs two">
                         <i class="glyphicon glyphicon-plane"></i>
                     </span> 
           </a>
                 </li>
                 <li><a href="#groundtravel" data-toggle="tab" title="Ground Travel">
                     <span class="round-tabs three">
                          <i class="fa fa-car"></i>
                     </span> </a>
                     </li>

                     <li><a href="#lodging" data-toggle="tab" title="Lodging">
                         <span class="round-tabs four">
                              <i class="fa fa-bed"></i>
                         </span> 
                     </a></li>

                     <li><a href="#comment" data-toggle="tab" title="Comments">
                         <span class="round-tabs five">
                              <i class="glyphicon glyphicon-comment"></i>
                         </span> </a>
                     </li>
                     
                     </ul></div>

                     <div class="tab-content">
                      <div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
    	<form action="viewTripDetails.html" method="post" id="tripDetailForm">
            <input type="hidden" name="tripDetailId" value="" id="tripDetailId"/>
        </form>
      <form:form class="form-horizontal" method="post" action="addOrUpdateTrip.html" onsubmit="submitForm();" modelAttribute="tripBean" name="tripForm">
        <fieldset>
			<form:hidden id="fromPage" name="fromPage" path="fromPage" value="${requestScope.fromPage}"></form:hidden>
          <!-- Form Name -->
          <h3>Trip Summary</h3>
		
			<hr class="colorgraph">
			
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Trip Name</label>
            <div class="col-sm-10">
              <form:input id="tripName"  name="tripName" path="tripName" type="text" placeholder="Trip Name" class="form-control"/>
              
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Trip Description</label>
            <div class="col-sm-10">
              <form:textarea id="tripDescription" name="tripDescription" path="tripDescription" placeholder="Trip Description" class="form-control" rows="4" cols="50"/>
            
            </div>
          </div>
          

          <!-- Text input-->
          <div class="form-group">
            <label class="col-lg-3 col-md-4 col-xs-3 control-label" for="textinput">Trip Start Date</label>
            <div class="col-lg-3 col-md-4 col-xs-6">
              <form:input id="tripStartDate" name="tripStartDate" path="tripStartDate" type="date" placeholder="Trip Start Date" class="form-control col-xs-3"/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-lg-6 col-md-4 col-xs-3 control-label" for="textinput">Trip End Date</label>
            <div class="col-lg-3 col-md-4 col-xs-6">
               <form:input id="tripEndDate" name="tripEndDate" path="tripEndDate" type="date" placeholder="Trip End Date" class="form-control"/>
              
            </div>

            
          </div>
           <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Invitee Emails</label>
            <div class="col-sm-10">
              <form:textarea path="emails" placeholder="Invitee Emails" class="form-control" rows="4" cols="50"/>
             
            </div>
          </div>
          
          
		<hr class="colorgraph">
          

        </fieldset>
      </form:form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
</div>
                      <div class="tab-pane fade" id="profile">
                          <h3 class="head text-center">Create a Bootsnipp<sup></sup> Profile</h3>
                          <p class="narrow text-center">
                              Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                          </p>
                          
                          <p class="text-center">
                    <a href="" class="btn btn-success btn-outline-rounded green"> create your profile <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                </p>
                          
                      </div>
                      <div class="tab-pane fade" id="messages">
                          <h3 class="head text-center">Bootsnipp goodies</h3>
                          <p class="narrow text-center">
                              Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                          </p>
                          
                          <p class="text-center">
                    <a href="" class="btn btn-success btn-outline-rounded green"> start using bootsnipp <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                </p>
                      </div>
                      <div class="tab-pane fade" id="settings">
                          <h3 class="head text-center">Drop comments!</h3>
                          <p class="narrow text-center">
                              Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                          </p>
                          
                          <p class="text-center">
                    <a href="" class="btn btn-success btn-outline-rounded green"> start using bootsnipp <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                </p>
                      </div>
                      <div class="tab-pane fade" id="doner">
  <div class="text-center">
    <i class="img-intro icon-checkmark-circle"></i>
</div>
<h3 class="head text-center">thanks for staying tuned! <span style="color:#f48260;"></span> Bootstrap</h3>
<p class="narrow text-center">
  Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
</p>
</div>
<div class="clearfix"></div>
</div>
</body>
</html>
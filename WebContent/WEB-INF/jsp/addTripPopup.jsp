<%@ include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
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
    <link rel="stylesheet" href="resources/css/login.css" />
    

    <!-- Custom Fonts -->
    <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
		<script src="resources/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JavaScript -->
		<script src="resources/js/bootstrap.min.js"></script>
		
		<!-- Metis Menu Plugin JavaScript -->
		<script src="resources/js/metisMenu.min.js"></script>
		
		<!-- Custom Theme JavaScript -->
		<script src="resources/js/startmin.js"></script>
		
		<script src="resources/js/happyheaven.js"></script>
		
		<script type="text/javascript">
			function submitForm(){
				
				document.getElementById('fromPage').value="Popup";
			    document.forms['tripForm'].submit();
			    
			}
			
			function checkFromPage(){
				
				var fromPage = document.getElementById('fromPage');
				if(fromPage.value == "Popup"){
					window.parent.opener.location.reload();
					window.close();
				}
			}
		
		</script>
		

</head>
<body onload="checkFromPage();">
<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form:form class="form-horizontal" method="post" action="addOrUpdateTrip.html" onsubmit="submitForm();" modelAttribute="tripBean" name="tripForm">
        <fieldset>
			<form:hidden id="fromPage" name="fromPage" path="fromPage" value="${requestScope.fromPage}"></form:hidden>
          <!-- Form Name -->
          <h3>Trip Details</h3>
		
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
            <label class="col-sm-2 control-label" for="textinput">Enter Invitee Emails (type emails on different lines)</label>
            <div class="col-sm-10">
              <form:textarea path="emails" placeholder="Invitee Emails" class="form-control" rows="4" cols="50"/>
             
            </div>
          </div>
          
          
		<hr class="colorgraph">
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                
                <button type="submit" class="btn btn-primary" onclick="closeSelf();">Add Trip</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form:form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
</div>
</body>
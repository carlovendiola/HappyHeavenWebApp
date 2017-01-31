<%@ include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/happyheaven.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/happyheaven.js"></script> 
<title>Happy Heaven Web App</title>
</head>
<body>

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
                        <li class="active"><a href="#" class="">Home</a></li>
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
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Squad Resources <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="openTripAssist.html">Trip Assist</a></li>
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
<div class="container">
	<table>
		<tr>
			<td><br/></td>
		</tr>
		<tr>
			<td><br/></td>
		</tr>
		<tr>
			<td><br/></td>
		</tr>
	</table>
</div>

<div class="side-bar-container">
    <!-- Indicators -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            
            <div class="item active">
                <img src="${pageContext.request.contextPath}/resources/13497845_10154952715249128_661765557681102131_o1.jpg" alt="Chania">
                <!-- <div class="carousel-caption">
                    <h3>Welcome to Happy Heaven!</h3>
                    <p>Details of Slide 2. Lorem Ipsum Blah Blah Blah....</p> 
                </div> -->
            </div>
            <div class="item">
            	
                <img src="${pageContext.request.contextPath}/resources/10624030_10154666122174128_7979748042711500524_o1.png" alt="Chania">
                <!-- <div class="carousel-caption">
                    <h3>Welcome to Happy Heaven!</h3>
                    <p>Details of Slide 3. Lorem Ipsum Blah Blah Blah....</p>
                </div>  -->
            </div>
            
            <div class="item">
            	
                <img src="${pageContext.request.contextPath}/resources/1480606_10154417755999128_661680707039212065_n1.jpg" alt="Chania">
                <!-- <div class="carousel-caption">
                    <h3>Welcome to Happy Heaven!</h3>
                    <p>Details of Slide 3. Lorem Ipsum Blah Blah Blah....</p>
                </div>  -->
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="fa fa-angle-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="fa fa-angle-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
    </div>
</div>

</body>
</html>
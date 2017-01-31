<%@ include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<title>Login</title>
</head>
<body>
	<div class="container">

		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		   
				<form:form id="loginForm" method="post" action="login.html" modelAttribute="loginBean">
					<fieldset>
						<h2>Please Sign In</h2>
						<hr class="colorgraph">
						<div class="form-group">
							<form:input id="userName" name="userName" path="userName" class="form-control input-lg" placeholder="Username"/><br/>
						</div>
						<div class="form-group">
							<form:input id="password" name="password" path="password" type="password" class="form-control input-lg" placeholder="Password"/><br/>
						</div>
						
						<c:if test="${requestScope.message != null}">
							<div class="isa_error">
							   <i class="fa fa-times-circle"></i>
							   <c:out value="${requestScope.message}">
								</c:out>
							</div>
							
						</c:if>
						
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-lg btn-success btn-block" value="Sign In"/>
							</div>
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</div>	
						
					</fieldset>
				</form:form>
			
			</div>
		</div>
	</div>
</body>
</html>
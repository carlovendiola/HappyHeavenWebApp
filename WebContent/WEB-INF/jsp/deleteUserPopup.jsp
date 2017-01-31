<%@ include file="include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Add User</title>
</head>
<body>
<form:form id="userBean" method="post" action="deleteUser.html" modelAttribute="userBean" onsubmit="return confirm('Are you sure?') ? true : false;">
	<div class="form-group">
		<form:input id="userName" name="userName" path="userName" class="form-control input-lg" placeholder="Username"/><br/>
	</div>
	<div class="row">
		<div class="col-xs-6 col-sm-6 col-md-6">
				<input type="submit" class="btn btn-lg btn-success btn-block" value="Sign In"/>
		</div>
		
	</div>
</form:form>


</body>
</html>
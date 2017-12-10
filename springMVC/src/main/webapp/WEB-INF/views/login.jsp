<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
<body onload='document.f.username.focus();'>
	<div class="container">
		<h2>Login with Username and Password</h2>
		<c:if test="${not empty logoutMsg}">
				<p class="text-success">${logoutMsg}</p>
		</c:if>
		<c:if test="${not empty errorMsg}">
				<p class="text-danger">${errorMsg}</p>
		</c:if>
		<form class="form-horizontal" name='f' action='<c:url value="/login"/>' method='POST'>
			<div class="form-group">
				<label class="control-label col-sm-2" for="username">Username:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="username"
						placeholder="Enter username" name="username">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">Password:</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="password"
						placeholder="Enter password" name="password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-10">
					<input type="submit" name="submit" value="Login" class="btn btn-default"/>
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</body>

</html>
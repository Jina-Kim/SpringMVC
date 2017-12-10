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
<title>Home</title>
</head>
<body>
	<div class="container">
	<h3>Menus</h3>
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/creditsemester">Academic Credits by Semester</a></li>
			<li><a href="${pageContext.request.contextPath}/credittype">Credits by Course Type</a></li>
			<li><a href="${pageContext.request.contextPath}/applycourse">Apply for 2018 - 1 Course</a></li>
			<li><a href="${pageContext.request.contextPath}/currentcourse">2018 - 1 Courses</a></li>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<li><a href="javascript:document.getElementById('logout').submit()">Logout</a></li>
			</c:if>
			<form id="logout" action="<c:url value="/logout" />" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</ul>
	</div>
</body>
</html>
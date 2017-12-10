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
<title>Credit By Type</title>
</head>
<body>
	<div class="container">
		<h2>Credits By Course Type</h2>
		<table class="table table-hover">
			<tr>
				<c:forEach var="course" items="${courses}">
					<th><c:out value="${course.type}"></c:out></th>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="course" items="${courses}">
					<td><c:out value="${course.credits}"></c:out></td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>
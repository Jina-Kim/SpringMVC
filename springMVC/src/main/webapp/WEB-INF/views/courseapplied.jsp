<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Course Applied</title>
</head>
<body>
	<div class="container">
		<h3>${course.title} course is applied successfully!</h3> 
		<a href="${pageContext.request.contextPath}/currentcourse" class="btn btn-info btn-block" role="button">
		Click here to view the courses you applied</a>
	</div>
</body>
</html>
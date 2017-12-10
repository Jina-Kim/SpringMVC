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
<title>Courses</title>
</head>
<body>
	<div class="container">
		<h2>Courses</h2>
		<table class="table table-hover">
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>교과코드</th>
				<th>교과목명</th>
				<th>구분</th>
				<th>학점</th>
			</tr>
			<c:forEach var="course" items="${courses}">
				<tr>
					<td><c:out value="${course.year}"></c:out></td>
					<td><c:out value="${course.semester}"></c:out></td>
					<td><c:out value="${course.code}"></c:out></td>
					<td><c:out value="${course.title}"></c:out></td>
					<td><c:out value="${course.type}"></c:out></td>
					<td><c:out value="${course.credit}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
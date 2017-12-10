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
<title>Credit By Semester</title>
</head>
<body>
	<div class="container">
	 <h2>Credits by Semester</h2>
		<table class="table table-hover">
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>이수 학점</th>
				<th>상세보기</th>
			</tr>
			<c:forEach var="course" items="${courses}">
				<tr>
					<td><c:out value="${course.year}"></c:out></td>
					<td><c:out value="${course.semester}"></c:out></td>
					<td><c:out value="${course.credits}"></c:out></td>
					<td>
					<a href="${pageContext.request.contextPath}/courses?year=${course.year}&semester=${course.semester}" class="btn btn-info btn-block" role="button">링크</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
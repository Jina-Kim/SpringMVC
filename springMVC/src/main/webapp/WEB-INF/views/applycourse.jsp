<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
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
<title>Apply Course</title>
</head>
<body>
	<div class="container">
		<h2>Apply Course for 2018 1st semester</h2>
		<sf:form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/doapply" modelAttribute="course">

			<div class="form-group">
				<label class="control-label col-sm-2" for="code">Code:</label>
				<div class="col-sm-3">
					<sf:input type="text" class="form-control" id="code"
						placeholder="Enter code" name="code" path="code"/>
				</div>
				<sf:errors class="col-sm-offset-2 col-sm-10 text-danger" path="code" />
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">Title:</label>
				<div class="col-sm-3">
					<sf:input type="text" class="form-control" id="title"
						placeholder="Enter title" name="title" path="title"/>
				</div>
				<sf:errors class="col-sm-offset-2 col-sm-10 text-danger" path="title" />
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="type">Type:</label>
				<div class="col-sm-3">
					<sf:input type="text" class="form-control" id="type"
						placeholder="Enter type" name="type" path="type"/>
				</div>
				<sf:errors class="col-sm-offset-2 col-sm-10 text-danger" path="type" />
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="semester">Credit:</label>
				<div class="col-sm-3">
					<sf:input type="text" class="form-control" id="credit"
						placeholder="Enter credit" name="credit" path="credit"/>
				</div>
				<sf:errors class="col-sm-offset-2 col-sm-10 text-danger" path="credit" />
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-10">
					<input type="submit" value="Apply" class="btn btn-default"/>
				</div>
			</div>
		</sf:form>
	</div>
	
</body>
</html>
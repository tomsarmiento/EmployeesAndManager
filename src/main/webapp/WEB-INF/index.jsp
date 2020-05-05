<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<title>Index</title>
</head>
<body>
	<div class="container" style="display: flex; margin: 20px;">
		<div>
			<h3>Create manager</h3>
			<form:form action="/newmanager" method="get"
				modelAttribute="employee">
				<p class="form-group">
					<form:label path="firstName">First name:</form:label>
					<form:input path="firstName" class="form-control" />
					<form:errors path="firstName" />
				</p>
				<p class="form-group">
					<form:label path="lastName">Last name:</form:label>
					<form:input path="lastName" class="form-control" />
					<form:errors path="lastName" />
				</p>
				<input type="submit" value="Submit"
					class="form-control btn btn-outline-primary" />
			</form:form>
		</div>
		<div style="margin-left: 50px;">
			<h3>Create employee</h3>
			<form:form action="/newemployee" method="get"
				modelAttribute="employee">
				<p class="form-group">
					<form:label path="firstName">First name:</form:label>
					<form:input path="firstName" class="form-control" />
					<form:errors path="firstName" />
				</p>
				<p class="form-group">
					<form:label path="lastName">Last name:</form:label>
					<form:input path="lastName" class="form-control" />
					<form:errors path="lastName" />
				</p>
				<p class="form-group">
					<form:label path="manager">Manager:</form:label>
					<form:select path="manager" class="form-control">
						<form:option value="null" label="Please select" />
						<form:options items="${managers}" itemValue="id"
							itemLabel="firstName" />
					</form:select>
					<form:errors path="manager" />
				</p>
				<input type="submit" value="Submit"
					class="form-control btn btn-outline-primary" />
			</form:form>
		</div>
		<div style="margin-left: 50px;position: relative;height: 300px;width:700px;overflow-x: scroll;border:0.5px solid #D9CFCB;" class="table-wrapper-scroll-x my-custom-scrollbar">
			<table class="tablita table table-hover" style="overflow-x:scroll;">
							<h5 style="display:inline-block; margin:6px;">Manager</h5>
							<h5 style="display:inline-block; margin-left:200px;">Employees</h5>
							<hr style="margin-bottom:-1px; margin-left:3%;width:90%;">		
				<tbody>
					<c:forEach var="employeelist" items="${employees}" varStatus="outerLoop">
						<tr>
								
							<th><c:out value="${managers[outerLoop.index].firstName } ${managers[outerLoop.index].lastName }" /></th>
							<c:forEach var="employee" items="${employeelist}" varStatus="innerloop">
								
								<td><c:out value="${employee.firstName} ${employee.lastName}" /></td>
							</c:forEach>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
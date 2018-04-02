<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="change.pwd.title" /></title>
</head>
<body>
	<form:form>
		<p>
			<label><spring:message code="photo" />:<br> <form:button
					path="photo" /> <form:errors path="photo" /> </label>
		</p>
		<p>
			<label><spring:message code="name" />:<br> <form:textarea
					path="name" /> <form:errors path="name" /> </label>
		</p>
		<p>
			<label><spring:message code="currentPassword" />:<br> <form:password
					path="currentPassword" /> <form:errors path="currentPassword" /> </label>
		</p>
		<p>
			<label><spring:message code="newPassword" />:<br> <form:password
					path="newPassword" /> <form:errors path="newPassword" /> </label>
		</p>
		<p>
			<label><spring:message code="email" />:<br> <form:password
					path="email" /> <form:errors path="email" /> </label>
		</p>
		<p>
			<label><spring:message code="introduce" />:<br> <form:textarea
					path="introduce" /> <form:errors path="introduce" /> </label>
		</p>
		<input type="submit" value="<spring:message code="change.btn" />">
	</form:form>
</body>
</html>
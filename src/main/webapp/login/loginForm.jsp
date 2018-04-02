<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="login.title" /></title>
</head>
<body>
	<form:form commandName="loginCommand" action="login">
		<form:errors />
		<p>
			<label><spring:message code="id" />:<br> <form:input
					path="id" /> <form:errors path="id" /> </label>
		</p>
		<p>
			<label><spring:message code="password" />:<br> <form:password
					path="password" /> <form:errors path="password" /> </label>
		</p>
		<p>
			<label><spring:message code="rememberId" />: <form:checkbox
					path="rememberId" /> </label>
		</p>
		<input type="submit" value="<spring:message code="login.btn" />">
	</form:form>
	<a href="./register/step1">회원가입</a>
	<a href="./find/findId">ID 찾기</a>
	<a href="./find/findPass">비번 찾기</a>
	<a href="./main">메인 바로가기</a>
</body>
</html>
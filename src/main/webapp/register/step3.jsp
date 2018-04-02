<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
	<p><strong><spring:message code="register.don" 
	arguments="${registerRequest.name}" />
	</strong></p>
	<p><a href="<c:url value='/main'/>">[첫 화면 이동]</a></p>
</body>
</html>
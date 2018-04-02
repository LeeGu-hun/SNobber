<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
</head>
<body>
	<h2><spring:message code="term" /></h2>
	<p><spring:message code="term" /> 내용 입니다.</p>
	<form action="step2" method="post">
		<label> <input type="checkbox" name="agree" value="true">
			<spring:message code="term.agree" />
		</label> <input type="submit" value="다음 단계" />
	</form>
</body>
</html>
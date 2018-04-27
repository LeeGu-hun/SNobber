<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
	<div><%@include file="../include/joinHeader.jsp"%></div>
	<div>
		<p>
			<spring:message code="register.done" />
		</p>
		축하합니다. SNobber의 가족이 되셨습니다.<br>
		이곳에서 당신의 능력을 마음껏 발휘해주세요!
		<p>
			<a href="<c:url value='/'/>">[첫 화면 이동]</a>
		</p>
	</div>
	<div>

		<%@ include file="/include/footer.jsp"%>

	</div>
</body>
</html>
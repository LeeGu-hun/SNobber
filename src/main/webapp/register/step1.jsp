<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
</head>
<body>
<div>
<div><%@include file="../include/joinHeader.jsp" %></div>
	<div style="margin-left:100px;">
	<h2>
		<spring:message code="term" />
	</h2>
	
		
		<textarea rows="20" cols="50" disabled="disabled">
		SNobber의 약관내용입니다.
		SNobber는 자신의 자신의 능력을 보여주며 함께 즐길 수 있는 곳으로 개인간 사건에 대한 형사상 책임은 없습니다.
		해당 약관을 잘 읽어보시고 동의하신다면 체크바랍니다.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vulputate lorem ut blandit. Morbi convallis, arcu ut volutpat porta, nibh ex consectetur lectus, eu commodo sem lacus rutrum ex. Cras consequat, sem a semper tristique, est nisi pellentesque metus, sit amet ullamcorper odio enim ut nunc. Aliquam blandit sapien eu nibh ornare tempor. Fusce a urna porta, aliquet sem et, cursus turpis. Nam id sollicitudin augue. Morbi eu mattis sem, ac sodales turpis. Pellentesque in lorem et ex sagittis lacinia. Praesent feugiat, tellus vitae feugiat iaculis, enim nulla aliquet nulla, in blandit nisi sapien quis lorem.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vulputate lorem ut blandit. Morbi convallis, arcu ut volutpat porta, nibh ex consectetur lectus, eu commodo sem lacus rutrum ex. Cras consequat, sem a semper tristique, est nisi pellentesque metus, sit amet ullamcorper odio enim ut nunc. Aliquam blandit sapien eu nibh ornare tempor. Fusce a urna porta, aliquet sem et, cursus turpis. Nam id sollicitudin augue. Morbi eu mattis sem, ac sodales turpis. Pellentesque in lorem et ex sagittis lacinia. Praesent feugiat, tellus vitae feugiat iaculis, enim nulla aliquet nulla, in blandit nisi sapien quis lorem.
		</textarea>
	
	<form action="step2" method="post">
		<label> <input type="checkbox" name="agree" value="true">
			<spring:message code="term.agree" />
		</label> <input type="submit" value="다음 단계" />
	</form>
	</div>
<div>

		<%@ include file="/include/footer2.jsp"%>

	</div>
</div>
</body>
</html>